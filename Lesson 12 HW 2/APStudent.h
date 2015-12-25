//
//  APStudent.h
//  Lesson 12 HW 2
//
//  Created by Alex on 25.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APStudent : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* lastName;
@property (assign, nonatomic) float temperature;
@property (assign, nonatomic) BOOL areYouOk;

@end
