//
//  ComplicationController.m
//  test-watch Extension
//
//  Created by Alex Rudyak on 7/29/15.
//  Copyright © 2015 *instinctools. All rights reserved.
//

#import "ComplicationController.h"

@interface ComplicationController ()

@end

@implementation ComplicationController

#pragma mark - Timeline Configuration

- (void)getSupportedTimeTravelDirectionsForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTimeTravelDirections directions))handler {
    handler(CLKComplicationTimeTravelDirectionNone);
}

- (void)getTimelineStartDateForComplication:(CLKComplication *)complication withHandler:(void(^)(__nullable NSDate *date))handler {
    handler(nil);
}

- (void)getTimelineEndDateForComplication:(CLKComplication *)complication withHandler:(void(^)(__nullable NSDate *date))handler {
    handler(nil);
}

- (void)getPrivacyBehaviorForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationPrivacyBehavior privacyBehavior))handler {
    handler(CLKComplicationPrivacyBehaviorShowOnLockScreen);
}

#pragma mark - Timeline Population

- (void)getCurrentTimelineEntryForComplication:(CLKComplication *)complication withHandler:(void(^)(__nullable CLKComplicationTimelineEntry *))handler {
    // Call the handler with the current timeline entry

    NSUInteger number = (NSUInteger)[NSDate timeIntervalSinceReferenceDate] % 100;
    NSUInteger second = number / 7;
    CLKComplicationTemplate *template = nil;

    switch (complication.family) {
        case CLKComplicationFamilyModularSmall: {
            CLKComplicationTemplateModularSmallStackText *complication = [CLKComplicationTemplateModularSmallStackText new];
            complication.line1TextProvider = [CLKSimpleTextProvider textProviderWithText:[NSString stringWithFormat:@"1st: %i", number] shortText:[NSString stringWithFormat:@"%i", number]];
            complication.line1TextProvider.tintColor = [UIColor orangeColor];
            complication.line2TextProvider = [CLKSimpleTextProvider textProviderWithText:[NSString stringWithFormat:@"2nd: %i", second] shortText:[NSString stringWithFormat:@"%i", second]];;
            complication.highlightLine2 = YES;
            template = complication;
            break;
        }
        case CLKComplicationFamilyModularLarge: {

            break;
        }
        case CLKComplicationFamilyUtilitarianSmall: {

            break;
        }
        case CLKComplicationFamilyUtilitarianLarge: {

            break;
        }
        case CLKComplicationFamilyCircularSmall: {

            break;
        }
        default: {
            break;
        }
    }

    if (template) {
        CLKComplicationTimelineEntry *timeline = [CLKComplicationTimelineEntry entryWithDate:[NSDate date] complicationTemplate:template];
        handler(timeline);
    } else {
        handler(nil);
    }
}

- (void)getTimelineEntriesForComplication:(CLKComplication *)complication beforeDate:(NSDate *)date limit:(NSUInteger)limit withHandler:(void(^)(__nullable NSArray<CLKComplicationTimelineEntry *> *entries))handler {
    // Call the handler with the timeline entries prior to the given date
    handler(nil);
}

- (void)getTimelineEntriesForComplication:(CLKComplication *)complication afterDate:(NSDate *)date limit:(NSUInteger)limit withHandler:(void(^)(__nullable NSArray<CLKComplicationTimelineEntry *> *entries))handler {
    // Call the handler with the timeline entries after to the given date
    handler(nil);
}

#pragma mark Update Scheduling

- (void)getNextRequestedUpdateDateWithHandler:(void(^)(__nullable NSDate *updateDate))handler {
    // Call the handler with the date when you would next like to be given the opportunity to update your complication content
    handler([NSDate dateWithTimeIntervalSinceNow:30]);
}

#pragma mark - Placeholder Templates

- (void)getPlaceholderTemplateForComplication:(CLKComplication *)complication withHandler:(void(^)(__nullable CLKComplicationTemplate *complicationTemplate))handler {
    // This method will be called once per supported complication, and the results will be cached
    CLKComplicationTemplate *template = nil;
    switch (complication.family) {
        case CLKComplicationFamilyModularSmall: {
            CLKComplicationTemplateModularSmallStackText *complication = [CLKComplicationTemplateModularSmallStackText new];
            complication.line1TextProvider = [CLKSimpleTextProvider textProviderWithText:@"1st: --" shortText:@"--"];
            complication.line1TextProvider.tintColor = [UIColor orangeColor];
            complication.line2TextProvider = [CLKSimpleTextProvider textProviderWithText:@"2nd: --" shortText:@"--"];
            complication.highlightLine2 = YES;
            template = complication;
            break;
        }
        case CLKComplicationFamilyModularLarge: {
//            CLKComplicationTemplateModularLargeTallBody *complication = [CLKComplicationTemplateModularLargeTallBody new];
//            template = complication;
            template = nil;
            break;
        }
        case CLKComplicationFamilyUtilitarianSmall: {
            template = nil;
            break;
        }
        case CLKComplicationFamilyUtilitarianLarge: {
            template = nil;
            break;
        }
        case CLKComplicationFamilyCircularSmall: {
            template = nil;
            break;
        }
        default: {
            break;
        }
    }
    handler(template);
}

@end
