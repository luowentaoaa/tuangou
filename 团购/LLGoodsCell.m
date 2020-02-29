//
//  LLGoodsCell.m
//  团购
//
//  Created by luowentao on 2020/2/29.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import "LLGoodsCell.h"

@interface LLGoodsCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblBuyCount;


@end

@implementation LLGoodsCell

-(void)setGoods:(LLGoods *)goods{
    _goods=goods;
    self.imageIcon.image=[UIImage imageNamed:goods.icon];
    self.lblTitle.text=goods.title;
    self.lblPrice.text=[NSString stringWithFormat:@"¥ %@",goods.price];
    self.lblBuyCount.text=[NSString stringWithFormat:@"%@ 人已购买",goods.buyCount];
}

+ (instancetype)goodsCellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"goods_cell";
    LLGoodsCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if(cell==nil){
        cell=[[[NSBundle mainBundle]loadNibNamed:@"LLGoodsCell" owner:nil options:nil]firstObject];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
