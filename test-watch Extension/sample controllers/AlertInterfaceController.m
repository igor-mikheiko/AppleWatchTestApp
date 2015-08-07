//
//  AlertInterfaceController.m
//  test123
//
//  Created by Alex Rudyak on 8/6/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "AlertInterfaceController.h"

@interface AlertInterfaceController ()

@end

@implementation AlertInterfaceController

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

- (void)showAlertWithStyle:(WKAlertControllerStyle)style
{
    WKAlertAction *defaultAction = [WKAlertAction actionWithTitle:@"Default" style:WKAlertActionStyleDefault handler:^{

    }];
    WKAlertAction *cancelAction = [WKAlertAction actionWithTitle:@"Cancel" style:WKAlertActionStyleCancel handler:^{

    }];
    WKAlertAction *descructiveAction = [WKAlertAction actionWithTitle:@"Descruct" style:WKAlertActionStyleDestructive handler:^{
        
    }];

    NSMutableArray *actions = [@[defaultAction, cancelAction] mutableCopy];

    if (style != WKAlertControllerStyleSideBySideButtonsAlert) {
        [actions addObject:descructiveAction];
    }

    [self presentAlertControllerWithTitle:@"Test" message:@"Test message" preferredStyle:style actions:actions];
}

- (IBAction)showSimpleAlertActionButton:(id)sender
{
    [self showAlertWithStyle:WKAlertControllerStyleAlert];
}

- (IBAction)showSideBySideAlertActionButton:(id)sender
{
    [self showAlertWithStyle:WKAlertControllerStyleSideBySideButtonsAlert];
}

- (IBAction)showActionSheetActionButton:(id)sender
{
    [self showAlertWithStyle:WKAlertControllerStyleActionSheet];
}

@end



