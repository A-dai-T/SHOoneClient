//
//  SHGroupViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-25.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHGroupViewController.h"
#import "UIViewController+SHSideMenu.h"
#import "SHGroupSearchViewController.h"
#import "SHGroupZoneViewController.h"

@interface SHGroupViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SHGroupViewController
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.title = @"群组";
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)clickToShowLeftMenu:(id)sender
{
    if (self.navigationController.sideController)
    {
        [self.navigationController.sideController showLeftViewController:YES];
    }
}

- (IBAction)clickToAddFriends:(id)sender
{
    SHGroupSearchViewController *shGroupSearchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHGroupSearchViewController"];
    [self.navigationController pushViewController:shGroupSearchVC animated:YES];
}

#pragma mark -
#pragma mark uitableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
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
    return 80;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    cell.imageView.image = [UIImage imageNamed:@"sh_menu_default_image"];
    cell.textLabel.text = @"运动更健康";
    cell.detailTextLabel.text = @"运动了才会更健康，欢迎您的加入分享您的运动经验！";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SHGroupZoneViewController *groupZoneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHGroupZoneViewController"];
    [self.navigationController pushViewController:groupZoneVC animated:YES];
}

@end
