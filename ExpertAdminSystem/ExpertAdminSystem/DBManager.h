//
//  DBManager.h
//  ExpertAdminSystem
//
//  Created by P. Chu on 8/19/16.
//  Copyright © 2016 PDC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject {
    NSString* databasePath;
}

+ (DBManager *)getSharedInstance;
- (BOOL) createDB;
- (BOOL) saveData: (NSString*) registerNumber name:(NSString *) name department:(NSString *)department year:(NSString *) year;
- (NSArray*) findByRegisterBumber:(NSString *) registerNumber;

@end
