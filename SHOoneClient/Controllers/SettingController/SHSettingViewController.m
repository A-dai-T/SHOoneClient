//
//  SHSettingViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-22.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHSettingViewController.h"
#import "UIViewController+SHSideMenu.h"
#import "SHAboutViewController.h"
#import "SHFeedBackViewController.h"

@interface SHSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SHSettingViewController



#pragma mark -
#pragma mark dealloc

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.title = @"设置";
    }
    return self;
}

#pragma mark -
#pragma mark viewDidLoad

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

- (IBAction)leftBarButtonClick:(id)sender
{
    if (self.navigationController.sideController)
    {
        [self.navigationController.sideController showLeftViewController:YES];
    }
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
        return 20;
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
       cell.textLabel.text = @"常见问题";
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = @"用户反馈";
    }
    else if (indexPath.section == 2)
    {
        cell.textLabel.text = @"关于我们";
    }
    else if (indexPath.section == 3)
    {
        cell.textLabel.text = @"立即同步";
    }
    else if (indexPath.section == 4)
    {
        cell.textLabel.text = @"使用新的手环";
    }
    else
    {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        cell.textLabel.text = [NSString stringWithFormat:@"手环版本%@",appVersion];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1)
    {
        SHFeedBackViewController *shFeedBackVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHFeedBackViewController"];
        [self.navigationController pushViewController:shFeedBackVC animated:YES];
    }
    else if (indexPath.section == 2)
    {
        SHAboutViewController *shAboutVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHAboutViewController"];
        [self.navigationController pushViewController:shAboutVC animated:YES];
    }
    
}
@end
