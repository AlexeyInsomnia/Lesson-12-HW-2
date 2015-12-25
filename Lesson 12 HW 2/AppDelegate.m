//
//  AppDelegate.m
//  Lesson 12 HW 2
//
//  Created by Alex on 25.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "AppDelegate.h"
#import "APStudent.h"

typedef void (^OurTestBlock)(void);
typedef void (^OurTestBlockWithParams)(NSString*, NSInteger);
typedef NSString* (^OurTestBlockWillReturnValueWithParams)(NSString*, NSInteger);

@interface AppDelegate ()

@property (strong, nonatomic) NSArray* arraySuper;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"******************************* pupil mode is ON *******************************");
    [self testMethod];
    
    void (^testBlock)(void);

    testBlock = ^ {
        NSLog(@"this is testBlock");
    };
    testBlock (); // можем дублировать эту строчку кратно и вызывать блок много раз
    
    // now the same but with typedef
    
    OurTestBlock testBlock2 = ^ {
        NSLog(@"this is testBlock2");
    };
    
    testBlock2 ();
    
    [self testMethodWithParams:@" random text" value:5551];
    
    void (^testBlockWithParams)(NSString*, NSInteger);

    testBlockWithParams = ^(NSString* string, NSInteger intValue) {
        NSLog(@"this is testBlockWithParams - %@, %ld",string, intValue);
    };
    
    testBlockWithParams(@" string for testBlockWithParams", 5552);
    
    // now the same but with typedef
    
    OurTestBlockWithParams testBlockWithParams2 = ^(NSString* string, NSInteger intValue) {
        NSLog(@"this is testBlockWithParams2 - %@, %ld",string, intValue);
    };
    testBlockWithParams2(@" string for testBlockWithParams2", 5555);

    
    
    NSString* result = [self testMethodWillReturnValueWithParams:@"random string for WillValue method" value:5553];
    NSLog(@"%@",result);
    
    NSString* (^testBlockWillReturnValueWithParams)(NSString*, NSInteger);
    
    testBlockWillReturnValueWithParams = ^(NSString* string, NSInteger intValue) {
        return [NSString stringWithFormat:@"this is testBlockWillReturnValueWithParams - %@, %ld", string, intValue];
    };
    
    NSString* resultForBlock = testBlockWillReturnValueWithParams(@"test string for block", 5554);
    
    NSLog(@"%@",resultForBlock);
    
    // now the same but with typedef
  
    OurTestBlockWillReturnValueWithParams testBlockWillReturnValueWithParams2;
    
    testBlockWillReturnValueWithParams2 = ^(NSString* string, NSInteger intValue) {
        return [NSString stringWithFormat:@"this is testBlockWillReturnValueWithParams2 - %@, %ld", string, intValue];
    };
    
    NSString* resultForBlock2 = testBlockWillReturnValueWithParams2(@"test string for block2", 5556);
    
    NSLog(@"%@",resultForBlock2);
    
    
    OurTestBlock abbb;
    
    abbb = ^{
        NSLog(@"that is inside of testBlock that is in method variant A");
    };
    
    [self testBlockmethod:abbb];
    
    [self testBlockmethod:^{
        NSLog(@"that is inside of testBlock that is in method variant B" );
    }];
    
    
    NSLog(@"******************************* student mode is ON *******************************");
    
    
    
    APStudent* student1 = [[APStudent alloc] init];
    student1.name = @"Betta";
    student1.lastName = @"Snow";
    student1.temperature = (36.f +  (float)(arc4random() % 411) / 100.f);
    
    
    APStudent* student2 = [[APStudent alloc] init];
    student2.name = @"Celica";
    student2.lastName = @"Altunieva";
    student2.temperature = (36.f +  (float)(arc4random() % 411) / 100.f);
    
    APStudent* student3 = [[APStudent alloc] init];
    student3.name = @"Alisa";
    student3.lastName = @"Snow";
    student3.temperature = (36.f +  (float)(arc4random() % 411) / 100.f);
    
    APStudent* student4 = [[APStudent alloc] init];
    student4.name = @"Durunda";
    student4.lastName = @"Biruleva";
    student4.temperature = (36.f +  (float)(arc4random() % 411) / 100.f);
    
    NSArray* array = [[NSArray alloc] initWithObjects:student1, student2,student3, student4, nil];
    NSLog(@"was %@", array);
    
    //NSMutableArray* arraySorted = [[NSMutableArray alloc] init];
    
    array = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        if ([[(APStudent*)obj1 lastName] isEqual:[(APStudent*)obj2 lastName]]) {
            return [[(APStudent*)obj1 name] compare:[(APStudent*)obj2 name]];
        } else {
            return [[(APStudent*)obj1 lastName] compare:[(APStudent*)obj2 lastName]];
        }
 
    }];
    
    NSLog(@"after sort %@", array);
    
    NSLog(@"******************************* master mode is ON *******************************");
    
    for (APStudent* patients in array) {
        BOOL howRU = arc4random() %2;
        NSLog(@"%@ do U feel good ? %@", patients.name, howRU ? @"YES":@"NO");
        if (!howRU) {
            [self whenNotGood:^{
                
                if (patients.temperature >=37.f && patients.temperature <=39.f) {
                    NSLog(@"patient take a pill, cause temperature is - %.2f !", patients.temperature) ;
                } else {
                    if (patients.temperature >=39.f){
                        NSLog(@"patient make a shot, cause temperature is - %.2f !", patients.temperature) ;
                    } else {
                    NSLog(@"go REST for CURE , cause temperature is - %.2f ! !",patients.temperature) ;
                }
                    
                }
                
            }];
        };
        
    }
    
    NSLog(@"******************************* superMan mode is ON *******************************");

    

    


    
    


    return YES;
}

- (void) testMethod {
    NSLog(@"this is testMethod");
}

- (void) testMethodWithParams:(NSString*) string value:(NSInteger) intValue {
    NSLog(@"this is testMethodWithParams%@, %ld", string, intValue);
}

- (NSString*) testMethodWillReturnValueWithParams:(NSString*) string value:(NSInteger) intValue {
    return [NSString stringWithFormat:@"this is testMethodWillReturnValueWithParams - %@, %ld", string, intValue];
}

- (void) testBlockmethod:(void (^)(void)) testBlock {
    NSLog(@"testBlock right in testBlockmethod");
    testBlock ();
    testBlock ();
}

- (void) whenNotGood:(void (^)(void)) blockForCure {
    NSLog(@"method whenNotGood with blockForCure is ON");
    blockForCure();
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
