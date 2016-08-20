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

@property (weak, nonatomic) IBOutlet UITextField *certificateNoTF;

@property (weak, nonatomic) IBOutlet UITextField *assessDateTF;
@property (weak, nonatomic) IBOutlet UITextField *assessNameTF;
@property (weak, nonatomic) IBOutlet UITextField *assessDescTF;

@property (weak, nonatomic) IBOutlet UITextField *workDateTF;
@property (weak, nonatomic) IBOutlet UITextField *companyTF;
@property (weak, nonatomic) IBOutlet UITextField *workTitleTF;

@property (nonatomic) FMDatabase* db;

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
    
    self.db = [FMDatabase databaseWithPath:dbPath];
    
    if ([self.db open]) {
        NSString* sql = @"select Name, Email, Checked from UserInfo where UID = \"(null)\";";
        
        FMResultSet* results = [self.db executeQuery:sql];
        self.nameTF.text = [NSString stringWithFormat:@"-----%@-------", [results stringForColumn:@"Name"]];
        self.emailTF.text = [NSString stringWithFormat:@"-----%@-------", [results stringForColumn:@"Email"]];
        self.statusLabel.text = [NSString stringWithFormat:@"%d", [results intForColumn:@"Checked"]];
        
        [self.db close];
    }
}
- (IBAction)commitUpdate:(id)sender {
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* dbPath = [doc stringByAppendingPathComponent:@"expert.sqlite"];
    FMDatabase* db = [FMDatabase databaseWithPath:dbPath];
    
    if ([db open]) {
        NSString* sql = @"iupdate UserInfo set CertificateNO = self.CertificateNOTF.text, CertificateDate = self.CertificateDateTF.text, Sex = self.SexTF.text, Birthday = self.BirthdayTF.text, IdNo = self.IdNoTF.text, Phone = self.PhoneTF.text, Address = self.AddressTF.text where UID = self.user.uid;";
        [db executeUpdate:sql];
        
        if (![self.certificateNoTF.text  isEqual: @""]) {
            NSString* insertSQL = @"insert into Assessment(CertificateNO) values (self.CertificateNOTF.text);";
            [db executeUpdate:insertSQL];
        }
        
        [db close];
    }
}

- (IBAction)addAssessmentRecord:(id)sender {
    NSString* sql = @"update Assessment set AssessDate = self.assessDateTF.text, AssessmentName = self.assessNameTF.text, AssessmentDesc = self.assessDescTF.text where CertificateNO = self.CertificateNOTF.text;";
    if ([self.db open]) {
        [self.db executeUpdate:sql];
        
        [self.db close];
    }
}

- (IBAction)addWorkExperience:(id)sender {
    //同上。
}





@end
