//
//  BookDetailViewController.h
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TimePickerView;
@class ComboxView;

@interface BookDetailViewController : UIViewController <UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIButton *timeButton;
@property (nonatomic,strong) TimePickerView *timePickerView;
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong) NSString *timeString;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *discArray;
@property (nonatomic,strong) ComboxView *day;
@property (nonatomic,strong) ComboxView *hour;
@property (nonatomic,strong) ComboxView *minute;

@end
