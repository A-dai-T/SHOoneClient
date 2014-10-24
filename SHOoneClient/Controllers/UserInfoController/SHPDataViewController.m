//
//  SHPDataViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-24.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHPDataViewController.h"
#import "UIViewController+SHSideMenu.h"
#import "SHEditpDataViewController.h"

@interface SHPDataViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *avatorImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pEnergyLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;

@end

@implementation SHPDataViewController

- (IBAction)clickToBlindNewOone:(id)sender
{
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.showleftMenuButton = YES;
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.title = @"个人资料";
    
}

- (void)setShowleftMenuButton:(BOOL)showleftMenuButton
{
    if (_showleftMenuButton != showleftMenuButton)
    {
        _showleftMenuButton = showleftMenuButton;
        [self performSelector:@selector(updateLeftButton) withObject:nil afterDelay:0.1];
    }
}

- (void)updateLeftButton
{
    if ( _showleftMenuButton )
    {
        return;
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 0, 40, 34)];
    UIImage *image = [UIImage imageNamed:@"sh_nav_back_btn"];
    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickToBack) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 34)];
    view.backgroundColor = [UIColor clearColor];
    [view addSubview:button];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark UITableView

- (void)clickToBack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickToEditPData:(id)sender
{
    SHEditpDataViewController *shEditpDataVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SHEditpDataViewController"];
    [self.navigationController pushViewController:shEditpDataVC animated:YES];
}


- (IBAction)clickToShowMenu:(id)sender
{
    if (self.navigationController.sideController)
    {
        [self.navigationController.sideController showLeftViewController:YES];
    }
}


#pragma mark -
#pragma mark UITableView

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

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0)
    {
        cell.textLabel.text = @"今日总步数:";
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = @"运动消耗热量:";
    }
    else if (indexPath.section == 2)
    {
        cell.textLabel.text = @"运动总距离:";
    }
    else if (indexPath.section == 3)
    {
        cell.textLabel.text = @"运动总时间:";
    }
    else
    {
        cell.textLabel.text = @"睡眠总时间:";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
