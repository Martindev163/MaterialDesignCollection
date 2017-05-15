//
//  testViewController.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/15.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()

@end

@implementation testViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"测试页面";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
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
