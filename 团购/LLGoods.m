//
//  LLGoods.m
//  团购
//
//  Created by luowentao on 2020/2/29.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import "LLGoods.h"

@implementation LLGoods

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self =[super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)goodsWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
