//
//  TDCalenderVC.m
//  UnionpayCard
//
//  Created by Dong Yiming on 3/18/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDCalenderVC.h"
#import <MBCalendarKit/CalendarKit.h>
#import <MBCalendarKit/NSDate+Components.h>

@interface TDCalenderVC () <CKCalendarViewDelegate, CKCalendarViewDataSource>
{
    CKCalendarView *_calendarView;
}

@end

@implementation TDCalenderVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Calendar";
    
    [self initViews];
    [self setupViews];
}

-(void)initViews {
    _calendarView = [CKCalendarView new];
    [_calendarView setDelegate:self];
    [_calendarView setDataSource:self];
    [[self view] addSubview:_calendarView];
}

-(void)setupViews {
    //[_calendarView alignToView:self.view];
}

#pragma mark -
- (NSArray *)calendarView:(CKCalendarView *)calendarView eventsForDate:(NSDate *)date {
    NSDate *eventDate = [NSDate dateWithDay:18 month:3 year:2014];
    CKCalendarEvent *event1 = [CKCalendarEvent eventWithTitle:@"test1" andDate:eventDate andInfo:nil];
    CKCalendarEvent *event2 = [CKCalendarEvent eventWithTitle:@"test2" andDate:eventDate andInfo:nil];
    return ([eventDate timeIntervalSinceDate:date] == 0) ? @[event1, event2] : nil;
}

- (void)calendarView:(CKCalendarView *)CalendarView willSelectDate:(NSDate *)date {
    
}

- (void)calendarView:(CKCalendarView *)CalendarView didSelectDate:(NSDate *)date {
    DLog(@"date:%@ tapped", date);
}

- (void)calendarView:(CKCalendarView *)CalendarView didSelectEvent:(CKCalendarEvent *)event {
    DLog(@"event:%@ tapped", event.title);
}

@end
