//
//  MDDialogs.h
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/9.
//  Copyright © 2017年 junanxin. All rights reserved.
//提示框

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    MDDialogsDefault,//默认方式 靠右排
    MDDialogsStacked,//上下排
    MDDialogsSideBySide,//左右平均排
} MDDialogsStyle;


@interface MDDialogs : UIView

//title为空则不现实标题的位置
-(instancetype)initWithFrame:(CGRect)frame WithStyle:(MDDialogsStyle)Style Title:(NSString *)title Body:(NSString *)body ConfirmButtonTitle:(NSString *)confirmTitle CancelButtonTitle:(NSString *)cancelTitle confirmAction:(SEL)confirmAction cancelAction:(SEL)cancelAction target:(id)target;

-(void)showMDDialogs;

-(void)hidMDDialogs;

@end

