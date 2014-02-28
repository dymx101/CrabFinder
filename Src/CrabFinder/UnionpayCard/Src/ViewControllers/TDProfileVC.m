//
//  TDProfileVC.m
//  UnionpayCard
//
//  Created by Dong Yiming on 2/18/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDProfileVC.h"
#import "TDLoginVC.h"
#import "Userinfor.h"
#import "UIView+Effect.h"

@interface TDProfileVC () <UITableViewDelegate, UITableViewDataSource> {
    UITableView            *_tv;
    UIView                 *_headerView;
    
    UILabel                 *_lblUserName;
    UILabel                 *_lblBio;
    UIImageView             *_ivPhoto;
}

@end

@implementation TDProfileVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Profile";
    
    [self createSubviews];
    [self layoutSubviews];
    
    [self installLogoToNavibar];
}

-(void)createSubviews {
    
    _tv = [UITableView new];
    _tv.delegate = self;
    _tv.dataSource = self;
    [self.view addSubview:_tv];
}

-(void)layoutSubviews {
    _tv.backgroundColor = [FDColor sharedInstance].clear;
    _tv.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tv alignToView:self.view];
}

#pragma mark -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIDStr = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:cellIDStr];
    }
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    _headerView = [UIView new];
    UIImageView *ivBg = [[UIImageView alloc] initWithImage:[TDImageLibrary sharedInstance].mineAccountBg];
    [_headerView addSubview:ivBg];
    
    [ivBg alignToView:_headerView];
    
    _ivPhoto = [UIImageView new];
    _ivPhoto.image = [UIImage imageNamed:@"avatar_default"];
    [_ivPhoto applyEffectBorder];
    [_headerView addSubview:_ivPhoto];
    [_ivPhoto constrainWidth:@"50" height:@"50"];
    [_ivPhoto alignTop:@"20" leading:@"20" toView:_headerView];
    
    // label
    _lblUserName = [UILabel new];
    _lblUserName.text = @"Steve Jobs";
    _lblUserName.font = [TDFontLibrary sharedInstance].fontTitle;
    [_headerView addSubview:_lblUserName];
    //layout
    [_lblUserName constrainLeadingSpaceToView:_ivPhoto predicate:@"10"];
    [_lblUserName alignTopEdgeWithView:_ivPhoto predicate:@"0"];
    
    //
    _lblBio = [UILabel new];
    _lblBio.text = @"An American entrepreneur, marketer, and inventor, who was the co-founder, chairman, and CEO of Apple Inc.";
    _lblBio.numberOfLines = 0;
    _lblBio.font = [TDFontLibrary sharedInstance].fontNormal;
    [_headerView addSubview:_lblBio];
    // layout
    [_lblBio alignLeadingEdgeWithView:_lblUserName predicate:nil];
    [_lblBio constrainTopSpaceToView:_lblUserName predicate:@"5"];
    [_lblBio constrainWidthToView:_headerView predicate:@"-100"];
    
    
    return _headerView;
}

-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 120;
}

#pragma mark - 
-(void)loginAction:(id)sender {
    TDLoginVC *vc = [TDLoginVC new];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nc animated:YES completion:nil];
}

#pragma delegate - 
- (void) getProfile:(NSString *) tOken{
   
}
@end
