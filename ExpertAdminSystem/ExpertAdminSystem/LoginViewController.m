//
//  LoginViewController.m
//  ExpertAdminSystem
//
//  Created by P. Chu on 8/19/16.
//  Copyright © 2016 PDC. All rights reserved.
//

#import "LoginViewController.h"
#import "AdminViewController.h"
#import "ExpertViewController.h"

@import Firebase;
@import UIKit;

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *userLevel;
@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwdTF;
@property (weak, nonatomic) IBOutlet UITextField *repasswdTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *regisBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.repasswdTF.enabled = NO;
    
//    self.loginBtn.enabled = (![self.userNameTF.text isEqual:@""]) && (![self.passwdTF.text isEqualToString:@""]);
//    self.loginBtn.enabled = (![self.userNameTF.text isEqual:@""]) && (![self.passwdTF.text isEqualToString:@""]);

}

- (IBAction)login:(id)sender {
}

- (IBAction)register:(id)sender {
    if (self.userLevel.selectedSegmentIndex == 0) {
        NSLog(@" An Expert. ");
        
        [[FIRAuth auth] createUserWithEmail:self.userNameTF.text password:self.passwdTF.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
            NSLog(@"%@", user.email);
            
            UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            ExpertViewController* vc = [sb instantiateViewControllerWithIdentifier:@"expert"];
            vc.user = user;
            
            [self presentViewController:vc animated:YES completion:nil];
        }];
    }
    else {
        NSLog(@" An Admin. ");
    }
}

@end
