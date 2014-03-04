//
//  TDUser.h
//  UnionpayCard
//
//  Created by Dong Yiming on 3/4/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDBaseModel.h"

@interface TDUser : TDBaseModel
@property (nonatomic, copy) NSString            *email;
@property (nonatomic, copy) NSString            *bio;
@property (nonatomic, strong) NSString          *profilePicUrl;

@end
