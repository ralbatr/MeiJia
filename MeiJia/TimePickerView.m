//
//  TimePickerView.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-15.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "TimePickerView.h"

@implementation TimePickerView

- (id)initWithFrame:(CGRect)frame WithTarget:(id)target andSelector:(SEL)selector
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatDatepackerWithTarget:target andSelector:selector];
    }
    return self;
}

- (void)creatDatepackerWithTarget:(id)target andSelector:(SEL)selector
{
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.center = CGPointMake(160, 160);
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.backgroundColor = [UIColor whiteColor];
    datePicker.tag = 102;
    [self addSubview:datePicker];
    
    UIButton *timeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    timeButton.frame = CGRectMake(160, datePicker.frame.size.height + 40, 60, 30);
    [timeButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [timeButton setTitle:@"确 定" forState:UIControlStateNormal];
    [self addSubview:timeButton];
}


@end
