//
//  ButtonVC.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/4.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "ButtonVC.h"
#import "MDButton.h"
#import "testViewController.h"

@interface ButtonVC ()

//浮动响应按钮、浮动按钮、扁平按钮
@property (nonatomic, strong) MDButton *FABtn,*raisedBtn,*flatBtn;

@end

@implementation ButtonVC

-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"按钮";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadFloatingActionButton];
}

//添加浮动响应按钮
-(void)loadFloatingActionButton{
    
    _FABtn = [[MDButton alloc] initWithFrame:CGRectMake(100, 80, 80, 80) WithStyle:FloatingActionButton];
    _FABtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:_FABtn];
    
    
    _raisedBtn = [[MDButton alloc] initWithFrame:CGRectMake(100, 250, 80, 80) WithStyle:RaisedButton];
    _raisedBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:_raisedBtn];
    
    _flatBtn = [[MDButton alloc] initWithFrame:CGRectMake(100, 400, 80, 44) WithStyle:FlatButton];
    [_flatBtn.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_flatBtn.button setTitle:@"哈哈哈哈" forState:UIControlStateNormal];
    [self.view addSubview:_flatBtn];
    [_flatBtn.button addTarget:self action:@selector(tuenPage) forControlEvents:UIControlEventTouchUpInside];
}

-(void)tuenPage{
}

@end
