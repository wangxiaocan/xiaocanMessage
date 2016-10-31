//
//  RegisterController.h
//  xiaocanMessage
//
//  Created by 王文科 on 2016/10/31.
//  Copyright © 2016年 xiaocan. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 账号注册 */
@interface RegisterController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *loginNameLabel;
@property (nonatomic, strong) IBOutlet UITextField *loginNameField;
@property (nonatomic, strong) IBOutlet UILabel *loginPasswordLabel;
@property (nonatomic, strong) IBOutlet UITextField *loginPasswordField;
@property (nonatomic, strong) IBOutlet UILabel *confirmLoginNameLabel;
@property (nonatomic, strong) IBOutlet UITextField *confirmSecretField;
@property (nonatomic, strong) IBOutlet UIButton *regisButton;
@property (nonatomic, strong) IBOutlet UILabel *alertLabel;

@end
