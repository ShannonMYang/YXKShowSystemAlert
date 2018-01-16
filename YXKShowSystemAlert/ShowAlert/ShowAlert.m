//
//  ShowAlert.m
//  XKShowSystemAlert
//
//  Created by Shannon MYang on 2018/1/16.
//  Copyright © 2018年 Shannon MYang. All rights reserved.
//

#import "ShowAlert.h"

@implementation ShowAlert

#pragma mark - 需要确定的弹窗提示
+ (void)showConfirmAlertView:(NSString *)showMessage
                titleMessage:(NSString *)titleMessage
                   tureBlock:(void(^)(void))tureAction {
    
    UIAlertController *alertController = [self alertShow:showMessage
                                               titleName:titleMessage
                                             actionBlock:tureAction];
    //弹窗显示
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController
                                                                                 animated:YES
                                                                               completion:nil];
}

+ (UIAlertController *)alertShow:(NSString *)messageString
                       titleName:(NSString *)titleString
                     actionBlock:(void (^)(void))actionBlock {
    //  创建弹窗提醒
    //  初始化提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:titleString
                                                                   message:messageString
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    //  UIAlertControllerStyleActionSheet   //弹窗位于底部位置
    //  UIAlertControllerStyleAlert         //弹窗位于居中位置
    [alert addAction:[UIAlertAction actionWithTitle:@"确定"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
                                                if (actionBlock) {
                                                    actionBlock();
                                                }
                                            }]];
    
    return alert;
}

#pragma mark - 有确定、有取消的弹窗提示
+ (void)showConfirmAndCancleAlertView:(NSString *)showMessage
                         titleMessage:(NSString *)titleMessage
                            tureBlock:(void(^)(void))tureAction
                           falseBlock:(void(^)(void))falseAction {
    
    UIAlertController *alertController = [self alertShowConfirmAndCancle:showMessage
                                                               titleName:titleMessage
                                                      confirmActionBlock:tureAction
                                                       cancleActionBlock:falseAction];
    //弹窗显示
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController
                                                                                 animated:YES
                                                                               completion:nil];
}

+ (UIAlertController *)alertShowConfirmAndCancle:(NSString *)showMessage
                                       titleName:(NSString *)titleName
                              confirmActionBlock:(void(^)(void))yesActionBlock
                               cancleActionBlock:(void(^)(void))noAvtionBlock {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:titleName
                                                                   message:showMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定"
                                              style:UIAlertActionStyleDefault
                                            handler:^(UIAlertAction * _Nonnull action) {
                                                if (yesActionBlock) {
                                                    yesActionBlock();
                                                }
                                            }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"取消"
                                              style:UIAlertActionStyleCancel
                                            handler:^(UIAlertAction * _Nonnull action) {
                                                if (noAvtionBlock) {
                                                    noAvtionBlock();
                                                }
                                            }]];
    
    return alert;
}

#pragma mark - 短时间展示弹窗提示并自动消失
+ (void)showTipsForALittleTime:(NSString *)tipsString
                  titleMessage:(NSString *)titleMessage {
    
    [self showErrorWithStr:tipsString
               titleString:titleMessage];
    
}

/**
 * 展示出弹窗
 */
+ (void)showErrorWithStr:(NSString *)errorMessageString
             titleString:(NSString *)titleString {
    
    UIAlertController *loginErrorOneAlert = [self alertShowALittleTime:errorMessageString
                                                             titleName:titleString];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:loginErrorOneAlert
                                                                                 animated:YES
                                                                               completion:nil];
    [self createNSTimer:loginErrorOneAlert];
}

/**
 * 弹窗所显示的消息
 */
+ (UIAlertController *)alertShowALittleTime:(NSString *)showMessage
                                  titleName:(NSString *)titleName {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:titleName
                                                                   message:showMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    return alert;
}

/**
 * 创建NSTimer
 */
+ (void)createNSTimer:(id)userInfo {
    //指定其在多久内消失掉
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(creatAlert:)
                                   userInfo:userInfo
                                    repeats:NO];
}

/**
 * 创建NSTimer的触发事件
 */
+ (void)creatAlert:(NSTimer *)timer {
    
    UIAlertController *alert = [timer userInfo];
    [alert dismissViewControllerAnimated:YES
                              completion:nil];
    alert = nil;
}

#pragma mark - 底部弹窗提示，用于上传头像的

+ (void)showClickUserHeadImage:(NSString *)showMessage
                  titleMessage:(NSString *)titleMessage
                   cancleBlock:(void(^)(void))cancle
                takePhotoBlock:(void(^)(void))takePhoto
               clickPhotoBlock:(void(^)(void))clickPhoto {
    
    UIAlertController *alert = [self alertShowTakePhotoAndClickPhoto:showMessage
                                                           titleName:titleMessage
                                                         cancleBlock:cancle
                                                      takePhotoBlock:takePhoto
                                                     clickPhotoBlock:clickPhoto];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert
                                                                                 animated:YES
                                                                               completion:nil];
}

+ (UIAlertController *)alertShowTakePhotoAndClickPhoto:(NSString *)messageString
                                             titleName:(NSString *)titleString
                                           cancleBlock:(void(^)(void))cancle
                                        takePhotoBlock:(void (^)(void))takePhoto
                                       clickPhotoBlock:(void(^)(void))clickPhoto {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:nil
                                                                      preferredStyle: UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancle) {
            cancle();
        }
    }];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (takePhoto) {
            takePhoto();
        }
    }];
    
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"从相册中选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (clickPhoto) {
            clickPhoto();
        }
    }];
    
    [alertController addAction:cancelAction];  //取消
    [alertController addAction:deleteAction];  //拍照
    [alertController addAction:archiveAction];  //从相册选取
    
    return alertController;
}


@end
