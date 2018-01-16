//
//  UIFactoryButton.m
//  XKShowSystemAlert
//
//  Created by Shannon MYang on 2018/1/16.
//  Copyright © 2018年 Shannon MYang. All rights reserved.
//

#import "UIFactoryButton.h"

@implementation UIFactoryButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)click:(UIFactoryButton *)btn
{
    if (_UIFactoryButtonClickBlock) {
        _UIFactoryButtonClickBlock(btn);
    }
}

+ (instancetype)createUIFactoryButton
{
    return [UIFactoryButton buttonWithType:UIButtonTypeCustom];
}

@end
