//
//  MessageToPhoneInterfaceController.m
//  test123
//
//  Created by Alex Rudyak on 8/4/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "MessageToPhoneInterfaceController.h"
#import "Constants.h"
@import WatchConnectivity;

@interface MessageToPhoneInterfaceController () <WCSessionDelegate>

@end

@implementation MessageToPhoneInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    
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

- (IBAction)sendActionButton
{
    NSDictionary *message = @{ PhoneNotificationRequestKey: @"fireUserEvent" };
    [[WCSession defaultSession] sendMessage:message replyHandler:^(NSDictionary<NSString *,id> * _Nonnull replyMessage) {

    } errorHandler:^(NSError * _Nonnull error) {

    }];
}

#pragma mark -

- (void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *, id> *)message replyHandler:(nonnull void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler
{
    if ([message[WatchNotificationRequestKey] isEqualToString:@"alert"]) {
        WKAlertAction *alert = [WKAlertAction actionWithTitle:@"Ok" style:WKAlertActionStyleDefault handler:^{

        }];
        [self presentAlertControllerWithTitle:@"Message Received" message:@"" preferredStyle:WKAlertControllerStyleAlert actions:@[alert]];
    }
}

@end



