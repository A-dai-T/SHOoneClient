//
//  SHHomePageViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-25.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHHomePageViewController.h"
#import "SHOoneDefine.h"

@interface SHHomePageViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;

@end

@implementation SHHomePageViewController
- (IBAction)clickToBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)clickToDel:(id)sender
{
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[self.navigationController.viewControllers objectAtIndex:1] setWantsFullScreenLayout:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    [self.navigationController.navigationBar setTranslucent:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.avatorImageView.layer.borderWidth = 0.0;
    self.avatorImageView.layer.cornerRadius = self.avatorImageView.frame.size.width*0.5;
    self.avatorImageView.layer.masksToBounds = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark uitableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 10;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        cell.textLabel.text = @"今日总步数：";
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = @"运动消耗热量：";
    }
    else if (indexPath.section == 2)
    {
        cell.textLabel.text = @"运动总距离：";
    }
    else if (indexPath.section == 3)
    {
        cell.textLabel.text = @"运动总时间：";
    }
    else if (indexPath.section == 4)
    {
        cell.textLabel.text = @"浅睡眠时间：";
    }
    else
    {
        cell.textLabel.text = @"深睡眠时间：";
    }
    return cell;
}


@end
