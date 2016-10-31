//
//  UserLoginController.m
//  xiaocanMessage
//
//  Created by 王文科 on 2016/10/31.
//  Copyright © 2016年 xiaocan. All rights reserved.
//

#import "UserLoginController.h"
#import "RegisterController.h"

@interface UserLoginController ()<UITextFieldDelegate>

@end

@implementation UserLoginController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"Login";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _loginButton.layer.cornerRadius = 8.0;
    _loginButton.clipsToBounds = YES;
    [_loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_regisButton addTarget:self action:@selector(regisButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiedValueChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}

/** 输入内容发生改变 */
- (void)textFiedValueChanged:(NSNotification *)notifi{
    if (_loginNameField.text.length > 0 && _loginPasswordLabel.text.length > 0) {
        _loginButton.backgroundColor = [UIColor blueColor];
        _loginButton.enabled = YES;
    }else{
        _loginButton.backgroundColor = [UIColor lightGrayColor];
        _loginButton.enabled = NO;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"] || [string isEqualToString:@"\r"]) {
        if (textField.returnKeyType == UIReturnKeyNext) {
            [_loginPasswordField becomeFirstResponder];
        }else if (textField.returnKeyType == UIReturnKeyJoin) {
            [self loginButtonClicked:nil];
        }
        return NO;
    }
    return YES;
}



/** 注册账号 */
- (void)regisButtonClicked:(UIButton *)sender{
    RegisterController *registerController = [[RegisterController alloc]init];
    if (self.navigationController) {
        [self.navigationController pushViewController:registerController animated:YES];
    }else if (self.presentedViewController){
        [self presentViewController:registerController animated:YES completion:^{
            
        }];
    }
    
}

/** 登录操作 */
- (void)loginButtonClicked:(UIButton *)sender{
    [JMSGUser loginWithUsername:_loginNameField.text password:_loginPasswordField.text completionHandler:^(id resultObject, NSError *error) {
        if (!error) {
            NSLog(@"%@--\nlogin success",resultObject);
        }
    }];
}


- (BOOL)prefersStatusBarHidden{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}



- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
