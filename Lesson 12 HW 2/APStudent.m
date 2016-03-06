//
//  APStudent.m
//  Lesson 12 HW 2
//
//  Created by Alex on 25.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "APStudent.h"


@implementation APStudent

- (instancetype)initWithBlock:(OurBlockForSuperman) blockForSuperman
{
    self = [super init];
    if (self) {
        float delayRandomIs = (5.f +  (float)(arc4random() % 501) / 100.f);
        
        [self performSelector:@selector(testSelector:) withObject:blockForSuperman afterDelay:delayRandomIs];
        

        NSLog(@"delay is - %.2f", delayRandomIs);
    }
    return self;
}

- (void) testSelector: (OurBlockForSuperman) blockObject {
    
    NSLog(@"%@", blockObject(self));
}



- (void) whenNotGood:(void (^)(void)) blockForCure {
    NSLog(@"method whenNotGood with blockForCure is ON");
    blockForCure();
}



- (NSString *)description
{
    return [NSString stringWithFormat:@"%@, %@, %.2f", self.name, self.lastName, self.temperature];
}

@end
