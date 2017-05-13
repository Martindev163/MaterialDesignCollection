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


@interface MDTabBarVC ()

@property (nonatomic, strong) UITabBarController *tabBarVC;

@end

@implementation MDTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabBar.tintColor = [UIColor colorWithRed:208/255.0 green:40/255.0 blue:32/255.0 alpha:1.f];
    
    FirstVC *fVC  = [[FirstVC alloc] init];
    UINavigationController *oneNav = [[UINavigationController alloc] initWithRootViewController:fVC];
    oneNav.tabBarItem.image = [[UIImage imageNamed:@"invest_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    oneNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"invest_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    oneNav.title = @"首页";
    [self addChildViewController:oneNav];
    
    UINavigationController *twoNav = [[UINavigationController alloc] initWithRootViewController:[[SecondVC alloc] init]];
    twoNav.tabBarItem.image = [[UIImage imageNamed:@"discover_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    twoNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"discover_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    twoNav.title = @"发现";
    [self addChildViewController:twoNav];
    
    UINavigationController *threeNav = [[UINavigationController alloc] initWithRootViewController:[[ThirdVC alloc] init]];
    threeNav.tabBarItem.image = [[UIImage imageNamed:@"community_normal" ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    threeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"community_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    threeNav.title = @"社区";
    [self addChildViewController:threeNav];
    
    UINavigationController *fourNav = [[UINavigationController alloc] initWithRootViewController:[[FouthVC alloc] init]];
    fourNav.tabBarItem.image = [[UIImage imageNamed:@"account_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fourNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"account_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fourNav.title = @"我的";
    [self addChildViewController:fourNav];
    
    [self loadCustomTabBar];
}


#pragma mark - 自定义tabBar
-(void)loadCustomTabBar{
    
    CGRect tabBarRect = self.tabBar.frame;
    [self.tabBar removeFromSuperview];
    UIView *myView = [[UIView alloc] initWithFrame:tabBarRect];
    myView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myView];
    
    myView.layer.shadowColor = [UIColor blackColor].CGColor;
    myView.layer.shadowOffset = CGSizeMake(0, 2);
    myView.layer.shadowOpacity = .3f;
    myView.layer.shadowRadius = 3;
    
    CGFloat btnWidth = SCREEM_WIDTH/4.f;
    MDTabBarButton *firstBtn = [[MDTabBarButton alloc] initWithFrame:CGRectMake(0, 0, btnWidth, tabBarRect.size.height) WithStyle:RaisedButton];
    [firstBtn setButtonImage:[UIImage imageNamed:@"invest_normal"] forState:UIControlStateNormal];
    [firstBtn setButtonImage:[UIImage imageNamed:@"invest_selected"] forState:UIControlStateSelected];
    [firstBtn setButtonTitle:@"首页" forState:UIControlStateNormal];
    [myView addSubview:firstBtn];
    
    MDTabBarButton *secondBtn = [[MDTabBarButton alloc] initWithFrame:CGRectMake(firstBtn.right, 0, btnWidth, tabBarRect.size.height) WithStyle:RaisedButton];
    [secondBtn setButtonImage:[UIImage imageNamed:@"discover_normal"] forState:UIControlStateNormal];
    [secondBtn setButtonImage:[UIImage imageNamed:@"discover_selected"] forState:UIControlStateSelected];
    [secondBtn setButtonTitle:@"发现" forState:UIControlStateNormal];
    [myView addSubview:secondBtn];
    
    MDTabBarButton *thirdBtn = [[MDTabBarButton alloc] initWithFrame:CGRectMake(secondBtn.right, 0, btnWidth, tabBarRect.size.height) WithStyle:RaisedButton];
    [thirdBtn setButtonTitle:@"社区" forState:UIControlStateNormal];
    [thirdBtn setButtonImage:[UIImage imageNamed:@"community_normal"] forState:UIControlStateNormal];
    [thirdBtn setButtonImage:[UIImage imageNamed:@"community_selected"] forState:UIControlStateSelected];
    [myView addSubview:thirdBtn];
    
    MDTabBarButton *fourthBtn = [[MDTabBarButton alloc] initWithFrame:CGRectMake(thirdBtn.right, 0, btnWidth, tabBarRect.size.height) WithStyle:RaisedButton];
    [fourthBtn setButtonTitle:@"我的" forState:UIControlStateNormal];
    [fourthBtn setButtonImage:[UIImage imageNamed:@"account_normal"] forState:UIControlStateNormal];
    [fourthBtn setButtonImage:[UIImage imageNamed:@"account_selected"] forState:UIControlStateSelected];
    [myView addSubview:fourthBtn];
}

@end
