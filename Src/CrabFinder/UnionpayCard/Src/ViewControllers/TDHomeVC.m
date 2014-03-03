//
//  TDHomeVC.m
//  UnionpayCard
//
//  Created by Dong Yiming on 2/18/14.
//  Copyright (c) 2014 Frodo. All rights reserved.
//

#import "TDHomeVC.h"

#import "TDCardListVC.h"
#import "TDVendorsVC.h"
#import "TDAddMoneyVC.h"
#import "TDCreditVC.h"
#import "TDCreditVC.h"
#import "TDConsumeVC.h"
#import "TDMailVC.h"
#import "TDLifeVC.h"
#import "TDRegisterVC.h"


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



@interface TDHomeVC () <UIScrollViewDelegate> {

}

@end

@implementation TDHomeVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [FDColor sharedInstance].desertSand;
    self.navigationItem.title = @"Newsfeed";
    
    [self installSearchToNavibar];
	
    [self createSubviews];
    [self layoutSubviews];
}



-(void)createSubviews {
    
    
}

-(void)layoutSubviews {

}



@end
