//
//  SHGroupZoneViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-25.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHGroupZoneViewController.h"

@interface SHGroupZoneViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation SHGroupZoneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)clickToBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickToViewRankings:(id)sender
{
    
}

#pragma mark -
#pragma mark uitableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 || indexPath.section == 1)
    {
        return 80;
    }
    return 160;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 || indexPath.section == 1)
    {
        static NSString *cellIdentifier = @"CellGroup";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        if (indexPath.section == 0)
        {
            cell.textLabel.text = @"运动更健康";
            cell.imageView.image = [UIImage imageNamed:@"sh_menu_default_image"];
            cell.detailTextLabel.text = @"运动了才会更健康，欢迎您的加入分享您的运动经验！";
        }
        else
        {
            cell.imageView.image = nil;
            cell.textLabel.text = @"运动更健康";
            cell.detailTextLabel.text = @"欢迎你的加入，大家一起分享自己的运动经验，一起锻炼身体！运动了才会更健康，欢迎你的加入分享你的运动经验";
        }
        return cell;
    }
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"Art-yang";
    cell.imageView.image = [UIImage imageNamed:@"sh_menu_default_image"];
    cell.detailTextLabel.text = @"和闺蜜一起去海边运动、沙滩球、游泳……期待今晚的海鲜大餐啦……哈哈。。";
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

@end
