//
//  EHomeViewController.m
//  ExpertAdminSystem
//
//  Created by P. Chu on 8/19/16.
//  Copyright © 2016 PDC. All rights reserved.
//

#import "EHomeViewController.h"
#import "LoginViewController.h"
#import "ExpertViewController.h"


@import FirebaseAuth;

@interface EHomeViewController ()

@property (nonatomic) FIRUser* user;

@property (weak, nonatomic) IBOutlet UITextField *oldPasswdTF;
@property (weak, nonatomic) IBOutlet UITextField *rePasswdTF;
@property (weak, nonatomic) IBOutlet UITextField *passwdTF;

@end

@implementation EHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ExpertViewController* vc = self.tabBarController;
    self.user = vc.user;
}

- (IBAction)logout:(id)sender {
    
    
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController* vc = [sb instantiateViewControllerWithIdentifier:@"main"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)updatePasswd:(id)sender {
    [[FIRAuth auth] signInWithEmail:self.user.email password:self.oldPasswdTF.text completion:^(FIRUser * _Nullable user, NSError * _Nullable error) {
        if (user && [self.passwdTF.text isEqualToString:self.rePasswdTF.text]) {
            [user updatePassword:self.passwdTF.text completion:nil];
        }
    }];
}
@end
