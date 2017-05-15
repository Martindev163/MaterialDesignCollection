//
//  MDTabBarButton.h
//  MaterialDesignCollection
//
//  Created by 马浩哲 on 2017/5/12.
//  Copyright © 2017年 junanxin. All rights reserved.
//

#import "MDButton.h"

@interface MDTabBarButton : MDButton

@property (nonatomic, assign) BOOL selected;

//-(void)setImageWithImage:(UIImage *)image for;

-(void)setButtonImage:(UIImage *)img forState:(UIControlState)state;
-(void)setButtonTitle:(NSString *)title forState:(UIControlState)state;
-(void)setButtonTitleColor:(UIColor *)color forState:(UIControlState)state;


-(void)setButtonStateWithStyle:(UIControlState)state;

@end
