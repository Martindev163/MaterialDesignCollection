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

@end


@implementation MDTabBarButton

-(instancetype)initWithFrame:(CGRect)frame WithStyle:(MDButtonStyle)Style
{
    self = [super initWithFrame:frame WithStyle:Style];
    
    if (self) {
        self.layer.cornerRadius = 0;
        self.ripplrLayer.cornerRadius = 0;
        
        [self.button.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        [self addImageViewAndlabel];
    }
    return self;
}


#pragma mark - 添加图片和文本
-(void)addImageViewAndlabel{
    CGFloat imgWidth = self.height - 8 - 12 - 10 - 4;
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width - imgWidth)/2.f, 8, imgWidth, imgWidth)];
//    _imageView.backgroundColor = [UIColor redColor];
    [self addSubview:_imageView];
    
    _imgRect = _imageView.frame;
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height - 10 - 12 , self.width, 12)];
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
        
    }else if (state == UIControlStateHighlighted){
        
    }else if (state == UIControlStateDisabled){
        
    }else if (state == UIControlStateSelected){
        
    }else{
        
    }
}

#pragma mark - 重新赋值
-(void)setButtonStateWithStyle:(UIControlState)state{
    if (state == UIControlStateNormal) {
        _imageView.image = _normalImage;
        _label.text = _normalStr;
    }else if (state == UIControlStateHighlighted){
        _imageView.image = _highlightedImage;
        _label.text = _highlightedStr;
    }else if (state == UIControlStateDisabled){
        _imageView.image = _disabledImage;
        _label.text = _disabledStr;
    }else if (state == UIControlStateSelected){
        _imageView.image = _selectedImage;
        _label.text = _selectedStr;
    }else{
        _imageView.image = _normalImage;
        _label.text = _normalStr;
    }
}

@end
