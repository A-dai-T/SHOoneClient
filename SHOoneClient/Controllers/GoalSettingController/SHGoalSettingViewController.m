//
//  SHGoalSettingViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-25.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHGoalSettingViewController.h"
#import "UIViewController+SHSideMenu.h"

@interface SHGoalSettingViewController ()

@end

@implementation SHGoalSettingViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark loadView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.title = @"目标设定";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark -
#pragma mark UIControl

- (IBAction)clickToShowSideMenu:(id)sender
{
    if (self.navigationController.sideController)
    {
        [self.navigationController.sideController showLeftViewController:YES];
    }
}

- (IBAction)clickToSaveSetting:(id)sender
{
    
}


@end
