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
    [self creatCloseButton];
    //add label
    [self creatLabel];
    [self creatTextField];
    _discArray = [NSArray arrayWithObjects:@"服务项目1",@"服务项目2", @"服务项目3",@"服务项目4",@"服务项目5",@"服务项目6",nil];
    [self creatTableView];
}

- (void)creatLabel
{
    UILabel *Idlabel = [[UILabel alloc] init];
    Idlabel.frame = CGRectMake(15, 0, 220, 30);
    Idlabel.text = @"会员卡号： BJ3457834";
    Idlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:Idlabel];
    
    UILabel *jobIdlabel = [[UILabel alloc] init];
    jobIdlabel.frame = CGRectMake(15, 30, 220, 30);
    jobIdlabel.text = @"技师工号： 009";
    jobIdlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:jobIdlabel];
    
    UILabel *namelabel = [[UILabel alloc] init];
    namelabel.frame = CGRectMake(15, 60, 120, 30);
    namelabel.text = @"预约人姓名：";
    namelabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:namelabel];
    
    UILabel *bookTimelabel = [[UILabel alloc] init];
    bookTimelabel.frame = CGRectMake(15, 90, 80, 30);
    bookTimelabel.text = @"预约时间：";
    bookTimelabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:bookTimelabel];
    
    UILabel *bookServerlabel = [[UILabel alloc] init];
    bookServerlabel.frame = CGRectMake(15, 125, 120, 30);
    bookServerlabel.text = @"预约服务：";
    bookServerlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:bookServerlabel];
}

- (void)creatCloseButton
{
    UIButton *closeButton = [[UIButton alloc] init];
    closeButton.frame = CGRectMake(0, 0, 320, 180);

    [closeButton addTarget:self action:@selector(closeKeyboardAndTableView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
}

- (void)creatTableView
{
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(10, 155, 300, 300);
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
    _nameTextField.frame = CGRectMake(90, 65, 120, 25);
//    _nameTextField.backgroundColor = [UIColor greenColor];
    _nameTextField.placeholder = @"请输入姓名";
    _nameTextField.font = [UIFont systemFontOfSize:14.0f];
    _nameTextField.delegate = self;
    [self.view addSubview:_nameTextField];
    //添加 事件选择的下拉的
    [self creatCombox];
}

- (void)creatCombox
{
    NSMutableArray *dayArray = [NSMutableArray arrayWithObjects:@"今天",@"明天",@"后天",nil];
    for (int i = 0; i < 5; i++) {
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:60*60*24*(3 + i)];
        NSString *dayStr = [self dateFormate:date];
        [dayArray addObject:dayStr];
    }
    
    self.day = [[ComboxView alloc] initWithFrame:CGRectMake(75, 95, 90, 30)];
    self.day.textField.text = @"今天";
    
    self.day.tableArray = dayArray;
    [self.view addSubview:self.day];
    
    self.hour = [[ComboxView alloc] initWithFrame:CGRectMake(165, 95, 70, 30)];
    self.hour.textField.text = @"8时";
    NSArray *hourArray=[[NSArray alloc]initWithObjects:@"8时",@"9时",@"10时",@"11时",@"12时",@"13时",@"14时",@"15时",@"16时",@"17时",nil];
    self.hour.tableArray = hourArray;
    [self.view addSubview:self.hour];
    
    self.minute = [[ComboxView alloc] initWithFrame:CGRectMake(235, 95, 80, 30)];
    self.minute.textField.text = @"00分";
    NSArray *minuteArray=[[NSArray alloc]initWithObjects:@"00分",@"05分",@"10分",@"15分",@"20分",@"25分",@"30分",@"35分",@"40分",@"45分",@"50分",@"55分",nil];
    self.minute.tableArray = minuteArray;
    [self.view addSubview:self.minute];
}

//关闭键盘和combox下拉的
- (void)closeKeyboardAndTableView:(id)sender
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    [self closeTableView];
}

- (void)closeTableView
{
    [self.day closeTableView];
    [self.hour closeTableView];
    [self.minute closeTableView];
}

#pragma mark -TextField delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self closeTableView];
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
//当再次 出现视图时，重新创建combox那些下拉框。
- (void)viewDidAppear:(BOOL)animated
{
    [self creatCombox];
}

@end
