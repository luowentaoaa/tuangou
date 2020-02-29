//
//  LLFooterView.m
//  团购
//
//  Created by luowentao on 2020/2/29.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import "LLFooterView.h"

@interface LLFooterView()
- (IBAction)btnOnClick;
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *wait;
@property (weak, nonatomic) IBOutlet UIButton *btn;



@end

@implementation LLFooterView

-(void)setDelegate:(id<LLFooterViewDelegate>)delegate{
    _delegate=delegate;
}


- (IBAction)btnOnClick:(UIButton *)sender {
    self.btn.hidden=YES;
    self.wait.hidden=NO;
    self.Label.hidden=NO;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if([self.delegate respondsToSelector:@selector(footerViewDidClickLoadBtn:)]){
            [self.delegate footerViewDidClickLoadBtn:self];
        }
        self.btn.hidden=NO;
        self.wait.hidden=YES;
        self.Label.hidden=YES;
    });
    
}
+(instancetype)footerView{
    UINib *nib = [UINib nibWithNibName:@"LLFooterView" bundle:nil];
    LLFooterView *footerView = [[nib instantiateWithOwner:nil options:nil]firstObject];
    return footerView;
}
@end
