//
//  FirstVC.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/12.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "FirstVC.h"
#import "testViewController.h"
#import "MDNavigationController.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"发现";
    self.view.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.f];
    
    UIButton *goBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [goBtn setTitle:@"点我" forState:UIControlStateNormal];
    goBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:goBtn];
    [goBtn addTarget:self action:@selector(goPage) forControlEvents:UIControlEventTouchUpInside];
}

-(void)goPage{
    testViewController *vc = [[testViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
