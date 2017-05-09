//
//  MDButton.h
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/5.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    FloatingActionButton,//悬浮响应按钮
    RaisedButton,//浮动按钮
    FlatButton,//扁平按钮
} MDButtonStyle;

@interface MDButton : UIView

@property (nonatomic, strong) UIButton *button;

-(instancetype)initWithFrame:(CGRect)frame WithStyle:(MDButtonStyle)Style;

@end
