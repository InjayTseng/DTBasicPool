//
//  Person.h
//  DTBasicPool
//
//  Created by David Tseng on 5/8/13.
//  Copyright (c) 2013 David Tseng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (readwrite, nonatomic) int age;
@property (strong, nonatomic) NSString * firstName;
@property (strong, nonatomic) NSString * lastName;
@property (strong, nonatomic) NSString * nickName;

@end
