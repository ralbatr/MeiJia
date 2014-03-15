//
//  TimePickerView.h
//  MeiJia
//
//  Created by Ralbatr on 14-3-15.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimePickerView : UIView

@property (nonatomic,strong) UIDatePicker *datePicker;

- (id)initWithFrame:(CGRect)frame WithTarget:(id)target andSelector:(SEL)selector;

@end
