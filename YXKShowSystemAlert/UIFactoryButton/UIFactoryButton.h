//
//  UIFactoryButton.h
//  XKShowSystemAlert
//
//  Created by Shannon MYang on 2018/1/16.
//  Copyright © 2018年 Shannon MYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIFactoryButton;

@interface UIFactoryButton : UIButton

/** Block声明 */
@property (nonatomic, copy) void(^UIFactoryButtonClickBlock)(UIFactoryButton *btn);

+ (instancetype)createUIFactoryButton;

@end
