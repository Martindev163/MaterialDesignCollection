//
//  MDTabBarButton.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/12.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "MDTabBarButton.h"
#import "UIView+Extension.h"


@interface MDTabBarButton ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, assign) CGRect imgRect;

//各种状态的图片
@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *highlightedImage;
@property (nonatomic, strong) UIImage *disabledImage;
@property (nonatomic, strong) UIImage *selectedImage;

//标题
@property (nonatomic, copy) NSString *normalStr;
@property (nonatomic, copy) NSString *highlightedStr;
@property (nonatomic, copy) NSString *disabledStr;
@property (nonatomic, copy) NSString *selectedStr;


//标题颜色
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *highlightedColor;
@property (nonatomic, strong) UIColor *disabledColor;
@property (nonatomic, strong) UIColor *selectedColor;
@end


@implementation MDTabBarButton

-(instancetype)initWithFrame:(CGRect)frame WithStyle:(MDButtonStyle)Style
{
    self = [super initWithFrame:frame WithStyle:Style];
    
    if (self) {
        self.layer.cornerRadius = 0;
        self.ripplrLayer.cornerRadius = 0;
        self.ripplrLayer.fillColor = [UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:.5f].CGColor;
        self.ripplrLayer.masksToBounds = NO;//水墨动画波及范围
        [self.button.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        [self addImageViewAndlabel];
    }
    return self;
}


#pragma mark - 添加图片和文本
-(void)addImageViewAndlabel{
    CGFloat imgWidth = 24;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width - imgWidth)/2.f, 4, imgWidth, imgWidth)];
//    _imageView.backgroundColor = [UIColor redColor];
    [self addSubview:_imageView];
    
    _imgRect = _imageView.frame;
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - 6 - 12 , self.width, 12)];
    _label.font = [UIFont systemFontOfSize:12];
    _label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_label];
}

//设置图片
-(void)setButtonImage:(UIImage *)img forState:(UIControlState)state
{
    if (state == UIControlStateNormal) {
        _normalImage = img;
        [self setButtonStateWithStyle:state];
    }else if (state == UIControlStateHighlighted){
        _highlightedImage = img;
    }else if (state == UIControlStateDisabled){
        _disabledImage = img;
    }else if (state == UIControlStateSelected){
        _selectedImage = img;
    }else{
        
    }
}

//设置标题
-(void)setButtonTitle:(NSString *)title forState:(UIControlState)state{
    if (state == UIControlStateNormal) {
        _normalStr = title;
        [self setButtonStateWithStyle:state];
    }else if (state == UIControlStateHighlighted){
        _highlightedStr = title;
    }else if (state == UIControlStateDisabled){
        _disabledStr = title;
    }else if (state == UIControlStateSelected){
        _selectedStr = title;
    }else{
        
    }
}


//设置标题颜色
-(void)setButtonTitleColor:(UIColor *)color forState:(UIControlState)state{
    if (state == UIControlStateNormal) {
        _normalColor = color;
        [self setButtonStateWithStyle:state];
    }else if (state == UIControlStateHighlighted){
        _highlightedColor = color;
    }else if (state == UIControlStateDisabled){
        _disabledColor = color;
    }else if (state == UIControlStateSelected){
        _selectedColor = color;
    }else{
        
    }
}

#pragma mark - 重新赋值
-(void)setButtonStateWithStyle:(UIControlState)state{
    if (state == UIControlStateNormal) {
        _imageView.image = _normalImage;
        _label.text = _normalStr;
        _label.textColor = _normalColor;
    }else if (state == UIControlStateHighlighted){
        _imageView.image = _highlightedImage;
        if (_highlightedStr.length > 0) {
            _label.text = _highlightedStr;
        }else
        {
            _label.text = _normalStr;
        }
        
        _label.textColor = _highlightedColor;
    }else if (state == UIControlStateDisabled){
        _imageView.image = _disabledImage;
        if (_disabledStr.length > 0) {
            _label.text = _disabledStr;
        }else
        {
            _label.text = _normalStr;
        }
        _label.textColor = _disabledColor;
    }else if (state == UIControlStateSelected){
        _imageView.image = _selectedImage;
        if (_selectedStr.length > 0) {
            _label.text = _selectedStr;
        }else
        {
            _label.text = _normalStr;
        }
        _label.textColor = _selectedColor;
    }else{
        _imageView.image = _normalImage;
        _label.text = _normalStr;
        _label.textColor = _normalColor;
    }
}

-(void)setSelected:(BOOL)selected
{
    if (selected == YES) {
        [self setButtonStateWithStyle:UIControlStateSelected];
    }else
    {
        [self setButtonStateWithStyle:UIControlStateNormal];
    }
}

@end
