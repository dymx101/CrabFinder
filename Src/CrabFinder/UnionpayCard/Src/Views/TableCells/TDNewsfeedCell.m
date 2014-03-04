//
//  TDNewsfeedCell.m
//  UnionpayCard
//
//  Created by Dong Yiming on 3/4/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDNewsfeedCell.h"

@interface TDNewsfeedCell () {
    NSMutableArray     *pictures;
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
}

-(UIButton *)buttonAt:(NSUInteger)aIndex {
    return nil;
}

+(float)HEIGHT {
    return 80;
}

@end
