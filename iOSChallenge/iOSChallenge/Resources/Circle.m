//
//  Circle.m
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/10/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import "Circle.h"

@implementation Circle


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: rect];
    [self.fillColor setFill];
    [ovalPath fill];

}

-(CGRect) getCircleRectBasedOnFrameContainer:(CGRect) rect{
    CGFloat diferenceToBorder = 20.0;
    CGFloat sizeCircle = rect.size.width - diferenceToBorder;
    CGPoint positionCircle = CGPointMake(rect.origin.x + (diferenceToBorder / 2), rect.origin.y + (diferenceToBorder / 2));
    
    
    return CGRectMake(positionCircle.x, positionCircle.y, sizeCircle, sizeCircle);
}


@end
