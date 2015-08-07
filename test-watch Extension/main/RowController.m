//
//  RowController.m
//  test123
//
//  Created by Alex Rudyak on 8/4/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "RowController.h"
@import WatchKit;

@interface RowController ()

@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *titleLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *detailLabel;

@end

@implementation RowController

- (void)setTitle:(NSString *)title andDetails:(NSString *)details
{
    [self.titleLabel setText:title];
    [self.detailLabel setText:details];
}

@end
