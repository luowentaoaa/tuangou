//
//  LLGoods.h
//  团购
//
//  Created by luowentao on 2020/2/29.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLGoods : NSObject

@property(nonatomic,copy)NSString *buyCount;
@property(nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)goodsWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
