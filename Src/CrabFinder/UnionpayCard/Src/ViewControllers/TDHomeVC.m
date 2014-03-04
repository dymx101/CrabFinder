//
//  TDHomeVC.m
//  UnionpayCard
//
//  Created by Dong Yiming on 2/18/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDHomeVC.h"

#import "TDNewsfeedCell.h"


typedef enum {
    kVcRegister = 1000
    , kVcCardList
    , kVcVendors
    , kVcAddMoney
    , kVcCredit
    , kVcConsume
    , kVcMail
    , kVcLife
}EVcType;



@interface TDHomeVC () <UITableViewDelegate, UITableViewDataSource> {
    UITableView     *_tvFeed;
}

@end

@implementation TDHomeVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [FDColor sharedInstance].desertSand;
    self.navigationItem.title = @"Newsfeed";
    
    [self installSearchToNavibar];
	
    [self createSubviews];
    [self layoutSubviews];
}



-(void)createSubviews {
    
    _tvFeed = [UITableView new];
    _tvFeed.delegate = self;
    _tvFeed.dataSource = self;
    [self.view addSubview:_tvFeed];
    
}

-(void)layoutSubviews {
    [_tvFeed alignToView:self.view];
}

#pragma mark - table view 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strCellId = @"TDNewsfeedCell";
    TDNewsfeedCell *cell = [tableView dequeueReusableCellWithIdentifier:strCellId];
    if (cell == nil) {
        cell = [TDNewsfeedCell new];
    }
    
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [TDNewsfeedCell HEIGHT];
}

@end
