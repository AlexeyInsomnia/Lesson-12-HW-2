//
//  APStudent.m
//  Lesson 12 HW 2
//
//  Created by Alex on 25.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "APStudent.h"

@implementation APStudent

- (instancetype)init
{
    self = [super init];
    if (self) {
        float delayRandomIs = (5.f +  (float)(arc4random() % 501) / 100.f);
        [self performSelector:@selector(testSelector) withObject:nil afterDelay:delayRandomIs];
        NSLog(@"delay is - %.2f", delayRandomIs);
    }
    return self;
}

- (void) testSelector{
    [self whenNotGood:^{
        
        if (self.temperature >=37.f && self.temperature <=39.f) {
            NSLog(@"patient - %@ take a pill, cause temperature is - %.2f !", self.name, self.temperature) ;
        } else {
            if (self.temperature >=39.f){
                NSLog(@"patient - %@ make a shot, cause temperature is - %.2f !", self.name,  self.temperature) ;
            } else {
                NSLog(@"patient %@ - go REST for CURE , cause temperature is - %.2f ! !", self.name, self.temperature) ;
            }
            
        }
        
    }];

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
