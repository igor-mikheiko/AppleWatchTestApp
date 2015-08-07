//
//  ViewController.m
//  test123
//
//  Created by Alex Rudyak on 7/29/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "ViewController.h"
@import WatchConnectivity;
#import "Constants.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendAlertActionButton:(id)sender
{
    if (![[WCSession defaultSession] isReachable]) {

    } else {
        WCSession *session = [WCSession defaultSession];
        NSDictionary<NSString *, NSString *> *messageDict = @{ WatchNotificationRequestKey: @"alert" };
        [session sendMessage:messageDict replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {

        } errorHandler:^(NSError * _Nonnull error) {

        }];
    }
}

@end
