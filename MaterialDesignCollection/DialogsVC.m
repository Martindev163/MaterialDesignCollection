//
//  DialogsVC.m
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/9.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "DialogsVC.h"
#import "MDDialogs.h"
#import "MDButton.h"
#import "Defines.h"

@interface DialogsVC ()

@property (nonatomic, strong) MDDialogs *dialogsView;

@end

@implementation DialogsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dialogsView = [[MDDialogs alloc] initWithFrame:[UIScreen mainScreen].bounds WithStyle:MDDialogsDefault Title:@"大标题" Body:@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈" ConfirmButtonTitle:@"确定" CancelButtonTitle:@"取消" confirmAction:@selector(clickConfirmButton) cancelAction:@selector(clickCancelButton) target:self];
    
    MDButton *btn = [[MDButton alloc] initWithFrame:CGRectMake(SCREEM_WIDTH/2.f - 40, SCREEM_HEIGHT/2.f - 20, 80, 40) WithStyle:FlatButton];
    [btn.button setTitle:@"提示框" forState:UIControlStateNormal];
    [btn.button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn.button addTarget:self action:@selector(showDialogs) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)showDialogs{
    [_dialogsView showMDDialogs];
}

//选择提示框的取消按钮
-(void)clickCancelButton{
    [_dialogsView hidMDDialogs];
}
//选择提示框的确定按钮
-(void)clickConfirmButton{
    [_dialogsView hidMDDialogs];
}
@end
