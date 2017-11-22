//
//  MoveAnimationViewController.m
//  TL_AnimationCell
//
//  Created by tongle on 2017/11/22.
//  Copyright © 2017年 tong. All rights reserved.
//

#import "MoveAnimationViewController.h"

#define Width self.view.frame.size.width
#define Heigth self.view.frame.size.height

@interface MoveAnimationViewController ()
@property (nonatomic,strong)UITextField * nameTextField;
@property (nonatomic,strong)UITextField * passwordTextField;
@property (nonatomic,strong)UIButton * loginBtn;

@end

@implementation MoveAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.nameTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginBtn];
    [UIView animateWithDuration:1 animations:^{
        CGFloat x = self.nameTextField.frame.origin.x;
        x += Width - 40;
        self.nameTextField.alpha = 1.0;
        [self.nameTextField setFrame:CGRectMake(x, 100, Width - 80, 50)];
    } completion:^(BOOL finished) {
        
    }];
    [UIView animateWithDuration:1 delay:0.5 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        CGFloat x = self.passwordTextField.frame.origin.x;
        x -= Width - 40;
        self.passwordTextField.alpha = 1.0;
        [self.passwordTextField setFrame:CGRectMake(x, 200, Width - 80, 50)];
    } completion:^(BOOL finished) {

    }];
    [UIView animateWithDuration:1 delay:1 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.loginBtn.alpha =1.0;
        [self.loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    } completion:^(BOOL finished) {
        
    }];
}

- (UITextField *)nameTextField{
    if (_nameTextField == nil) {
        _nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(80-Width, 100, Width - 40, 50)];
        _nameTextField.placeholder = @"Please into your name";
        _nameTextField.layer.borderWidth = 1;
        _nameTextField.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _nameTextField.alpha = 0.0;
    }
    return _nameTextField;
}
- (UITextField *)passwordTextField{
    if (_passwordTextField == nil) {
        _passwordTextField = [[UITextField alloc]initWithFrame:CGRectMake(Width, 200, Width - 40, 50)];
        _passwordTextField.placeholder = @"Please into your password";
        _passwordTextField.layer.borderWidth = 1;
        _passwordTextField.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _passwordTextField.alpha = 0.0;
    }
    return _passwordTextField;
}
- (UIButton *)loginBtn{
    if (_loginBtn == nil) {
        _loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(Width / 2.0 -100, 300, 200, 50)];
        _loginBtn.backgroundColor = [UIColor purpleColor];
        _loginBtn.alpha = 0.0;
    }
    return _loginBtn;
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
