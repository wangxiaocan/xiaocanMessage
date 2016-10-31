//
//  UserLoginController.h
//  xiaocanMessage
//
//  Created by 王文科 on 2016/10/31.
//  Copyright © 2016年 xiaocan. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 登录界面 */
@interface UserLoginController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *loginNameLabel;
@property (nonatomic, strong) IBOutlet UITextField *loginNameField;
@property (nonatomic, strong) IBOutlet UILabel *loginPasswordLabel;
@property (nonatomic, strong) IBOutlet UITextField *loginPasswordField;
@property (nonatomic, strong) IBOutlet UIButton *loginButton;
@property (nonatomic, strong) IBOutlet UIButton *regisButton;

@end
