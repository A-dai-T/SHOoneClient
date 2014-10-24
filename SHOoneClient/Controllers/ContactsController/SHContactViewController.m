//
//  SHContactViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-25.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHContactViewController.h"
#import "UIViewController+SHSideMenu.h"
#import "SHHomePageViewController.h"
#import "SHPDataViewController.h"
#import "SHAddFriendsViewController.h"

@interface SHContactViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *rankingView;
@property (weak, nonatomic) IBOutlet UILabel *rankingLabel;
@property (weak, nonatomic) IBOutlet UIView *lostNetWorksView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SHContactViewController

#pragma mark -
#pragma mark dealloc

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark LoadView

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}



#pragma mark -
#pragma mark UIControl

- (IBAction)clickToShowLeftMenu:(id)sender
{
    if (self.navigationController.sideController)
    {
        [self.navigationController.sideController showLeftViewController:YES];
    }
}

- (IBAction)clickToAddFriends:(id)sender
{
    SHAddFriendsViewController *addFriendsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHAddFriendsViewController"];
    [self.navigationController pushViewController:addFriendsVC animated:YES];
}

#pragma mark -
#pragma mark UITableView

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0)
    {
        SHPDataViewController *pDataVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHPDataViewController"];
        [pDataVC setShowleftMenuButton:NO];
        [self.navigationController pushViewController:pDataVC animated:YES];
    }
    else
    {
        SHHomePageViewController *homePageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHHomePageViewController"];
        [self.navigationController pushViewController:homePageVC animated:YES];
    }
}

@end
