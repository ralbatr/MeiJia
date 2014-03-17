//
//  BookDetailViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "BookDetailViewController.h"
#import "TimePickerView.h"
#import "DatePickerViewController.h"
#import "ServierView.h"

#define kOrderNumber 2

@interface BookDetailViewController ()

@end

@implementation BookDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //add label
    [self creatLabel];
    [self creatTextField];
    _discArray = [NSArray arrayWithObjects:@"服务项目1",@"服务项目2", @"服务项目3",@"服务项目4",@"服务项目5",@"服务项目6",nil];
    [self creatTableView];
    
}

- (void)creatLabel
{
    UILabel *Idlabel = [[UILabel alloc] init];
    Idlabel.frame = CGRectMake(15, 65, 220, 30);
    Idlabel.text = @"会员卡号： BJ3457834";
    Idlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Idlabel];
    
    UILabel *jobIdlabel = [[UILabel alloc] init];
    jobIdlabel.frame = CGRectMake(15, 95, 220, 30);
    jobIdlabel.text = @"技师工号： 009";
    jobIdlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:jobIdlabel];
    
    UILabel *namelabel = [[UILabel alloc] init];
    namelabel.frame = CGRectMake(15, 125, 120, 30);
    namelabel.text = @"预约人姓名：";
    namelabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:namelabel];
    
    UILabel *bookTimelabel = [[UILabel alloc] init];
    bookTimelabel.frame = CGRectMake(15, 155, 80, 30);
    bookTimelabel.text = @"预约时间：";
    bookTimelabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:bookTimelabel];
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.frame = CGRectMake(75, 155, 120, 30);
    timelabel.text = @"尚未选择时间";
    timelabel.tag = 101;
    timelabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:timelabel];
    
    UILabel *bookServerlabel = [[UILabel alloc] init];
    bookServerlabel.frame = CGRectMake(15, 185, 120, 30);
    bookServerlabel.text = @"预约服务：";
    bookServerlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:bookServerlabel];
}

- (void)creatTableView
{
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(10, 220, 300, 300);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)creatDatepacker
{
    _timePickerView = [[TimePickerView alloc] initWithFrame:CGRectMake(0, 40, 320, 450) WithTarget:self andSelector:@selector(action:)];
    _timePickerView.backgroundColor = [UIColor whiteColor];
    _timePickerView.tag = 105;
    [self.view addSubview:_timePickerView];    
}

- (void)action:(id)sender
{
    UIButton *timePickerButton = (UIButton *)[self.view viewWithTag:103];
    [timePickerButton setTitle:@"重新选择" forState:UIControlStateNormal];
    UIView *timeView = (UIView *)[self.view viewWithTag:105];
    
    UILabel *timeLabel = (UILabel *)[self.view viewWithTag:101];
    UIDatePicker *timePicker = (UIDatePicker *)[self.view viewWithTag:102];
    timeLabel.text = [self dateFormate:timePicker.date];

    
    [timeView removeFromSuperview];
}

- (NSString *)dateFormate:(NSDate *)date
{
    NSDateFormatter *dateFormat = [ [NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneForSecondsFromGMT:3600*8];
    [dateFormat setDateFormat:@"YYYY-MM-DDThh:mm:ss.sTZD"];
    [dateFormat setTimeZone:timeZone];
    [dateFormat setDateFormat:@"MMMMdd日a hh:mm"];
    NSString *newDateStr = [dateFormat stringFromDate:date];
    return newDateStr;
}

- (void)creatTextField
{
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(90, 125, 220, 25);
    _nameTextField.placeholder = @"请输入姓名";
    _nameTextField.delegate = self;
    [self.view addSubview:_nameTextField];
    
    _timeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _timeButton.frame = CGRectMake(200, 155, 60, 30);
    [_timeButton addTarget:self action:@selector(creatDatepacker) forControlEvents:UIControlEventTouchUpInside];
    _timeButton.tag = 103;
    [_timeButton setTitle:@"选取时间" forState:UIControlStateNormal];
    [self.view addSubview:_timeButton];
}

#pragma mark -TextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _discArray.count/3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ServierCell = @"ServierCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ServierCell];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ServierCell];
    }
    NSUInteger row = [indexPath row];
    ServierView *servierView = [[ServierView alloc] initWithFrame:CGRectMake(0, 0, 320, 94) withRow:row andTarget:self andSelector:nil andArray:_discArray];
    [cell.contentView addSubview:servierView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 98.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Man Nails 美甲";
}

@end
