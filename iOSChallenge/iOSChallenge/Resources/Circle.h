//
//  Circle.h
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/10/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Circle : UIView

@property (nonatomic, assign) UIColor *fillColor;

-(CGRect) getCircleRectBasedOnFrameContainer:(CGRect) rect;

@end
