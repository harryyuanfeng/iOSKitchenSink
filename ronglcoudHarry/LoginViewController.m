//
//  LoginViewController.m
//  ronglcoudHarry
//
//  Created by harryfeng on 9/5/2016.
//  Copyright © 2016 harryfeng. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (nonatomic, strong) UITextField* username;
@property (nonatomic, strong) UITextField* password;
@property (nonatomic, strong) UIButton* loginBtn;
@end


@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    UILabel *usernamel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 150, 30)];
    usernamel.text = @"user name";
    [usernamel sizeToFit];
    [self.view addSubview:usernamel];
    
    UILabel *passwordl = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 150, 30)];
    passwordl.text = @"password";
    [passwordl sizeToFit];
    [self.view addSubview:passwordl];
    
    _username = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    [_username setBackgroundColor:[UIColor whiteColor]];
    _username.textColor = [UIColor blackColor];
    
    _password = [[UITextField alloc] initWithFrame:CGRectMake(100, 150, 200, 30)];
    [_password setBackgroundColor:[UIColor whiteColor]];
    _password.textColor = [UIColor blackColor];
    
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 30)];
    [_loginBtn addTarget:self action:@selector(PressLoginBtn) forControlEvents:UIControlEventTouchDown];
    [_loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_loginBtn setTitle:@"Login" forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[UIColor whiteColor]];
    
    
    [self.view addSubview:_username];
    [self.view addSubview:_password];
    [self.view addSubview:_loginBtn];
    // Do any additional setup after loading the view.
}
-(void)PressLoginBtn{
    [AVUser logInWithUsernameInBackground:_username.text password:_password.text block:^(AVUser *user, NSError *error) {
        if (user != nil) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                                            message:@"Login success"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];

        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:[NSString stringWithFormat:@"%@/%@", @"Login error", error.description]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];

        }
    }];
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
