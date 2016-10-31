//
//  RegisterController.m
//  xiaocanMessage
//
//  Created by 王文科 on 2016/10/31.
//  Copyright © 2016年 xiaocan. All rights reserved.
//

#import "RegisterController.h"

@interface RegisterController ()<UITextFieldDelegate>

@end

@implementation RegisterController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"Register";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _regisButton.layer.cornerRadius = 8.0;
    _regisButton.clipsToBounds = YES;
    _alertLabel.hidden = YES;
    [_regisButton addTarget:self action:@selector(registerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiedValueChanged:) name:UITextFieldTextDidChangeNotification object:nil];
}


/** 输入内容发生改变 */
- (void)textFiedValueChanged:(NSNotification *)notifi{
    if (_loginNameField.text.length > 0 && _loginPasswordLabel.text.length > 0 && _confirmSecretField.text.length > 0 && [_confirmSecretField.text isEqualToString:_loginPasswordField.text]) {
        _regisButton.backgroundColor = [UIColor blueColor];
        _regisButton.enabled = YES;
    }else{
        _regisButton.backgroundColor = [UIColor lightGrayColor];
        _regisButton.enabled = NO;
    }
    
    _alertLabel.hidden = YES;
    if (_loginPasswordField.text.length > 0 && _confirmSecretField.text.length > 0 && ![_confirmSecretField.text isEqualToString:_loginPasswordField.text]) {
        _alertLabel.hidden = NO;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"] || [string isEqualToString:@"\r"]) {
        if (textField.returnKeyType == UIReturnKeyNext) {
            if (textField == _loginNameField) {
                [_loginPasswordField becomeFirstResponder];
            }else if (textField == _loginPasswordField){
                [_confirmSecretField becomeFirstResponder];
            }
        }else if (textField.returnKeyType == UIReturnKeyJoin) {
            [self registerButtonClicked:nil];
        }
        return NO;
    }
    return YES;
}


/** 注册 */
- (void)registerButtonClicked:(UIButton *)sender{
    [JMSGUser registerWithUsername:_loginNameField.text password:_confirmSecretField.text completionHandler:^(id resultObject, NSError *error) {
        if (!error) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
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
