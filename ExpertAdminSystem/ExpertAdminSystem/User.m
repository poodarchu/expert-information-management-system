//
//  User.m
//  ExpertAdminSystem
//
//  Created by P. Chu on 8/19/16.
//  Copyright © 2016 PDC. All rights reserved.
//

#import "User.h"

@implementation User


+ (User *)userWithFIRUser:(FIRUser *)user Level:(Level)level {
    
    User * u = user;
    u.userLevel = level;
    
    return u;
}

@end
