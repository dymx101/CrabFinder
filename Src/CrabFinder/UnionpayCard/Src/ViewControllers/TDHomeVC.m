//
//  TDHomeVC.m
//  UnionpayCard
//
//  Created by Dong Yiming on 2/18/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDHomeVC.h"

#import "TDNewsfeedCell.h"
#import "TDNewsFeed.h"

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

const NSString *strStatusCellID = @"strStatusCellID";
const NSString *strStatusCellForHeightID = @"strStatusCellForHeightID";

@interface TDHomeVC () <UITableViewDelegate, UITableViewDataSource> {

}
@property (nonatomic, strong)    UITableView        *tvFeed;
@property (nonatomic, strong)    NSMutableArray     *newsFeeds;
@property(nonatomic, strong)    TDNewsfeedCell		*sizingCell;
//@property (nonatomic, assign)    int                testCount;

@end

@implementation TDHomeVC

-(NSArray *)fakeDataArray {
    NSMutableArray *arr = [NSMutableArray array];
    TDNewsFeed *feed = [TDNewsFeed new];
    feed.status = [TDStatusUpdate new];
    feed.status.title = @"Romulan Commander: Humans have a way of showing up when you least expect them.";
    [arr addObject:feed];
    
    feed = [TDNewsFeed new];
    feed.status = [TDStatusUpdate new];
    feed.status.title = @"Spock: Excuse me, there is a multi-legged creature crawling up your shoulder.";
    [arr addObject:feed];
    
    feed = [TDNewsFeed new];
    feed.review = [TDReview new];
    feed.review.title = @"Kirk Reviewed Spock: \nAh, my old friend Kirk, do you know the Klingon proverb that says revenge is a dish best served cold? It is very cold in space.He tasks me. He tasks me, and I shall have him. I'll chase him 'round the moons of Nibia and 'round the Antares Maelstrom and 'round perdition's flame before I give him up!";
    [arr addObject:feed];
    
    feed = [TDNewsFeed new];
    feed.status = [TDStatusUpdate new];
    feed.status.title = @"Romulan Commander: Humans have a way of showing up when you least expect them.";
    [arr addObject:feed];
    
    feed = [TDNewsFeed new];
    feed.status = [TDStatusUpdate new];
    feed.status.title = @"Spock: Excuse me, there is a multi-legged creature crawling up your shoulder.";
    [arr addObject:feed];
    
    feed = [TDNewsFeed new];
    feed.review = [TDReview new];
    feed.review.title = @"Kirk Reviewed Spock: \nSpock. Where the hell's the power you promised me?";
    [arr addObject:feed];
    
    return arr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Newsfeed";
    _newsFeeds = [NSMutableArray array];
    [_newsFeeds addObjectsFromArray:[self fakeDataArray]];
    //_testCount = 10;
    
    [self installSearchToNavibar];
	
    [self createSubviews];
    [self layoutSubviews];
}



-(void)createSubviews {
    
    _tvFeed = [UITableView new];
    _tvFeed.delegate = self;
    _tvFeed.dataSource = self;
    [self.view addSubview:_tvFeed];
    
    [_tvFeed registerClass:[TDNewsfeedCell class] forCellReuseIdentifier:(NSString *)strStatusCellID];
    [_tvFeed registerClass:[TDNewsfeedCell class] forCellReuseIdentifier:(NSString *)strStatusCellForHeightID];
    
    _sizingCell = [_tvFeed dequeueReusableCellWithIdentifier:(NSString *)strStatusCellForHeightID];
    
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
            [weakself.newsFeeds addObjectsFromArray:[weakself fakeDataArray]];
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
    return _newsFeeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TDNewsfeedCell *cell = [tableView dequeueReusableCellWithIdentifier:(NSString *)strStatusCellID forIndexPath:indexPath];
    
    TDNewsFeed *feed = _newsFeeds[indexPath.row];
    
    cell.lblTitle.text = [feed title];

    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    _sizingCell.frame = tableView.bounds;
    
    TDNewsFeed *feed = _newsFeeds[indexPath.row];
    
    _sizingCell.lblTitle.text = [feed title];
    [_sizingCell setNeedsLayout];
    [_sizingCell layoutIfNeeded];
    CGSize size = [self.sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}

@end
