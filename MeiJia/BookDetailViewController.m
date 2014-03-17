//
//  BookDetailViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "BookDetailViewController.h"
#import "DatePickerViewController.h"
#import "ServierView.h"
#import "ComboxView.h"

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

- (NSString *)dateFormate:(NSDate *)date
{
    NSDateFormatter *dateFormat = [ [NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneForSecondsFromGMT:3600*8];
    [dateFormat setDateFormat:@"YYYY-MM-DDThh:mm:ss.sTZD"];
    [dateFormat setTimeZone:timeZone];
    [dateFormat setDateFormat:@"MMMMdd日"];
    NSString *newDateStr = [dateFormat stringFromDate:date];
    return newDateStr;
}

- (void)creatTextField
{
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.frame = CGRectMake(90, 130, 220, 25);
    _nameTextField.placeholder = @"请输入姓名";
    _nameTextField.font = [UIFont systemFontOfSize:14.0f];
    _nameTextField.delegate = self;
    [self.view addSubview:_nameTextField];
    
    [self creatCombox];
}

- (void)creatCombox
{
    NSMutableArray *dayArray = [NSMutableArray arrayWithObjects:@"明天",@"后天",nil];
    for (int i = 0; i < 5; i++) {
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:60*60*24*(3 + i)];
        NSString *dayStr = [self dateFormate:date];
        [dayArray addObject:dayStr];
    }
    
    ComboxView *day = [[ComboxView alloc] initWithFrame:CGRectMake(75, 160, 90, 30)];
    day.textField.text = @"今天";
    
    day.tableArray = dayArray;
    [self.view addSubview:day];
    
    ComboxView *hour = [[ComboxView alloc] initWithFrame:CGRectMake(165, 160, 70, 30)];
    hour.textField.text = @"8时";
    NSArray *hourArray=[[NSArray alloc]initWithObjects:@"9时",@"10时",@"11时",@"12时",@"13时",@"14时",@"15时",@"16时",@"17时",nil];
    hour.tableArray = hourArray;
    [self.view addSubview:hour];
    
    ComboxView *minute = [[ComboxView alloc] initWithFrame:CGRectMake(235, 160, 80, 30)];
    minute.textField.text = @"00分";
    NSArray *minuteArray=[[NSArray alloc]initWithObjects:@"05分",@"10分",@"15分",@"20分",@"25分",@"30分",@"35分",@"40分",@"45分",@"50分",@"55分",nil];
    minute.tableArray = minuteArray;
    [self.view addSubview:minute];
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
