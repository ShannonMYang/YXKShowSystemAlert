# YXKShowSystemAlert
一句话调用的，封装的系统的弹窗提示。

# 实现弹窗提示的方法调用如下：

##### 首先，将```PopUpTips```这个文件夹里的.h、.m文件拖到你的工程里。
##### 然后，在你需要用到弹窗提示的地方引入该头文件。
```objective-c
#import "CECDataAlert.h"
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

***

# 按钮的创建方法调用如下：

##### 首先，将```CustomBtn```这个文件夹里的.h、.m文件拖到你的工程里。
##### 然后，在需要创建按钮的地方，引入该头文件
```objective-c
#import "CECDataCustomButton.h"
```
##### 因为，此处还用了Masonry布局。请用Cocoapods自行导入该库。
##### 引入头文件，使Masonry生效。
```objective-c
#import "Masonry.h"
```
###### 创建按钮示例：
```objective-c
    CECDataCustomButton *firstBtn = [CECDataCustomButton createCECDataCustomBtn];
    firstBtn.layer.cornerRadius = 5.f;
    firstBtn.clipsToBounds = YES;
    firstBtn.backgroundColor = [UIColor blackColor];
    [firstBtn setTitle:@"第①个按钮" forState:UIControlStateNormal];
    [self.view addSubview:firstBtn];  //添加到视图
    //利用Masonry布局
    [firstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(90);
        make.height.offset(56);
        make.width.offset(211);
    }];
    //按钮点击方法
    firstBtn.CECDataCustomButtonClickBlock = ^(CECDataCustomButton *btn) {
        [CECDataAlert showTipsForALittleTime:@"这个是短暂的弹窗提示"
                                titleMessage:@"短暂弹窗提示"];
    };
```

***

###### 具体效果，请运行代码查看。
