

# YXKShowSystemAlert

一句话调用的，封装的系统的弹窗提示。

##### 安装

1. 在 Podfile 中添加 `pod 'YXKShowSystemAlert'`。
2. 执行 `pod install` 或 `pod update`。
3. 导入 `ShowAlert.h`。

#### 实现弹窗提示的方法调用如下：

##### 在你需要用到弹窗提示的地方引入该头文件。
```objective-c
#import "ShowAlert.h"
```

###### 1.短暂的弹窗提示。
```objective-c
[CECDataAlert showTipsForALittleTime:@"这个是短暂的弹窗提示"
                                titleMessage:@"短暂弹窗提示"];
```


###### 2.仅有确定按钮的弹窗提示。
```objective-c
[CECDataAlert showConfirmAlertView:@"这是个需要点击确定才会消失的弹窗提示。"
                              titleMessage:@"确定弹窗提示"
                                 tureBlock:^{
                                     NSLog("点击了唯一的确定。");
                                 }];
```

###### 3.既有确定，又有取消按钮的弹窗提示。
```objective-c
[CECDataAlert showConfirmAndCancleAlertView:@"这是个点击确定和取消都会消失的弹窗提示。并会改变背景颜色"
                                       titleMessage:@""
                                          tureBlock:^{
                                              NSLog("点击了确定。");
                                          }
                                         falseBlock:^{
                                             NSLog("点击了取消。");
                                         }];
```

###### 4. 拍照、上传照片、取消 弹窗提示。

```objective-c
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
```



***

# 按钮的创建方法调用如下：

##### 首先，将```CustomBtn```这个文件夹里的.h、.m文件拖到你的工程里。
##### 然后，在需要创建按钮的地方，引入该头文件
```objective-c
#import "UIFactoryButton.h"
```
###### 创建按钮示例：
```objective-c
UIFactoryButton *firstButton = [UIFactoryButton createUIFactoryButton];
firstButton.frame = CGRectMake((self.view.frame.size.width - 150) / 2, 300, 150, 45);
firstButton.layer.cornerRadius = 5.f;
firstButton.clipsToBounds = YES;
firstButton.backgroundColor = [UIColor blackColor];
[firstButton setTitle:@"第一个按钮" forState:UIControlStateNormal];
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
```

***

###### 具体效果，请运行代码查看。
