//
//  MDButton.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/5.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "MDButton.h"
#import "UIView+Extension.h"

#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))    // 弧度转角度

@interface MDButton ()

@property (nonatomic, strong) CAShapeLayer *ripplrLayer;

@property (nonatomic, assign) MDButtonStyle myStyle;

@end

@implementation MDButton

-(instancetype)initWithFrame:(CGRect)frame WithStyle:(MDButtonStyle)Style
{
    self = [super initWithFrame:frame];
    
    if (self) {
        _myStyle = Style;
        _ripplrLayer = [CAShapeLayer layer];
        [self loadShadow];
        
        if (Style == FloatingActionButton) {
            
            self.layer.cornerRadius = self.frame.size.width/2.f;
        }else if (Style == RaisedButton){
            self.layer.cornerRadius = 4;
            _ripplrLayer.cornerRadius = 4;
        }
        
        [self addRipplrLayer];
    }
    
    return self;
}

//设置阴影
-(void)loadShadow
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 2);
    self.layer.shadowOpacity = .3f;
    self.layer.shadowRadius = 3;
}

//添加水墨
-(void)addRipplrLayer{
    
    _ripplrLayer.frame = self.bounds;
    _ripplrLayer.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3f].CGColor;
    _ripplrLayer.strokeColor = [UIColor clearColor].CGColor;
    _ripplrLayer.position = CGPointMake(self.frame.size.width/2.f, self.frame.size.height/2.f);
    _ripplrLayer.bounds = self.bounds;
    
    UIBezierPath *fromPaht = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.width/2.f, self.height/2.f, 0, 0)];
    _ripplrLayer.path = fromPaht.CGPath;
    
    _ripplrLayer.masksToBounds = YES;
    
    [self.layer addSublayer:_ripplrLayer];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self];
    NSLog(@"%@",NSStringFromCGPoint(location));
    
    UIBezierPath *fromPaht = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(location.x, location.y, 0, 0)];
    
    CGFloat radius ;
    
    if (self.width == self.height) {
        
        radius = sqrt((self.width*self.width*2))/2.f;
        
    }else {
        radius = sqrt((self.width*self.height + self.height*self.height))/2.f;
    }
    
    CGRect newRect = CGRectInset(CGRectMake(self.width/2.f, self.height/2.f, 0, 0), -radius, -radius);
    
    UIBezierPath *toPath = [UIBezierPath bezierPathWithOvalInRect:newRect];;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"path";
    animation.fromValue = (__bridge id _Nullable)(fromPaht.CGPath);
    animation.toValue = (__bridge id _Nullable)(toPath.CGPath);
    animation.duration = .5f;
    _ripplrLayer.path = toPath.CGPath;
    [_ripplrLayer addAnimation:animation forKey:nil];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{}

@end
