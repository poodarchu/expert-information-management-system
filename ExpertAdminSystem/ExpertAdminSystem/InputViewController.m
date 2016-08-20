//
//  InputViewController.m
//  ExpertAdminSystem
//
//  Created by P. Chu on 8/19/16.
//  Copyright © 2016 PDC. All rights reserved.
//

#import "InputViewController.h"
#import "FMDatabase.h"
#import "ExpertViewController.h"

@interface InputViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.uid = self.tabBarController.user.uid;
    
    NSLog(@"%@", self.tabBarController);
    ExpertViewController* evc = (ExpertViewController*)self.tabBarController;
    self.uid = evc.user.uid;
    
    NSLog(@"%@", self.uid);
    
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* dbPath = [doc stringByAppendingPathComponent:@"expert.sqlite"];
    
    FMDatabase* db = [FMDatabase databaseWithPath:dbPath];
    
    if ([db open]) {
        NSString* sql = @"select Name, Email, Checked from UserInfo where UID = \"(null)\";";
        
        FMResultSet* results = [db executeQuery:sql];
        self.nameTF.text = [NSString stringWithFormat:@"-----%@-------", [results stringForColumn:@"Name"]];
        self.emailTF.text = [NSString stringWithFormat:@"-----%@-------", [results stringForColumn:@"Email"]];
        self.statusLabel.text = [NSString stringWithFormat:@"%d", [results intForColumn:@"Checked"]];
        
        [db close];
    }
}

@end
