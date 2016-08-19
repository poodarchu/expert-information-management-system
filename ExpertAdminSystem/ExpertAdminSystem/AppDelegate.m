//
//  AppDelegate.m
//  ExpertAdminSystem
//
//  Created by P. Chu on 8/18/16.
//  Copyright © 2016 PDC. All rights reserved.
//

#import "AppDelegate.h"
#import "FMDatabase.h"

@import UIKit;
@import Firebase;


static FMDatabase* sharedDB;

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [FIRApp configure];
    
    NSString* doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* dbPath = [doc stringByAppendingPathComponent:@"expert.sqlite"];
    
    sharedDB = [FMDatabase databaseWithPath:dbPath];

    NSFileManager* fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:dbPath] == NO) {
        
        if ([sharedDB open]) {
            NSString* sql1 = @"create table UserInfo (UID TEXT PRIMARY KEY NOT NULL,Name TEXT,Sex  Text,Birthday Text,CertificateNO INT,CertificateDate TEXT,IdNo TEXT,Phone TEXT,Email TEXT NOT NULL,Address TEXT,Others TEXT, Checked INT);";
            BOOL result1 = [sharedDB executeUpdate:sql1];
            
            NSString* sql2 = @"create table Assessment (CertificateNO INT PRIMARY KEY NOT NULL,AssessmentRecord TEXT,AssessDate TEXT,AssessmentName CHAR(20),AssessmentDesc TEXT,AssessmentType INT);";
            BOOL result2 = [sharedDB executeUpdate:sql2];
            
            NSString* sql3 = @"create table Work (UID TEXT PRIMARY KEY NOT NULL,StartDate TEXT,EndDate TEXT,Company TEXT,Position TEXT,Prover TEXT);";
            BOOL result3 = [sharedDB executeUpdate:sql3];
            
            if (result1 && result2 && result3) {
                NSLog(@"数据库创建成功");
            } else
                NSLog(@"数据库创建失败");
            
            [sharedDB close];
        }
    }

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
