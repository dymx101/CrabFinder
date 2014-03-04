//
//  TDNewsfeedCell.m
//  UnionpayCard
//
//  Created by Dong Yiming on 3/4/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDNewsfeedCell.h"

@interface TDNewsfeedCell () {
    NSMutableArray     *_pictures;
}

@end

@implementation TDNewsfeedCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self doInit];
    }
    return self;
}

-(void)doInit {
    _ivPhoto = [UIImageView new];
    _ivPhoto.image = [TDImageLibrary sharedInstance].avatar;
    [self addSubview:_ivPhoto];
    [_ivPhoto constrainWidth:@"40" height:@"45"];
    [_ivPhoto applyEffectBorder];
    [_ivPhoto alignTop:@"5" leading:@"10" toView:self];
    
    _lblTitle = [UILabel new];
    _lblTitle.text = @"Picard: He's comparing the Enterprise to a cruise ship?";
    _lblTitle.font = [TDFontLibrary sharedInstance].fontNormal;
    _lblTitle.numberOfLines = 0;
    [self addSubview:_lblTitle];
    [_lblTitle alignTop:@"5" leading:@"60" toView:self];
    [_lblTitle alignTrailingEdgeWithView:self predicate:@"-10"];
    
    int maxPicCount = 4;
    _pictures = [NSMutableArray arrayWithCapacity:maxPicCount];
    for (int i = 0; i < maxPicCount; i++) {
        UIImageView *iv = [UIImageView new];
        iv.image = [TDImageLibrary sharedInstance].farmersMarket;
        [self addSubview:iv];
        
        [iv constrainWidth:@"40" height:@"40"];
        [iv constrainTopSpaceToView:_lblTitle predicate:@"5"];
        
        [_pictures addObject:iv];
    }
    
    [(_pictures.firstObject) alignLeadingEdgeWithView:_lblTitle predicate:@"10"];
    [UIView spaceOutViewsHorizontally:_pictures predicate:@"10"];
}

-(UIButton *)buttonAt:(NSUInteger)aIndex {
    return nil;
}

+(float)HEIGHT {
    return 90;
}

@end
