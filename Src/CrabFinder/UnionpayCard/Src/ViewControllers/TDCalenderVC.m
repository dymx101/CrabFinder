//
//  TDCalenderVC.m
//  UnionpayCard
//
//  Created by Dong Yiming on 3/18/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDCalenderVC.h"
#import <MNCalendarView/MNCalendarView.h>

@interface TDCalenderVC () <MNCalendarViewDelegate> {
    MNCalendarView *_calendarView;
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
    _calendarView = [MNCalendarView new];
    _calendarView.backgroundColor = [UIColor redColor];
    _calendarView.selectedDate = [NSDate date];
    _calendarView.delegate = self;
    [self.view addSubview:_calendarView];
}

-(void)setupViews {
    [_calendarView alignToView:self.view];
}


#pragma mark - calendar view delegate
- (void)calendarView:(MNCalendarView *)calendarView didSelectDate:(NSDate *)date {
    DLog(@"selected data:%@", date);
}

@end
