//
//  TDProductVendorCell.m
//  UnionpayCard
//
//  Created by Dong Yiming on 3/16/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDProductVendorCell.h"


@interface TDProductVendorCell () {

    NSMutableArray      *_photosByVendor;
}

@end

@implementation TDProductVendorCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _photosByVendor = [NSMutableArray array];
        
        [self initViews];
        [self setupConstraints];
    }
    return self;
}

-(void)initViews {
    // vendor information
    _ivVendorPhoto = [UIImageView new];
    _ivVendorPhoto.image = SharedImage.avatar;
    [_ivVendorPhoto applyEffectBorder];
    [self.contentView addSubview:_ivVendorPhoto];
    
    _lblVendorName = [UILabel new];
    _lblVendorName.font = [TDFontLibrary sharedInstance].fontTitleBold;
    _lblVendorName.text = @"Captain James T. Kirk";
    [self.contentView addSubview:_lblVendorName];
    
    _viewRating = [EDStarRating new];
    _viewRating.backgroundColor = [FDColor sharedInstance].clear;
    _viewRating.starImage = SharedImage.ratingStarEmpty;
    _viewRating.starHighlightedImage = SharedImage.ratingStarFull;
    _viewRating.maxRating = 5;
    _viewRating.horizontalMargin = 0;
    _viewRating.editable = NO;
    _viewRating.displayMode = EDStarRatingDisplayFull;
    _viewRating.rating= 3;
    [self.contentView addSubview:_viewRating];
    
    _viewPhotoContaner = [UIView new];
    _viewPhotoContaner.backgroundColor = [FDColor sharedInstance].random;
    [self.contentView addSubview:_viewPhotoContaner];
}

-(void)setupConstraints {
    [_ivVendorPhoto constrainWidth:@"40" height:@"40"];
    [_ivVendorPhoto alignTopEdgeWithView:self.contentView predicate:@"10"];
    [_ivVendorPhoto alignLeadingEdgeWithView:self.contentView predicate:@"10"];
    
    [_lblVendorName alignTopEdgeWithView:_ivVendorPhoto predicate:nil];
    [_lblVendorName constrainLeadingSpaceToView:_ivVendorPhoto predicate:@"10"];
    [_lblVendorName alignTrailingEdgeWithView:self.contentView predicate:@"-10"];
    
    [_viewRating constrainTopSpaceToView:_lblVendorName predicate:@"5"];
    [_viewRating alignLeadingEdgeWithView:_lblVendorName predicate:nil];
    [_viewRating constrainWidth:@"100" height:@"20"];
    
    [_viewPhotoContaner constrainTopSpaceToView:_viewRating predicate:@"5"];
    [_viewPhotoContaner alignLeadingEdgeWithView:_viewRating predicate:nil];
    [_viewPhotoContaner alignTrailingEdgeWithView:self.contentView predicate:@"-10"];
    [_viewPhotoContaner constrainHeight:@"30"];
    
    
//    int userImageCount = 8;
//    for (int i = 0; i < userImageCount; i++) {
//        UIImageView *iv = [UIImageView new];
//        [iv setImageWithURL:[NSURL URLWithString:SharedImage.urlVendorApple] placeholderImage:SharedImage.defaultImage];
//        [_viewPhotoContaner addSubview:iv];
//        [_photosByVendor addObject:iv];
//        
//        [iv alignTopEdgeWithView:_viewPhotoContaner predicate:@"0"];
//        [iv constrainWidth:@"30" height:@"30"];
//        
//        if (i == 0) {
//            [iv alignLeadingEdgeWithView:_viewPhotoContaner predicate:@"10"];
//        } else if (i == userImageCount - 1) {
//            [iv alignTrailingEdgeWithView:_viewPhotoContaner predicate:@"-10"];
//        }
//    }
//    
//    [UIView spaceOutViewsHorizontally:_photosByVendor predicate:@"20"];
}

+(float)cellHeight {
    return 100;
}

@end
