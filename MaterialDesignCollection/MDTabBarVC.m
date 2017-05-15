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

@interface MDTabBarVC ()<UITabBarDelegate>

@property (nonatomic, strong) UITabBarController *tabBarVC;

@property (nonatomic, strong) MDTabBarButton *firstBtn;
@property (nonatomic, strong) MDTabBarButton *secondBtn;
@property (nonatomic, strong) MDTabBarButton *thirdBtn;
@property (nonatomic, strong) MDTabBarButton *fourthBtn;

@property (nonatomic, strong) MDTabBarButton *selectedBtn;

@property (nonatomic, strong) UIView *myView;
@end

@implementation MDTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    [self loadCustomTabBar];
}


#pragma mark - 自定义tabBar
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

@end
