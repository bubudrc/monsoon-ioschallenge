//
//  ItemMenu.h
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/10/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Circle.h"
#import "Title.h"

@interface ItemMenu : UIControl

@property (strong, nonatomic) IBOutlet UIView *view;

@property (nonatomic, assign) NSUInteger amountSegments;

@property (nonatomic, assign) CGFloat separationSize;

@property (nonatomic, strong) NSMutableArray *segmentsMenu;

@property (nonatomic, strong) NSArray *segmentsTitles;

@property (nonatomic, strong) Circle *newone;
@property (nonatomic, strong) Title *segmentTitle;


@end
