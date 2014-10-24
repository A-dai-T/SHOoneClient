//
//  SHAboutViewController.m
//  SHOoneClient
//
//  Created by 马远征 on 14-9-23.
//  Copyright (c) 2014年 马远征. All rights reserved.
//

#import "SHAboutViewController.h"

@interface SHAboutViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation SHAboutViewController

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
        self.title = @"关于我们";
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
- (IBAction)clickToBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark uitableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
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
        cell.textLabel.text = @"型号:sh-A204";
    }
    else if (indexPath.section == 1)
    {
        cell.textLabel.text = @"网址:www.shouhuan@yundong.cn";
    }
    else if (indexPath.section == 2)
    {
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        cell.textLabel.text = [NSString stringWithFormat:@"软件版本:%@",appVersion];
    }
    else
    {
        cell.textLabel.text = @"制造商:深圳";
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
