//
//  ExternalUrlInterfaceController.m
//  test123
//
//  Created by Alex Rudyak on 8/6/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "ExternalUrlInterfaceController.h"

@interface ExternalUrlInterfaceController ()

@end

@implementation ExternalUrlInterfaceController

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

- (IBAction)openTelephoneActionButton:(id)sender
{
    NSURL *const telUrl = [NSURL URLWithString:@"tel:"];
    [[WKExtension sharedExtension] openSystemURL:telUrl];
}

- (IBAction)openTextActionButton:(id)sender
{
    NSURL *const smsUrl = [NSURL URLWithString:@"sms:"];
    [[WKExtension sharedExtension] openSystemURL:smsUrl];
}

@end



