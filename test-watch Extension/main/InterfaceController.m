//
//  InterfaceController.m
//  test-watch Extension
//
//  Created by Alex Rudyak on 7/29/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "InterfaceController.h"
#import "RowController.h"

static NSString *const kDefaultRowCellIdentifier = @"CellDefault";

static NSString *const kCellTitleKey = @"title";
static NSString *const kCellDetailsKey = @"details";
static NSString *const kCellSegueIdentifierKey = @"segueId";

@interface InterfaceController()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *table;

@end


@implementation InterfaceController {
    NSArray<NSDictionary<NSString *, NSString *> *> *items;
}

- (nonnull instancetype)init
{
    self = [super init];
    if (self) {
        items = @[
                  @{
                      kCellSegueIdentifierKey: @"AnimatedProperties",
                      kCellTitleKey: @"Animated Props",
                      kCellDetailsKey: @"Animate width/height and alignments."
                      },
                  @{
                      kCellSegueIdentifierKey: @"Message",
                      kCellTitleKey: @"Messaging",
                      kCellDetailsKey: @"Sending message to phone and receiving from phone demo with WatchConnectivity."
                      },
                  @{
                      kCellSegueIdentifierKey: @"Animation",
                      kCellTitleKey: @"Scroll Animation",
                      kCellDetailsKey: @"Coordinated Animations with WKInterfacePicker and Digital Crown."
                      },
                  @{
                      kCellSegueIdentifierKey: @"Network",
                      kCellTitleKey: @"Network",
                      kCellDetailsKey: @"Get an image data from network using NSURLSession."
                      },
                  @{
                      kCellSegueIdentifierKey: @"ExternalURL",
                      kCellTitleKey: @"Externals",
                      kCellDetailsKey: @"Open Tel or SMS app using openSystemURL: method."
                      },
                  @{
                      kCellSegueIdentifierKey: @"Alert",
                      kCellTitleKey: @"Alerts",
                      kCellDetailsKey: @"Present an alert or action sheet."
                      }];
    }
    return self;
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    [self.table setNumberOfRows:items.count withRowType:kDefaultRowCellIdentifier];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];

    [items enumerateObjectsUsingBlock:^(NSDictionary *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        RowController *rowController = [self.table rowControllerAtIndex:idx];
        NSDictionary*item = items[idx];
        [rowController setTitle:item[kCellTitleKey] andDetails:item[kCellDetailsKey]];
    }];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)table:(nonnull WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex
{
    NSDictionary *item = items[rowIndex];
    [self pushControllerWithName:item[kCellSegueIdentifierKey] context:nil];
}

@end



