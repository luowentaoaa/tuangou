//
//  ViewController.m
//  团购
//
//  Created by luowentao on 2020/2/29.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import "ViewController.h"
#import "LLGoods.h"
#import "LLFooterView.h"
#import "LLGoodsCell.h"
#import "LLHeaderView.h"
@interface ViewController ()<UITableViewDataSource,LLFooterViewDelegate
,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *goods;
@property(nonatomic,strong)UITableView *tableView;


@end

@implementation ViewController
#pragma mark - 懒加载

-(void)footerViewDidClickLoadBtn:(LLFooterView *)footerView{
    LLGoods *cell=[[LLGoods alloc]init];
    cell.title=@"吃饭";
    cell.price=@"111";
    cell.buyCount=@"0";
    cell.icon=@"2c97690e72365e38e3e2a95b934b8dd2";
    [self.goods addObject:cell];
    [self.tableView reloadData];
}

-(NSArray *)goods{
    if(_goods==nil){
        NSString *path=[[NSBundle mainBundle]pathForResource:@"tgs.plist" ofType:nil];
        NSArray *arrayDict =[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels=[NSMutableArray array];
        for(NSDictionary *dict in arrayDict){
            LLGoods *a=[LLGoods goodsWithDict:dict];
            [arrayModels addObject:a];
        }
        _goods=arrayModels;
    }
    return _goods;
}
#pragma mark - tableView的接口函数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.goods.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LLGoods *model=self.goods[indexPath.row];

    LLGoodsCell *cell=[LLGoodsCell goodsCellWithTableView:tableView];
    cell.goods=model;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LLGoods *good=self.goods[indexPath.row];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"点餐" message:[[NSString alloc]initWithFormat:@"请问需要几份%@",good.title] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *conform=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
           //1,获取文本框中的内容
           //2.相加
           //3.刷新tableView
            NSString *num1=alert.textFields[0].text;
            NSString *num2=good.buyCount;
            int a=num1.intValue,b=num2.intValue;
        good.buyCount=[[NSString alloc]initWithFormat:@"%d",a+b ];
           
        //   [self.tableView reloadData]; //全部刷新
           [ self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
           
       }];
       
       UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
           NSLog(@"点击了取消按钮");
       }];
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"请填写需要几份";
            textField.text=@"1";
            textField.keyboardType=UIKeyboardTypePhonePad;
        }];
        
        [alert addAction:conform];
        [alert addAction:cancel];
    
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - ScrollView的函数


#pragma mark - 隐藏状态栏

-(BOOL)prefersStatusBarHidden{
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.rowHeight=67;
    
    LLFooterView *footer=[LLFooterView footerView];
    self.tableView.tableFooterView=footer;
    footer.delegate=self;
    
    self.tableView.tableHeaderView=[LLHeaderView headerView];

}

@end
