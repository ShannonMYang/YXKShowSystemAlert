//
//  ShowAlert.h
//  XKShowSystemAlert
//
//  Created by Shannon MYang on 2018/1/16.
//  Copyright © 2018年 Shannon MYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ShowAlert : NSObject

/**
 * 弹窗提醒，有点击动作，有方法调用的
 */
+ (void)showConfirmAlertView:(NSString *)showMessage
                titleMessage:(NSString *)titleMessage
                   tureBlock:(void(^)(void))tureAction;

/**
 * 弹窗提醒，确定会触动方法，取消不会
 */
+ (void)showConfirmAndCancleAlertView:(NSString *)showMessage
                         titleMessage:(NSString *)titleMessage
                            tureBlock:(void(^)(void))tureAction
                           falseBlock:(void(^)(void))falseAction;

/**
 * 短暂弹窗提示，仅仅提示而已
 */
+ (void)showTipsForALittleTime:(NSString *)tipsString
                  titleMessage:(NSString *)titleMessage;

/**
 * 底部弹窗提示，用于上传头像的
 */
+ (void)showClickUserHeadImage:(NSString *)showMessage
                  titleMessage:(NSString *)titleMessage
                   cancleBlock:(void(^)(void))cancle
                takePhotoBlock:(void(^)(void))takePhoto
               clickPhotoBlock:(void(^)(void))clickPhoto;

@end
