//
//  MDTabBarVC.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/12.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "MDTabBarVC.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "FouthVC.h"
#import "Defines.h"

#import "MDButton.h"
#import "MDTabBarButton.h"
#import "UIView+Extension.h"
#import "MDNavigationController.h"
#import "ViewController.h"

#define AnimationDuration 0.3

@interface MDTabBarVC ()<UITabBarDelegate,CAAnimationDelegate>

@property (nonatomic, strong) UITabBarController *tabBarVC;

@property (nonatomic, strong) MDTabBarButton *firstBtn;
@property (nonatomic, strong) MDTabBarButton *secondBtn;
@property (nonatomic, strong) MDTabBarButton *thirdBtn;
@property (nonatomic, strong) MDTabBarButton *fourthBtn;

@property (nonatomic, strong) MDTabBarButton *selectedBtn;

@property (nonatomic, strong) UIView *myView;
@property (nonatomic, strong) CAShapeLayer *ripplrLayer;
@end

@implementation MDTabBarVC


-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self layoutSubviews];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTabBarShadow];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabBar.tintColor = [UIColor colorWithRed:208/255.0 green:40/255.0 blue:32/255.0 alpha:1.f];
    
    ViewController *fVC  = [[ViewController alloc] init];
    MDNavigationController *oneNav = [[MDNavigationController alloc] initWithRootViewController:fVC];
    oneNav.tabBarItem.image = [[UIImage imageNamed:@"invest_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    oneNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"invest_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    oneNav.title = @"列表";
    [self addChildViewController:oneNav];
    
    FirstVC *sVC = [[FirstVC alloc] init];
    MDNavigationController *twoNav = [[MDNavigationController alloc] initWithRootViewController:sVC];
    twoNav.tabBarItem.image = [[UIImage imageNamed:@"discover_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    twoNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"discover_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    twoNav.title = @"发现";
    [self addChildViewController:twoNav];
    
    
    ThirdVC *tVC = [[ThirdVC alloc] init];
    MDNavigationController *threeNav = [[MDNavigationController alloc] initWithRootViewController:tVC];
    threeNav.tabBarItem.image = [[UIImage imageNamed:@"community_normal" ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    threeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"community_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    threeNav.title = @"社区";
    [self addChildViewController:threeNav];
    
    
    FouthVC *fouthVC = [[FouthVC alloc] init];
    MDNavigationController *fourNav = [[MDNavigationController alloc] initWithRootViewController:fouthVC];
    fourNav.tabBarItem.image = [[UIImage imageNamed:@"account_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fourNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"account_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fourNav.title = @"我的";
    [self addChildViewController:fourNav];
    
    
    //方法一
//    [self loadCustomTabBar];
}


#pragma mark - 自定义tabBar （方法一）
-(void)loadCustomTabBar{
    
    CGRect tabBarRect = self.tabBar.frame;
    [self.tabBar removeFromSuperview];
    _myView = [[UIView alloc] initWithFrame:tabBarRect];
    _myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_myView];
    
    _myView.layer.shadowColor = [UIColor blackColor].CGColor;
    _myView.layer.shadowOffset = CGSizeMake(0, 2);
    _myView.layer.shadowOpacity = .3f;
    _myView.layer.shadowRadius = 3;
    
    CGFloat btnWidth = SCREEM_WIDTH/4.f;
    
    ///第一个按钮
    _firstBtn = [[MDTabBarButton alloc] initWithFrame:CGRectMake(0, 0, btnWidth, tabBarRect.size.height) WithStyle:RaisedButton];
    _firstBtn.button.tag = 101;
    _firstBtn.duration = AnimationDuration;
    [_firstBtn.button addTarget:self action:@selector(clickTabBarButtonWith:) forControlEvents:UIControlEventTouchUpInside];
    [_firstBtn setButtonImage:[UIImage imageNamed:@"invest_normal"] forState:UIControlStateNormal];
    [_firstBtn setButtonImage:[UIImage imageNamed:@"invest_selected"] forState:UIControlStateSelected];
    [_firstBtn setButtonTitle:@"列表" forState:UIControlStateNormal];
    [_firstBtn setButtonTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.38f] forState:UIControlStateNormal];
    [_firstBtn setButtonTitleColor:[UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:1.f] forState:UIControlStateSelected];
    [_myView addSubview:_firstBtn];
    
    
    ///第二个按钮
    _secondBtn = [[MDTabBarButton alloc] initWithFrame:CGRectMake(_firstBtn.right, 0, btnWidth, tabBarRect.size.height) WithStyle:RaisedButton];
    _secondBtn.button.tag = 102;
    _secondBtn.duration = AnimationDuration;
    [_secondBtn.button addTarget:self action:@selector(clickTabBarButtonWith:) forControlEvents:UIControlEventTouchUpInside];
    [_secondBtn setButtonImage:[UIImage imageNamed:@"discover_normal"] forState:UIControlStateNormal];
    [_secondBtn setButtonImage:[UIImage imageNamed:@"discover_selected"] forState:UIControlStateSelected];
    [_secondBtn setButtonTitle:@"发现" forState:UIControlStateNormal];
    [_secondBtn setButtonTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.38f] forState:UIControlStateNormal];
    [_secondBtn setButtonTitleColor:[UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:1.f] forState:UIControlStateSelected];
    [_myView addSubview:_secondBtn];
    
    
    ///第三个按钮
    _thirdBtn = [[MDTabBarButton alloc] initWithFrame:CGRectMake(_secondBtn.right, 0, btnWidth, tabBarRect.size.height) WithStyle:RaisedButton];
    _thirdBtn.button.tag = 103;
    _thirdBtn.duration = AnimationDuration;
    [_thirdBtn.button addTarget:self action:@selector(clickTabBarButtonWith:) forControlEvents:UIControlEventTouchUpInside];
    [_thirdBtn setButtonTitle:@"社区" forState:UIControlStateNormal];
    [_thirdBtn setButtonImage:[UIImage imageNamed:@"community_normal"] forState:UIControlStateNormal];
    [_thirdBtn setButtonImage:[UIImage imageNamed:@"community_selected"] forState:UIControlStateSelected];
    [_thirdBtn setButtonTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.38f] forState:UIControlStateNormal];
    [_thirdBtn setButtonTitleColor:[UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:1.f] forState:UIControlStateSelected];
    [_myView addSubview:_thirdBtn];
    
    
    ///第四个按钮
    _fourthBtn = [[MDTabBarButton alloc] initWithFrame:CGRectMake(_thirdBtn.right, 0, btnWidth, tabBarRect.size.height) WithStyle:RaisedButton];
    _fourthBtn.button.tag = 104;
    _fourthBtn.duration = AnimationDuration;
    [_fourthBtn.button addTarget:self action:@selector(clickTabBarButtonWith:) forControlEvents:UIControlEventTouchUpInside];
    [_fourthBtn setButtonTitle:@"我的" forState:UIControlStateNormal];
    [_fourthBtn setButtonImage:[UIImage imageNamed:@"account_normal"] forState:UIControlStateNormal];
    [_fourthBtn setButtonImage:[UIImage imageNamed:@"account_selected"] forState:UIControlStateSelected];
    [_fourthBtn setButtonTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.38f] forState:UIControlStateNormal];
    [_fourthBtn setButtonTitleColor:[UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:1.f] forState:UIControlStateSelected];
    [_myView addSubview:_fourthBtn];
    
    _firstBtn.selected = YES;
    _selectedBtn = _firstBtn;
    self.title = @"列表";
    [self setSelectedIndex:0];
}


//显示导航栏
-(void)showTabBarWithAnimation:(BOOL)animation{
    self.myView.hidden = NO;
}
//隐藏导航栏
-(void)hiddenTabBarWtiAnimation:(BOOL)animation{
    self.myView.hidden = YES;
}


//切换控制器
-(void)clickTabBarButtonWith:(UIButton *)btn{
    [_selectedBtn setButtonStateWithStyle:UIControlStateNormal];
    if (btn.tag == 101) {
        _selectedBtn = _firstBtn;
    }else if (btn.tag == 102){
        _selectedBtn = _secondBtn;
    }else if (btn.tag == 103){
        _selectedBtn = _thirdBtn;
    }else if (btn.tag == 104){
        _selectedBtn = _fourthBtn;
    }
    [_selectedBtn setButtonStateWithStyle:UIControlStateSelected];
    [self setSelectedIndex:(btn.tag - 101)];
}


#pragma mark - 在系统控件上进行改进（方法二）下边代码直接粘贴上去就能用了

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    CGRect tempRect = CGRectZero;
    
    NSArray *viewArr = [NSArray arrayWithArray:self.tabBar.subviews];
    
    NSMutableArray *tabBarBtns = [NSMutableArray new];
    for (UIView *view in viewArr) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            CGRect tempRect = view.frame;
            tempRect.origin.y = 0;
            tempRect.size.height = 49;
            view.frame = tempRect;
            [tabBarBtns addObject:view];
        }
    }
    
    if ([item.title isEqualToString:@"列表"]) {
        UIView *view = [tabBarBtns objectAtIndex:0];
        tempRect = view.frame;
    }else if ([item.title isEqualToString:@"发现"]){
        UIView *view = [tabBarBtns objectAtIndex:1];
        tempRect = view.frame;
    }else if ([item.title isEqualToString:@"社区"]){
        UIView *view = [tabBarBtns objectAtIndex:2];
        tempRect = view.frame;
    }else if ([item.title isEqualToString:@"我的"]){
        UIView *view = [tabBarBtns objectAtIndex:3];
        tempRect = view.frame;
    }
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.fromValue = [NSNumber numberWithFloat:1.2f];
    animation.toValue   = [NSNumber numberWithFloat:1.f];
    animation.duration = 0.35f;
    
    UIView *view = [[UIView alloc] initWithFrame:tempRect];
    [self addRipplrLayerWithView:view];
    [tabBar addSubview:view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.35f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [view removeFromSuperview];
    });
}

//添加水墨
-(void)addRipplrLayerWithView:(UIView *)view{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(view.width/2.f, view.height/2.f, 0, 0)];
    
    _ripplrLayer = [CAShapeLayer layer];
    _ripplrLayer.frame = view.bounds;
    _ripplrLayer.position = CGPointMake(view.frame.size.width/2.f, view.frame.size.height/2.f);
    _ripplrLayer.strokeColor = [UIColor clearColor].CGColor;
    _ripplrLayer.fillColor = [UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:0.5f].CGColor;
    _ripplrLayer.path = path.CGPath;
    _ripplrLayer.strokeStart = 0.f;
    _ripplrLayer.strokeEnd = 1.f;
    _ripplrLayer.masksToBounds = YES;
    [view.layer addSublayer:_ripplrLayer];
    
    [_ripplrLayer addAnimation:[self loadRipplrAnimationWithLocation:CGPointMake(view.width/2.f, view.height/2.f) duration:.35f withView:view] forKey:nil];
}

//设置水墨动画
-(CAAnimationGroup *)loadRipplrAnimationWithLocation:(CGPoint)location duration:(CGFloat)duration withView:(UIView *)view{
    
    UIBezierPath *fromPaht = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(location.x, location.y, 0, 0)];
    
    CGFloat radius = 0.f ;
    
    radius = view.width/2.f;
    
    
    CGRect newRect = CGRectInset(CGRectMake(view.width/2.f, view.height/2.f, 0, 0), -radius, -radius);
    
    UIBezierPath *toPath = [UIBezierPath bezierPathWithOvalInRect:newRect];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.delegate = self;
    animation.keyPath = @"path";
    animation.fromValue = (__bridge id _Nullable)(fromPaht.CGPath);
    animation.toValue = (__bridge id _Nullable)(toPath.CGPath);
    animation.duration = duration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CABasicAnimation *alphAni = [CABasicAnimation animation];
    alphAni.keyPath = @"opacity";
    alphAni.fromValue = [NSNumber numberWithFloat:1.f];
    alphAni.toValue   = [NSNumber numberWithFloat:0.f];
    alphAni.duration = duration;
    alphAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,alphAni];
    group.duration = duration;
    group.repeatCount = 1;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    return group;
}

//添加阴影 在viewdidload中调用
-(void)addTabBarShadow{
    self.tabBar.backgroundColor = [UIColor whiteColor];
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc]init]];
    [self dropShadowWithOffset:CGSizeMake(0, 2)
                        radius:3
                         color:[UIColor blackColor]
                       opacity:0.3];
}

//设置阴影
- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.tabBar.bounds);
    self.tabBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.tabBar.layer.shadowColor = color.CGColor;
    self.tabBar.layer.shadowOffset = offset;
    self.tabBar.layer.shadowRadius = radius;
    self.tabBar.layer.shadowOpacity = opacity;
    
    self.tabBar.clipsToBounds = NO;
}


//找出tabbar的按钮
- (void)layoutSubviews{
    for (UIControl *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}
//tabBarButton点击事件
- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    for (UIView *imageView in tabBarButton.subviews) {
        if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            //需要实现的帧动画,这里根据需求自定义
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
            animation.keyPath = @"transform.scale";
            animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
            animation.duration = 1;
            animation.calculationMode = kCAAnimationCubic;
            //把动画添加上去就OK了
            [imageView.layer addAnimation:animation forKey:nil];
        }
    }
}


@end
