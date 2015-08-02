//
//  TwoTableViewController.m
//  AutoLayoutTest
//
//  Created by ZhangBo on 15/7/6.
//  Copyright (c) 2015年 ZhangBo. All rights reserved.
//

#import "TwoTableViewController.h"
#import "TwoCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "Helper.h"


@interface TwoTableViewController ()

@property (nonatomic, assign) BOOL cellHeightCacheEnabled;
@property (nonatomic,strong) NSMutableArray * sourceArr;

@end

@implementation TwoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _sourceArr = [NSMutableArray new];
    for (int i = 0; i< 33; i++) {
        NSDictionary * info = @{@"1":getRandomString(),@"2":getRamdomImage(),@"3":getRandomString(),@"4":[NSNumber numberWithInt:getRamdomCount()]};
        [_sourceArr addObject:info];
    }
    UINib * newCell = [UINib nibWithNibName:@"TwoCell" bundle:nil];
    [self.tableView registerNib:newCell forCellReuseIdentifier:@"TwoCell"];
    
    
    self.tableView.fd_debugLogEnabled = YES;
    self.cellHeightCacheEnabled = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return  [_sourceArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TwoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TwoCell" forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}


- (void)configureCell:(TwoCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
    if (indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    
    NSDictionary * info = _sourceArr[indexPath.row];
    
    [cell.topLabel setText:info[@"1"]];
    [cell.bottomLabel setText:info[@"1"]];
    [cell setWidth:[info[@"4"] intValue]];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHeightCacheEnabled) {
        return [tableView fd_heightForCellWithIdentifier:@"TwoCell" cacheByIndexPath:indexPath configuration:^(TwoCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
        }];
    } else {
        return [tableView fd_heightForCellWithIdentifier:@"TwoCell" configuration:^(TwoCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
        }];
    }
}


@end
