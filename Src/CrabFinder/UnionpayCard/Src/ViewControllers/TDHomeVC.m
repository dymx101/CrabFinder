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

}
@property (nonatomic, strong)    UITableView        *tvFeed;
@property (nonatomic, assign)    int                testCount;

@end

@implementation TDHomeVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Newsfeed";
    _testCount = 10;
    
    [self installSearchToNavibar];
	
    [self createSubviews];
    [self layoutSubviews];
}



-(void)createSubviews {
    
    _tvFeed = [UITableView new];
    _tvFeed.delegate = self;
    _tvFeed.dataSource = self;
    [self.view addSubview:_tvFeed];
    
    __weak TDHomeVC *weakself = self;
    [_tvFeed addPullToRefreshWithActionHandler:^{
        double delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            
            [weakself.tvFeed.pullToRefreshView stopAnimating];
        });
    }];
    
    [_tvFeed addInfiniteScrollingWithActionHandler:^{

        double delayInSeconds = 1.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            weakself.testCount = weakself.testCount + 10;
            [weakself.tvFeed reloadData];
            [weakself.tvFeed.infiniteScrollingView stopAnimating];
        });
    }];
}

-(void)layoutSubviews {
    [_tvFeed alignToView:self.view];
}

#pragma mark - table view 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _testCount;
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
