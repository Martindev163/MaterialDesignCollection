//
//  MDNavigationController.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/13.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "MDNavigationController.h"

#import "MDTabBarVC.h"

#import "AppDelegate.h"

@interface MDNavigationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) MDTabBarVC *customTabBarVC;

@end

@implementation MDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationBar.barTintColor = [UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:1.f];
    
    [self.navigationBar setTitleTextAttributes:
     
  @{NSFontAttributeName:[UIFont systemFontOfSize:20],
    
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(72, 12, 150, 20)];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    _titleLabel.font = [UIFont systemFontOfSize:20];
    _titleLabel.text = @"导航标题";
    
//    [self.navigationBar addSubview:_titleLabel];
    
    
//    [self setNavigationBarHidden:YES];
    
//    CGRect tempRect = self.navigationBar.frame;
//    
//    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
//    navView.backgroundColor = [UIColor colorWithRed:244/255.0 green:67/255.0 blue:54/255.0 alpha:1.f];
//    [self.view addSubview:navView];
//    
    
//
//    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 48, 48)];
//    [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//    
//    [backBtn addTarget:self action:@selector(back_action) forControlEvents:UIControlEventTouchUpInside];
//    
//    [navView addSubview:backBtn];
    
}

//-(void)setMDTitle:(NSString *)MDTitle
//{
//    _titleLabel.text = MDTitle;
//}
//
-(void)setTitle:(NSString *)title
{
    _titleLabel.text = title;
}

/**
 * 拦截所有push进来的子控制器
 * @param viewController 每一次push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    if (不是第一个push进来的子控制器) {
    if (self.childViewControllers.count >= 1) {
        // 隐藏底部的工具条
        if (YES == animated) {
            
            viewController.hidesBottomBarWhenPushed = YES;
        }
        
        if (viewController.navigationController.navigationItem.leftBarButtonItem == nil) {
            
            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:0 target:self action:@selector(back_action)];
        }
    }
//    viewController.navigationItem.titleView = _titleLabel;
    
    [super pushViewController:viewController animated:animated];
    AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
    _customTabBarVC = appDel.rootVC;
    [_customTabBarVC hiddenTabBarWtiAnimation:YES];
}

- (void)back_action {
    [self popViewControllerAnimated:YES];
    if (self.childViewControllers.count <= 1) {
        AppDelegate *appDel = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _customTabBarVC = appDel.rootVC;
        [_customTabBarVC showTabBarWithAnimation:YES];
    }
}


/**
 * 每当用户触发[返回手势]时都会调用一次这个方法
 * 返回值:返回YES,手势有效; 返回NO,手势失效
 *
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.childViewControllers.count > 1;
}

@end
