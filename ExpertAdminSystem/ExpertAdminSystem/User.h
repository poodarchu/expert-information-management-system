//
//  User.h
//  ExpertAdminSystem
//
//  Created by P. Chu on 8/19/16.
//  Copyright © 2016 PDC. All rights reserved.
//

#import <Foundation/Foundation.h>
@import FirebaseAuth;

typedef enum : NSUInteger {
    kAdmin,
    kExpert
} Level;


@interface User : FIRUser

@property (nonatomic, readwrite) Level userLevel;

+ (User*)userWithFIRUser:(FIRUser*)user Level:(Level)level;

@end
