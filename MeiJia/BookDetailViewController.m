//
//  BookDetailViewController.m
//  MeiJia
//
//  Created by Ralbatr on 14-3-14.
//  Copyright (c) 2014年 Ralbatr. All rights reserved.
//

#import "BookDetailViewController.h"
#import "TimePickerView.h"

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
    [self creatButtons];
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
    bookTimelabel.frame = CGRectMake(15, 155, 120, 30);
    bookTimelabel.text = @"预约时间：";
    bookTimelabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:bookTimelabel];
    
    UILabel *bookServerlabel = [[UILabel alloc] init];
    bookServerlabel.frame = CGRectMake(15, 185, 120, 30);
    bookServerlabel.text = @"预约服务：";
    bookServerlabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:bookServerlabel];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15, 215, 120, 30);
    label.text = @"Man Nails 美甲";
    label.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"Man Nails 美甲";
    label2.font = [UIFont systemFontOfSize:13];
    label2.frame = CGRectMake(15, 345, 120, 30);
    [self.view addSubview:label2];
}

- (void)creatDatepacker
{
    _timePickerView = [[TimePickerView alloc] initWithFrame:CGRectMake(0, 40, 320, 450) WithTarget:self andSelector:@selector(action:)];
    _timePickerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_timePickerView];
}

- (void)action:(id)sender
{
    _timePickerView.hidden = YES;
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
    [_timeButton setTitle:@"选取时间" forState:UIControlStateNormal];
    [self.view addSubview:_timeButton];
}

- (void)creatButtons
{
    NSArray *discArray = [NSArray arrayWithObjects:@"服务项目1",@"服务项目2", @"服务项目3",@"服务项目4",@"服务项目5",@"服务项目6",nil];
    for (int i = 0; i < 6; i++) {
        CGRect frame = CGRectMake((97*(i%3)+25), 125*(i/3)+240, 87, 98);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = frame;
        [button setImage:[UIImage imageNamed:@"u29_normal.png"] forState:UIControlStateNormal];
        [self.view addSubview:button];
        
        CGRect labelFrame = CGRectMake(frame.origin.x+5, frame.origin.y+40, frame.size.width, frame.size.height);
        UILabel *label = [[UILabel alloc] initWithFrame:labelFrame];
        label.font = [UIFont systemFontOfSize:14];
        label.text = discArray[i];
        [self.view addSubview:label];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
