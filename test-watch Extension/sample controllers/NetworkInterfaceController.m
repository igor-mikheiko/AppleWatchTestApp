//
//  NetworkInterfaceController.m
//  test123
//
//  Created by Alex Rudyak on 8/5/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "NetworkInterfaceController.h"

@interface NetworkInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *image;

@end

@implementation NetworkInterfaceController {
    NSURLSessionTask *_Nullable _task;
    BOOL _isActive;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];

    _isActive = YES;
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];

    _isActive = NO;
    if (_task.state == NSURLSessionTaskStateRunning) {
        [_task cancel];
    }
}

- (IBAction)getImageActionButton:(id)sender
{
    [[NSProcessInfo processInfo] performExpiringActivityWithReason:@"loadImage" usingBlock:^(BOOL expired) {
        if (!expired) {
            NSURL *const url = [NSURL URLWithString:@"https://pbs.twimg.com/profile_images/3186881240/fa714ece16d0fabccf903cec863b1949_400x400.png"];
            NSURLSessionConfiguration *const configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
            _task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"%@", [error localizedDescription]);
                } else {
                    UIImage *image = [UIImage imageWithData:data];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (_isActive) {
                            [self.image setImage:image];
                        }
                    });
                }
            }];

            [_task resume];
        }
    }];
}

@end



