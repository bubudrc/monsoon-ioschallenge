//
//  Segment.h
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/10/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Segment : UIView

@property (strong,nonatomic) UIBezierPath *ovalPath;
@property (nonatomic, assign) CGFloat startAngle;
@property (nonatomic, assign) CGFloat endAngle;

@property (strong,nonatomic) UIColor *normalColor;
@property (strong,nonatomic) UIColor *selectedColor;

@property (nonatomic, strong) NSString *segmentTitle;

@property (nonatomic) BOOL isSelected;

@property (nonatomic, assign) NSUInteger idSegment;


-(CGRect) getSegmentRectBasedOnFrameContainer:(CGRect) rect;

@end
