//
//  SHAddFriendsViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-26.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHAddFriendsViewController.h"
#import "SHSegmentedControl.h"

@interface SHAddFriendsViewController() <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet SHSegmentedControl *segmentedControl;
@end

@implementation SHAddFriendsViewController

#pragma mark -
#pragma mark UIControl

- (IBAction)clickToSearch:(id)sender
{
    [self.view endEditing:YES];
}

- (IBAction)segmentedControlValueChanged:(id)sender
{
    [self.view endEditing:YES];
}

- (IBAction)clickToBack:(id)sender
{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark -
#pragma mark UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
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

@end
