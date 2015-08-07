//
//  AnimatedPropertiesInterfaceController.m
//  test123
//
//  Created by Alex Rudyak on 8/4/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "AnimatedPropertiesInterfaceController.h"

@interface AnimatedPropertiesInterfaceController ()

@end

@implementation AnimatedPropertiesInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)scaleActionButton:(id)sender
{
    [self animateWithDuration:.5 animations:^{
        [self.image setWidth:100];
        [self.image setHeight:160];
    }];

    dispatch_time_t when =  dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_after(when, queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self animateWithDuration:.5 animations:^{
                [self.image setWidth:50];
                [self.image setHeight:80];
            }];
        });
    });
}

- (IBAction)fadeActionButton:(id)sender
{
    [self animateWithDuration:.5 animations:^{
        [self.image setAlpha:0.f];
    }];

    dispatch_time_t when =  dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_after(when, queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self animateWithDuration:.5 animations:^{
                [self.image setAlpha:1.f];
            }];
        });
    });
}

- (IBAction)moveActionButton:(id)sender
{
    [self animateWithDuration:.5 animations:^{
        [self.image setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentRight];
    }];

    dispatch_time_t when1 =  dispatch_time(DISPATCH_TIME_NOW, 0.8 * NSEC_PER_SEC);
    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_after(when1, queue1, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self animateWithDuration:.2 animations:^{
                [self.image setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentLeft];
            }];
        });
    });

    dispatch_time_t when2 =  dispatch_time(DISPATCH_TIME_NOW, 1.2 * NSEC_PER_SEC);
    dispatch_queue_t queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_after(when2, queue2, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self animateWithDuration:.5 animations:^{
                [self.image setHorizontalAlignment:WKInterfaceObjectHorizontalAlignmentCenter];
            }];
        });
    });
}

@end



