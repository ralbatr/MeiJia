//
//  BookDetailViewController.h
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TimePickerView;

@interface BookDetailViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,strong) UIButton *timeButton;
@property (nonatomic,strong) TimePickerView *timePickerView;
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong) NSString *timeString;
@property (nonatomic,strong) UILabel *timeLabel;

@end
