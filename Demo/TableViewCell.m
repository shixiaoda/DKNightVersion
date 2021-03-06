//
//  TableViewCell.m
//  DKNightVersion
//
//  Created by Draveness on 5/1/15.
//  Copyright (c) 2015 DeltaX. All rights reserved.
//

#import "TableViewCell.h"
#import "DKNightVersion.h"

@interface TableViewCell ()

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 270, 80)];
        self.label.numberOfLines = 0;
        self.label.text = @"DKNightVersion is a light weight framework adding night mode to your iOS app.";
        self.label.textColor = [UIColor darkGrayColor];
//        self.label.dk_textColorPicker = DKColorWithThreeColors([UIColor darkGrayColor], [UIColor redColor],[UIColor greenColor]);
        self.label.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:self.label];

        CGRect rect = CGRectMake(250, 10, 120, 80);
        self.button = [[UIButton alloc] initWithFrame:rect];
        self.button.titleLabel.font = [UIFont systemFontOfSize:20];
        [self.button setTitleColor:[UIColor colorWithRed:0.478 green:0.651 blue:0.988 alpha:1.0] forState:UIControlStateNormal];

        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.button];
        
//        self.backgroundColor = [UIColor darkGrayColor];
        
//        self.dk_backgroundColorPicker = DKColorWithColors([UIColor darkGrayColor], [UIColor redColor]);

        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 25, 50, 50)];

        imageView.dk_imagePicker = DKImageWithNames(@"normal1", @"night1");
//        imageView.image = [UIImage imageNamed:@"normal1"];
        [self.contentView addSubview:imageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
