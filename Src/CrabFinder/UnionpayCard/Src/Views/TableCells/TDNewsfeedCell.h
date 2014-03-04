//
//  TDNewsfeedCell.h
//  UnionpayCard
//
//  Created by Dong Yiming on 3/4/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TDNewsfeedCell : UITableViewCell
@property (nonatomic, strong) UIImageView       *ivPhoto;
@property (nonatomic, strong) UILabel           *lblTitle;

-(UIButton *)buttonAt:(NSUInteger)aIndex;

+(float)HEIGHT;

@end
