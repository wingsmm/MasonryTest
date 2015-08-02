//
//  TableViewController.m
//  AutoLayoutTest
//
//  Created by ZhangBo on 15/7/6.
//  Copyright (c) 2015年 ZhangBo. All rights reserved.
//

#import "OneTableViewController.h"
#import "OneCell.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "Helper.h"


@interface OneTableViewController ()
@property (nonatomic, assign) BOOL cellHeightCacheEnabled;
@property (nonatomic,strong) NSMutableArray * sourceArr;

@end

@implementation OneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    _sourceArr = [NSMutableArray new];
    
    
    for (int i = 0; i< 33; i++) {
        NSDictionary * info = @{@"1":getRandomString(),@"2":getRamdomImage(),@"3":getRandomString()};
        [_sourceArr addObject:info];
    }
    
    UINib * newCell = [UINib nibWithNibName:@"OneCell" bundle:nil];
    [self.tableView registerNib:newCell forCellReuseIdentifier:@"OneCell"];
    
    self.tableView.fd_debugLogEnabled = YES;
    self.cellHeightCacheEnabled = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 33;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OneCell  * cell = [tableView dequeueReusableCellWithIdentifier:@"OneCell"];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}


- (void)configureCell:(OneCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
    if (indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    
    NSDictionary * info = _sourceArr[indexPath.row];
    
    [cell.nameLabel setText:[NSString stringWithFormat:@"cell_%ld",indexPath.row]];
    [cell.contentLabel setText:info[@"1"]];
    [cell.leftImageView setImage:info[@"2"]];
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.cellHeightCacheEnabled) {
        return [tableView fd_heightForCellWithIdentifier:@"OneCell" cacheByIndexPath:indexPath configuration:^(OneCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
        }];
    } else {
        return [tableView fd_heightForCellWithIdentifier:@"OneCell" configuration:^(OneCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
        }];
    }
}
@end
