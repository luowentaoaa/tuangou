//
//  LLGoodsCell.h
//  团购
//
//  Created by luowentao on 2020/2/29.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLGoods.h"
NS_ASSUME_NONNULL_BEGIN

@interface LLGoodsCell : UITableViewCell

@property (nonatomic,strong)LLGoods *goods;


+(instancetype)goodsCellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
