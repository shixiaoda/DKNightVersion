//
//  RootViewController.m
//  DKNightVerision
//
//  Created by Draveness on 4/14/15.
//  Copyright (c) 2015 DeltaX. All rights reserved.
//

#import "RootViewController.h"
#import "SuccViewController.h"
#import "PresentingViewController.h"
#import "DKNightVersion.h"
#import "TableViewCell.h"



@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 44)];
    navigationLabel.text = @"DKNightVersion";
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navigationLabel;

    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Present" style:UIBarButtonItemStylePlain target:self action:@selector(present)];
    self.navigationItem.leftBarButtonItem = item;

    item = [[UIBarButtonItem alloc] initWithTitle:@"Change" style:UIBarButtonItemStylePlain target:self action:@selector(change)];
    self.navigationItem.rightBarButtonItem = item;


    self.tableView.dk_backgroundColorPicker =  DKColorWithRGB(0xffffff, 0x343434);
    self.tableView.dk_separatorColorPicker = DKColorWithRGB(0xaaaaaa, 0x313131);
//    navigationLabel.dk_textColorPicker = DKColorWithColors([UIColor blackColor], [UIColor whiteColor]);
    navigationLabel.textColor= [UIColor blackColor];
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorWithRGB(0xffffff, 0x444444);
    self.navigationItem.leftBarButtonItem.dk_tintColorPicker = DKColorWithColors([UIColor blueColor], [UIColor whiteColor]);
    self.navigationItem.rightBarButtonItem.dk_tintColorPicker = DKColorWithColors([UIColor blueColor], [UIColor whiteColor]);
}

- (void)change {
    if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNight) {
        [DKNightVersionManager dawnComing];
    } else if ([DKNightVersionManager currentThemeVersion] == DKThemeVersionNormal) {
        [DKNightVersionManager nightFalling];
    }
}

- (void)push {
    [self.navigationController pushViewController:[[SuccViewController alloc] init] animated:YES];
}

- (void)present {
    [self presentViewController:[[PresentingViewController alloc] init] animated:YES completion:nil];
}

#pragma mark - UITableView Delegate & DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    cell.dk_backgroundColorPicker = DKColorWithRGB(0xffffff, 0x343434);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self push];
}

@end
