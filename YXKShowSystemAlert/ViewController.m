//
//  ViewController.m
//  YXKShowSystemAlert
//
//  Created by Shannon MYang on 2018/1/16.
//  Copyright © 2018年 Shannon MYang. All rights reserved.
//

#import "ViewController.h"

#import "ShowAlert.h"
#import "UIFactoryButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self prepareUIControl];
}

- (void)prepareUIControl
{
    [self createFirstButton];  // 创建第一个Button
    [self createSecondButton];  // 创建第二个Button
    [self createThirdButton];  // 创建第三个Button
    [self createFourthButton];  // 创建第四个Button
}

- (void)createFirstButton
{
    UIFactoryButton *firstButton = [UIFactoryButton createUIFactoryButton];
    firstButton.frame = CGRectMake((self.view.frame.size.width - 150) / 2, 130, 150, 45);
    firstButton.layer.cornerRadius = 5.f;
    firstButton.clipsToBounds = YES;
    firstButton.backgroundColor = [UIColor orangeColor];
    [firstButton setTitle:@"第一个按钮" forState:UIControlStateNormal];
    [self.view addSubview:firstButton];
    
    firstButton.UIFactoryButtonClickBlock = ^(UIFactoryButton *btn) {
        [ShowAlert showTipsForALittleTime:@"这是个短暂的弹窗提示" titleMessage:@"提示"];
    };
}

- (void)createSecondButton
{
    UIFactoryButton *secondButton = [UIFactoryButton createUIFactoryButton];
    secondButton.frame = CGRectMake((self.view.frame.size.width - 150) / 2, 215, 150, 45);
    secondButton.layer.cornerRadius = 5.f;
    secondButton.clipsToBounds = YES;
    secondButton.backgroundColor = [UIColor blueColor];
    [secondButton setTitle:@"第二个按钮" forState:UIControlStateNormal];
    secondButton.UIFactoryButtonClickBlock = ^(UIFactoryButton *btn) {
        [ShowAlert showConfirmAlertView:@"弹窗提醒已成功弹出" titleMessage:@"提示" tureBlock:^{
            // Do Something
            // Do Nothing
        }];
    };
    [self.view addSubview:secondButton];
}

- (void)createThirdButton
{
    UIFactoryButton *firstButton = [UIFactoryButton createUIFactoryButton];
    firstButton.frame = CGRectMake((self.view.frame.size.width - 150) / 2, 300, 150, 45);
    firstButton.layer.cornerRadius = 5.f;
    firstButton.clipsToBounds = YES;
    firstButton.backgroundColor = [UIColor blackColor];
    [firstButton setTitle:@"第三个按钮" forState:UIControlStateNormal];
    firstButton.UIFactoryButtonClickBlock = ^(UIFactoryButton *btn) {
        [ShowAlert showConfirmAndCancleAlertView:@"这是一个取消和确定并存的弹窗提示" titleMessage:@"提示" tureBlock:^{
            // Do Something
            // Do Nothing
        } falseBlock:^{
            // Do Something
            // Do Nothing
        }];
    };
    [self.view addSubview:firstButton];
}

- (void)createFourthButton
{
    UIFactoryButton *firstButton = [UIFactoryButton createUIFactoryButton];
    firstButton.frame = CGRectMake((self.view.frame.size.width - 150) / 2, 385, 150, 45);
    firstButton.layer.cornerRadius = 5.f;
    firstButton.clipsToBounds = YES;
    firstButton.backgroundColor = [UIColor purpleColor];
    [firstButton setTitle:@"第四个按钮" forState:UIControlStateNormal];
    firstButton.UIFactoryButtonClickBlock = ^(UIFactoryButton *btn) {
        [ShowAlert showClickUserHeadImage:@"说点什么" titleMessage:@"提示" cancleBlock:^{
            // Do Something
            // Do Nothing
        } takePhotoBlock:^{
            // Do Something
            // Do Nothing
        } clickPhotoBlock:^{
            // Do Something
            // Do Nothing
        }];
    };
    [self.view addSubview:firstButton];
}


@end
