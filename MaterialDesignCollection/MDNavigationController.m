//
//  MDNavigationController.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/13.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "MDNavigationController.h"

@interface MDNavigationController ()<UIGestureRecognizerDelegate>

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
}

/**
 * 拦截所有push进来的子控制器
 * @param viewController 每一次push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //  push到深层控制器当中
    if (self.childViewControllers.count >= 1) {
        // 隐藏底部的工具条
//        if (YES == animated) {
        
            viewController.hidesBottomBarWhenPushed = YES;
//        }
        
        if (viewController.navigationController.navigationItem.leftBarButtonItem == nil) {
            
            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:0 target:self action:@selector(back_action)];
        }
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back_action {
    [self popViewControllerAnimated:YES];
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
