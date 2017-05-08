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

@interface MDButton ()<UIGestureRecognizerDelegate>

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
        
        
        if (Style == FloatingActionButton) {
            [self loadShadow];
            self.layer.cornerRadius = self.frame.size.width/2.f;
            //添加拖动手势
            UIPanGestureRecognizer *panG = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveButton:)];
            panG.delegate = self;
            [self addGestureRecognizer:panG];
        }else if (Style == RaisedButton){
            [self loadShadow];
            self.layer.cornerRadius = 4;
            _ripplrLayer.cornerRadius = 4;
        }else if (Style == FlatButton){
            
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
    
    if (_myStyle != FloatingActionButton) {
        CABasicAnimation *animation = [self loadRipplrAnimationWithLocation:location duration:.5f];
        
        [_ripplrLayer addAnimation:animation forKey:nil];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{}


//设置水墨动画
-(CABasicAnimation *)loadRipplrAnimationWithLocation:(CGPoint)location duration:(CGFloat)duration{
    
    if (_myStyle == FlatButton) {
        self.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.2];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.backgroundColor = [UIColor clearColor];
        });
    }
    
    UIBezierPath *fromPaht = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(location.x, location.y, 0, 0)];
    
    CGFloat radius ;
    
    //计算最大半径
    if (self.width == self.height) {
        
        radius = sqrt((self.width*self.width*2))/2.f;
        
    }else {
        radius = sqrt((self.width*self.width + self.height*self.height))/2.f;
    }
    
    CGRect newRect = CGRectInset(CGRectMake(self.width/2.f, self.height/2.f, 0, 0), -radius, -radius);
    
    UIBezierPath *toPath = [UIBezierPath bezierPathWithOvalInRect:newRect];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"path";
    animation.fromValue = (__bridge id _Nullable)(fromPaht.CGPath);
    animation.toValue = (__bridge id _Nullable)(toPath.CGPath);
    animation.duration = duration;
    
    
    
    return animation;
}

-(void)moveButton:(UIPanGestureRecognizer *)panG{
    CGPoint translation = [panG translationInView:[UIApplication sharedApplication].keyWindow];
    CGPoint center = self.center;
    self.center = CGPointMake(center.x + translation.x, center.y + translation.y);
    [panG setTranslation:CGPointMake(0, 0) inView:[UIApplication sharedApplication].keyWindow];
}
@end
