//
//  SuccViewController.m
//  DKNightVersion
//
//  Created by Draveness on 4/28/15.
//  Copyright (c) 2015 DeltaX. All rights reserved.
//

#import "SuccViewController.h"
#import "DKNightVersion.h"

@interface SuccViewController ()

@end

@implementation SuccViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.dk_backgroundColorPicker = DKColorWithRGB(0xffffff, 0x343434);
    self.navigationController.navigationBar.dk_tintColorPicker = DKColorWithThreeColors([UIColor blueColor], [UIColor redColor],[UIColor greenColor]);
//    self.navigationController.navigationBar.tintColor = [UIColor blueColor];//, [UIColor redColor]);
}

@end
