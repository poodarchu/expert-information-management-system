//
//  AdminViewController.m
//  ExpertAdminSystem
//
//  Created by P. Chu on 8/19/16.
//  Copyright © 2016 PDC. All rights reserved.
//

#import "AdminViewController.h"
#import "FMDatabase.h"

@interface AdminViewController ()

@property (weak, nonatomic) IBOutlet UILabel *uncheckedCountLabel;
@property (nonatomic) FMDatabase* db;

@end

@implementation AdminViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* dbPath = [doc stringByAppendingPathComponent:@"expert.sqlite"];
    self.db = [FMDatabase databaseWithPath:dbPath];
    
    
    NSString* sql = @"select count(UID) num from UserInfo where Unchecked = 0;";
    if([self.db open]) {
        FMResultSet* result = [self.db executeQuery:sql];
        self.uncheckedCountLabel.text = [NSString stringWithFormat:@"%d", [result intForColumn:@"num"]];
    }
}


- (IBAction)updatePasswd:(id)sender {
    
    UIAlertController* alertController = [UIAlertController alertControllerWithTitle:@"修改密码" message:@"请输入新密码" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入新密码(不少于6个字符)";
        textField.secureTextEntry = YES;
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *password = alertController.textFields.lastObject;
        [self.user updatePassword:password.text completion:nil];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)alertTextFieldDidChange:(NSNotification *)notification{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController) {
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        okAction.enabled = login.text.length > 6;
    }
}

@end
