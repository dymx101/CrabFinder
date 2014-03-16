//
//  TDProductDetailVC.m
//  UnionpayCard
//
//  Created by Dong Yiming on 3/15/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDProductDetailVC.h"

@interface TDProductDetailVC () {
    UITableView    *_tvContent;
    UIView          *_viewTvHeader;
    
    UILabel         *_lblDesctiption;
    UIScrollView    *_svPhotosByUsers;
    NSMutableArray  *_photosByUsers;
    
    UIImageView     *_ivVendorPhoto;
    UILabel         *_lblVendorName;
    UIView          *_viewRating;
    
    UIScrollView    *_svPhotosByVendor;
    NSMutableArray  *_photosByVendor;
}

@end

@implementation TDProductDetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Example Item";
    
    [self initViews];
    [self setupViews];
}

-(UIView *)tvHeader {
    if (_viewTvHeader == nil) {
        _viewTvHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        _viewTvHeader.backgroundColor = [UIColor redColor];
        
        _lblDesctiption = [UILabel new];
        _lblDesctiption.backgroundColor = [FDColor sharedInstance].random;
        _lblDesctiption.font = [TDFontLibrary sharedInstance].fontNormal;
        _lblDesctiption.text = @"Description of example item goes here. Description of example item goes here. Description of example item goes here. Description of example item goes here. Description of example item goes here.";
        _lblDesctiption.numberOfLines = 0;
        [_viewTvHeader addSubview:_lblDesctiption];
        
        [_lblDesctiption alignTopEdgeWithView:_viewTvHeader predicate:@"15"];
        [_lblDesctiption constrainWidth:@"300"];
        [_lblDesctiption alignLeadingEdgeWithView:_viewTvHeader predicate:@"10"];
        
        //
        _svPhotosByUsers = [UIScrollView new];
        _svPhotosByUsers.backgroundColor = [FDColor sharedInstance].random;
        [_viewTvHeader addSubview:_svPhotosByUsers];
        
        [_svPhotosByUsers constrainTopSpaceToView:_lblDesctiption predicate:@"10"];
        [_svPhotosByUsers constrainWidthToView:_lblDesctiption predicate:nil];
        [_svPhotosByUsers alignLeadingEdgeWithView:_lblDesctiption predicate:nil];
        [_svPhotosByUsers constrainHeight:@"60"];
    }
    
    return _viewTvHeader;
}

-(void)initViews {
    
    _tvContent = [UITableView new];
    _tvContent.tableHeaderView = [self tvHeader];
    [self.view addSubview:_tvContent];
}

-(void)setupViews {
    [_tvContent alignToView:self.view];
}


@end
