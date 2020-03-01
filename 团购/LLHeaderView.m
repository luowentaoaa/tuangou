//
//  LLHeaderView.m
//  团购
//
//  Created by luowentao on 2020/2/29.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import "LLHeaderView.h"

@interface LLHeaderView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *page;
@property(strong,nonatomic)NSTimer *timer;

@end

@implementation LLHeaderView

+(instancetype)headerView{
    return [[[NSBundle mainBundle]loadNibNamed:@"LLHeaderView" owner:nil options:nil]firstObject];
}
-(void)setScrollViewDelegate:(id<UIScrollViewDelegate>)delegate{
    self.scrollView.delegate=delegate;
}
-(void)awakeFromNib{
    NSLog(@"awakeFromNib");
    [super awakeFromNib];
    CGFloat imgW=380;
    CGFloat imgH=125;
    CGFloat imgY=0;
    for(int i=0;i<=4;i++){
        UIImageView *imgView=[UIImageView new];
        imgView.image=[UIImage imageNamed:[NSString stringWithFormat:@"ad_%02d",i]];
        
        CGFloat imgX=i*imgW;
        imgView.frame=CGRectMake(imgX, imgY, imgW, imgH);
        [self.scrollView addSubview:imgView];
    }
    self.scrollView.contentSize=CGSizeMake(self.scrollView.frame.size.width*5,0);
    
    //实现分页效果
     self.scrollView.pagingEnabled=YES;
     
     // 隐藏水平滚动
     self.scrollView.showsHorizontalScrollIndicator=NO;
    
    self.page.numberOfPages=5;
    self.page.currentPage=0;
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    self.scrollView.delegate=self;
    
}
#pragma mark - 轮播
-(void)scrollImage{
    NSInteger nowpage=self.page.currentPage;
    if (nowpage==self.page.numberOfPages-1){
        nowpage=0;
    }
    else{
        nowpage++;
    }
   // NSLog(@"%d",nowpage);
    CGFloat offerX=nowpage*self.scrollView.frame.size.width;
    
    [self.scrollView setContentOffset:CGPointMake(offerX, 0) animated:YES];
    self.page.currentPage=nowpage;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"滚");
    CGFloat x=scrollView.contentOffset.x;
    x+=scrollView.frame.size.width*0.5;
    int idx=x/scrollView.frame.size.width;
    self.page.currentPage=idx;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //计时器已停止就不能再重用了！必须创建一个新的计时器
    NSLog(@"die");
    [self.timer invalidate];
    self.timer=nil;
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
       
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}
@end
