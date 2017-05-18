//
//  MDDialogs.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/9.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "MDDialogs.h"
#import "MDButton.h"
#import "NSString+AttributedText.h"
#import "UIView+Extension.h"
#import "YXEasing.h"
#import "Defines.h"
#import "POP.h"

#define DialogsTitleFont 22
#define DialogsBodyFont  18

@interface MDDialogs ()<CAAnimationDelegate,POPAnimationDelegate>

@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, strong) UIView *dialogsView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *bodyLabel;

@property (nonatomic, strong) MDButton *confirmButton;

@property (nonatomic, strong) MDButton *cancelButton;

//文本内容
@property (nonatomic, strong) NSString *dialogsTitle;

@property (nonatomic, strong) NSString *bodyStr;

@property (nonatomic, strong) NSString *confirmTitle;

@property (nonatomic, strong) NSString *cancelTitle;

@property (nonatomic, assign) MDDialogsStyle dialogsStyle;

@property (nonatomic, assign) SEL confirmAction;

@property (nonatomic, assign) SEL cancelAction;

@property (nonatomic, assign) CGFloat maxHeight;
@end

@implementation MDDialogs

-(instancetype)initWithFrame:(CGRect)frame WithStyle:(MDDialogsStyle)Style Title:(NSString *)title Body:(NSString *)body ConfirmButtonTitle:(NSString *)confirmTitle CancelButtonTitle:(NSString *)cancelTitle confirmAction:(DialogViewCallBackBlock)confirmAction cancelAction:(DialogViewCallBackBlock)cancelAction{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        _dialogsTitle = title;
        _bodyStr      = body;
        _confirmTitle = confirmTitle;
        _cancelTitle  = cancelTitle;
        _dialogsStyle = Style;
        self.confirmBlock = confirmAction;
        self.cancelBlock = cancelAction;
    }
    
    return self;
}

//移除蒙版
-(void)hidMDDialogs{
    [self addHidDialogsAnimation];
}

//添加蒙版
-(void)showMDDialogs{
    _maskView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _maskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:_maskView];
    
    [self addDialogsView];
}

//添加提示框背景
-(void)addDialogsView{
    
    _maxHeight = 0;
    
    //标题距离顶部距离
    _maxHeight +=24;
    
    //有标题的话算上标题和标题跟body的距离
    if (_dialogsTitle.length > 0) {
        _maxHeight += 24;
        _maxHeight += 24;
    }
    
    //body的高度
    CGFloat bodyHeight = [_bodyStr maxTextSizeWithTextWidth:232 textFont:DialogsBodyFont].height;
    
    _maxHeight += bodyHeight;
    
    _maxHeight += 24;
    
    //按钮
    _maxHeight += 36;
    //双排按钮
    if (_dialogsStyle == MDDialogsStacked) {
        _maxHeight += 36;
    }
    
    _maxHeight += 16;
    
    //背景
    _dialogsView = [[UIView alloc] initWithFrame:CGRectMake(self.width/2.f - 140,  -_maxHeight/2, 280, _maxHeight)];
    _dialogsView.backgroundColor = [UIColor whiteColor];
    _dialogsView.layer.shadowColor = [UIColor blackColor].CGColor;
    _dialogsView.layer.shadowOffset = CGSizeMake(0, 5);
    _dialogsView.layer.shadowOpacity = .5f;
    _dialogsView.layer.shadowRadius = 5;
    _dialogsView.hidden = YES;
    [_maskView addSubview:_dialogsView];
    
    //标题
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 24, 232, 24)];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.text = _dialogsTitle;
    [_titleLabel setFont:[UIFont systemFontOfSize:DialogsTitleFont]];
    [_dialogsView addSubview:_titleLabel];
    
    //文本内容
    if (_dialogsTitle.length > 0) {
        _bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, _titleLabel.bottom + 24, 232, bodyHeight)];
    }else{
        _bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(24, 24, 232, bodyHeight)];
    }
    
    _bodyLabel.textColor = [UIColor blackColor];
    _bodyLabel.text = _bodyStr;
    _bodyLabel.numberOfLines = 0;
    [_bodyLabel setFont:[UIFont systemFontOfSize:DialogsBodyFont]];
    [_dialogsView addSubview:_bodyLabel];
    
    //按钮
    if (_dialogsStyle == MDDialogsDefault) {
        
        _confirmButton = [[MDButton alloc] initWithFrame:CGRectMake(_dialogsView.width - 16 - 72, _bodyLabel.bottom + 24, 72, 36) WithStyle:FlatButton];
        [_dialogsView addSubview:_confirmButton];
        
        _cancelButton = [[MDButton alloc] initWithFrame:CGRectMake(_confirmButton.left - 72, _bodyLabel.bottom + 24, 72, 36) WithStyle:FlatButton];
        [_dialogsView addSubview:_cancelButton];
        
    }else if (_dialogsStyle == MDDialogsStacked){
        CGFloat width = [_confirmTitle maxTextSizeWithTextHeight:15 textFont:14].width;
        
        _confirmButton = [[MDButton alloc] initWithFrame:CGRectMake(_dialogsView.width - 16 - width, _bodyLabel.bottom + 24, width, 36) WithStyle:FlatButton];
        [_dialogsView addSubview:_confirmButton];
        
        _cancelButton = [[MDButton alloc] initWithFrame:CGRectMake(_confirmButton.left, _confirmButton.bottom, width, 36) WithStyle:FlatButton];
        [_dialogsView addSubview:_cancelButton];
        
    }else if (_dialogsStyle == MDDialogsSideBySide){
        
        _cancelButton = [[MDButton alloc] initWithFrame:CGRectMake(16, _bodyLabel.bottom + 24, 124, 36) WithStyle:FlatButton];
        
        [_dialogsView addSubview:_cancelButton];
        
        _confirmButton = [[MDButton alloc] initWithFrame:CGRectMake(_cancelButton.right, _bodyLabel.bottom + 24, 124, 36) WithStyle:FlatButton];
        
        [_dialogsView addSubview:_confirmButton];
        
    }
    
    [_cancelButton.button setTitle:_cancelTitle forState:UIControlStateNormal];
    [_cancelButton.button setTitleColor:[UIColor colorWithRed:213/255.0 green:69/255.0 blue:66/255.0 alpha:1] forState:UIControlStateNormal];
    [_confirmButton.button setTitleColor:[UIColor colorWithRed:213/255.0 green:69/255.0 blue:66/255.0 alpha:1] forState:UIControlStateNormal];
    [_confirmButton.button setTitle:_confirmTitle forState:UIControlStateNormal];
    [_confirmButton.button addTarget:self action:@selector(clickConfirmBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_cancelButton.button addTarget:self action:@selector(clickCancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    if (_cancelTitle.length <= 0) {
        _cancelButton.hidden = YES;
    }
    
    if (_confirmTitle.length <= 0) {
        _confirmButton.hidden = YES;
    }
    
    [self addShowDialogsAnimation];
}

-(void)clickConfirmBtnAction{
    if (self.confirmBlock) {
        self.confirmBlock();
    }
    [self addHidDialogsAnimation];
}

-(void)clickCancelBtnAction{
    if (self.cancelBlock) {
        self.cancelBlock();
    }
    [self addHidDialogsAnimation];
}

//添加动画
-(void)addShowDialogsAnimation{
    //向下掉落的动画
    CGRect tempRect = _dialogsView.frame;
    POPSpringAnimation *popAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    popAnimation.fromValue = [NSValue valueWithCGRect:tempRect];
    tempRect.origin.y += SCREEM_HEIGHT/2.f;
    popAnimation.toValue = [NSValue valueWithCGRect:tempRect];
    popAnimation.springBounciness = 13;
    popAnimation.springSpeed = 10;
    popAnimation.beginTime = CACurrentMediaTime();
    popAnimation.delegate = self;
    _dialogsView.frame = tempRect;
    [_dialogsView pop_addAnimation:popAnimation forKey:nil];
}

//添加提示框消失动画
-(void)addHidDialogsAnimation{
    //滑出界面
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"position";
    keyAnimation.duration = 0.2;
    keyAnimation.delegate = self;
    keyAnimation.values = [YXEasing calculateFrameFromPoint:CGPointMake(SCREEM_WIDTH/2.f, SCREEM_HEIGHT/2.f) toPoint:CGPointMake(SCREEM_WIDTH/2.f, SCREEM_HEIGHT + _maxHeight/2.f) func:QuinticEaseIn frameCount:0.2*30];
    _dialogsView.frame = CGRectMake(SCREEM_WIDTH/2.f, SCREEM_HEIGHT + _maxHeight/2.f, 280, _maxHeight);
    [_dialogsView.layer addAnimation:keyAnimation forKey:nil];
}

//动画结束，隐藏蒙版
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    [_maskView removeFromSuperview];
    _maskView = nil;
}

-(void)pop_animationDidStart:(POPAnimation *)anim
{
    _dialogsView.hidden = NO;
}
@end
