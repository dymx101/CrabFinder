//
//  TDProfileVC.m
//  UnionpayCard
//
//  Created by Dong Yiming on 2/18/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDProfileVC.h"
#import "TDLoginVC.h"
#import "UIView+Effect.h"
#import "TDStatusDetailVC.h"
#import <MWPhotoBrowser/MWPhotoBrowser.h>

#import "TDComposeReviewVC.h"
#import "TDSettingsVC.h"

@interface TDProfileVC () <UITableViewDelegate, UITableViewDataSource, MWPhotoBrowserDelegate> {
    UITableView            *_tv;
    UIView                 *_headerView;
    
    UILabel                 *_lblUserName;
    UILabel                 *_lblBio;
    UIImageView             *_ivPhoto;
    
    UIScrollView            *_horizontalScrollView;
    NSLayoutConstraint      *_lastImageTrailingConstraint;
}

@end

@implementation TDProfileVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Profile";
    
    [self installSearchToNavibar];
    
    UIBarButtonItem *btnSettings = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_gear"] style:UIBarButtonItemStylePlain target:self action:@selector(goSettings:)];
    self.navigationItem.rightBarButtonItem = btnSettings;
    
    [self createSubviews];
    [self layoutSubviews];
    
}

-(void)goSettings:(id)sender {
    TDSettingsVC *vc = [TDSettingsVC new];
    [self.navigationController pushViewController:vc animated:YES];
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIDStr = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIDStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:cellIDStr];
    }
    
    cell.imageView.image = [UIImage imageNamed:@"crab_boss"];
    cell.textLabel.text = (indexPath.section == 0) ? @"Status goes here" : @"Review goes heres";
    
    return cell;
}

-(UIView *)tableHeaderView {
    
    if (_headerView) {
        return _headerView;
    }
    

    _headerView = [UIView new];
    
//    UIImageView *ivBg = [[UIImageView alloc] initWithImage:[TDImageLibrary sharedInstance].mineAccountBg];
//    [_headerView addSubview:ivBg];
//    [ivBg alignToView:_headerView];
    
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
    
    //
    _horizontalScrollView = [UIScrollView new];
    //_horizontalScrollView.backgroundColor = [UIColor redColor];
    _horizontalScrollView.showsHorizontalScrollIndicator = NO;
    [_headerView addSubview:_horizontalScrollView];
    // layout
    [_horizontalScrollView constrainTopSpaceToView:_lblBio predicate:@"20"];
    [_horizontalScrollView constrainWidthToView:_headerView predicate:nil];
    [_horizontalScrollView alignCenterXWithView:_headerView predicate:nil];
    [_horizontalScrollView constrainHeight:@"80"];
    
    //
    UIImage *crabImg = [UIImage imageNamed:@"crab_icon"];

    [self addImageArray:@[crabImg, crabImg, crabImg, crabImg, crabImg, crabImg, crabImg]];
    
    return _headerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [self tableHeaderView];
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 210;
    }
    
    return 20;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        TDStatusDetailVC *vc = [TDStatusDetailVC new];
        TDStatusUpdate *status = [TDStatusUpdate new];
        status.title = @"I am endevoring to construct a pneumonic memory circuit using stone knives and bear skins.";
        vc.statusUpdate = status;
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#define IMAGE_MARGIN    (20)
#define IMAGE_SIZE      (60)
-(void)addImageArray:(NSArray *)aImages {
    [_horizontalScrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [_horizontalScrollView removeConstraint:_lastImageTrailingConstraint];
    
    int i = 0;
    for (UIImage *image in aImages) {
        UIImageView *iv = [[UIImageView alloc] initWithImage:image];
        iv.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
        [iv addGestureRecognizer:tap];
        
        [iv applyEffectBorder];
        [_horizontalScrollView addSubview:iv];
        [iv constrainWidth:@(IMAGE_SIZE).stringValue height:@(IMAGE_SIZE).stringValue];
        [iv alignTopEdgeWithView:_horizontalScrollView predicate:@"10"];
        float leading = IMAGE_MARGIN * (i + 1) + IMAGE_SIZE * i;
        [iv alignLeadingEdgeWithView:_horizontalScrollView predicate:@(leading).stringValue];
        
        if (i == aImages.count - 1) {
            _lastImageTrailingConstraint = [iv alignTrailingEdgeWithView:_horizontalScrollView predicate:@(-IMAGE_MARGIN).stringValue].firstObject;
        }
        
        i++;
    }
}

-(void)imageTapped:(id)sender {
    MWPhotoBrowser *vc = [[MWPhotoBrowser alloc] initWithDelegate:self];
    vc.enableGrid = YES;
    vc.startOnGrid = YES;
    
    vc.displayActionButton = YES;
    vc.displayNavArrows = YES;

    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nc animated:YES completion:nil];
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


#pragma mark -
-(NSArray *)photos {
    static NSMutableArray *photos;
    if (photos == nil) {
        photos = [NSMutableArray array];
        [photos addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3567/3523321514_371d9ac42f_b.jpg"]]];
        [photos addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3629/3339128908_7aecabc34b_b.jpg"]]];
        [photos addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3364/3338617424_7ff836d55f_b.jpg"]]];
        [photos addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3590/3329114220_5fbc5bc92b_b.jpg"]]];
        [photos addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm3.static.flickr.com/2449/4052876281_6e068ac860_b.jpg"]]];
    }
    return photos;
}

-(NSArray *)thumbs {
    
    static NSMutableArray *thumbs;
    if (thumbs == nil) {
        thumbs = [NSMutableArray array];
        [thumbs addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3567/3523321514_371d9ac42f_q.jpg"]]];
        [thumbs addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3629/3339128908_7aecabc34b_q.jpg"]]];
        [thumbs addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3364/3338617424_7ff836d55f_q.jpg"]]];
        [thumbs addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm4.static.flickr.com/3590/3329114220_5fbc5bc92b_q.jpg"]]];
        [thumbs addObject:[MWPhoto photoWithURL:[NSURL URLWithString:@"http://farm3.static.flickr.com/2449/4052876281_6e068ac860_q.jpg"]]];
    }
    return thumbs;
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return [self photos].count;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    return [self photos][index];
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser thumbPhotoAtIndex:(NSUInteger)index {
    return [self thumbs][index];
}

@end
