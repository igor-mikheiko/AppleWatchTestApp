//
//  AnimationInterfaceController.m
//  test123
//
//  Created by Alex Rudyak on 8/5/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "AnimationInterfaceController.h"

@interface AnimationInterfaceController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *pickerControl;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceGroup *progressGroup;

@end

@implementation AnimationInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    NSMutableArray *images = [NSMutableArray array];
    NSMutableArray *pickerItems = [NSMutableArray array];
    for (NSUInteger idx = 0; idx <= 36; ++idx) {
        NSString *name = [NSString stringWithFormat:@"progress-%i", idx];
        [images addObject:[UIImage imageNamed:name]];
        WKPickerItem *pickerItem = [WKPickerItem new];
        pickerItem.title = [NSString stringWithFormat:@"%i", idx];
        [pickerItems addObject:pickerItem];
    }

    UIImage *progressImage = [UIImage animatedImageWithImages:images duration:.0f];
    [self.progressGroup setBackgroundImage:progressImage];
    [self.pickerControl setCoordinatedAnimations:@[self.progressGroup]];
    [self.pickerControl setItems:pickerItems];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



