//
//  LLFooterView.h
//  团购
//
//  Created by luowentao on 2020/2/29.
//  Copyright © 2020 luowentao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLFooterView;

@protocol LLFooterViewDelegate <NSObject>

@optional
//@required
// - (void)loadMoreData;

-(void)footerViewDidClickLoadBtn:(LLFooterView *)footerView;
@end


@interface LLFooterView : UIView

// @property (nonatomic, strong) NJViewController *controller;

@property (nonatomic, weak) id<LLFooterViewDelegate> delegate;
+(instancetype)footerView;
@end
