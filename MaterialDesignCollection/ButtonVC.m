//
//  ButtonVC.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/4.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "ButtonVC.h"
#import "MDButton.h"

@interface ButtonVC ()

//浮动响应按钮、浮动按钮、扁平按钮
@property (nonatomic, strong) MDButton *FABtn,*raisedBtn,*flatBtn;

@end

@implementation ButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadFloatingActionButton];
}

//添加浮动响应按钮
-(void)loadFloatingActionButton{
    _FABtn = [[MDButton alloc] initWithFrame:CGRectMake(100, 80, 80, 80) WithStyle:RaisedButton];
    _FABtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:_FABtn];
}

@end
