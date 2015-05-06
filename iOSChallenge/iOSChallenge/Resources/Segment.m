//
//  Segment.m
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/10/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import "Segment.h"

@implementation Segment

-(id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.normalColor = [UIColor blueColor];
        self.selectedColor = [UIColor redColor];
        self.isSelected = NO;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.normalColor = [UIColor colorWithRed:102.0f/255.0f green:0.0f/255.0f blue:51.0f/255.0f alpha:1.0f];
        self.selectedColor = [UIColor colorWithRed:255.0f/255.0f green:102.0f/255.0f blue:102.0f/255.0f alpha:1.0f];
        self.isSelected = NO;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    

    //// Oval Drawing
    CGRect ovalRect = rect;
    self.ovalPath = UIBezierPath.bezierPath;
    
    
    [self.ovalPath addArcWithCenter: CGPointMake(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect)) radius: CGRectGetWidth(ovalRect) / 2 startAngle: -self.startAngle * M_PI/180 endAngle: -self.endAngle * M_PI/180 clockwise: YES];
    
    
    UIColor *colorToUse = (self.isSelected)? self.selectedColor : self.normalColor;
    [colorToUse setStroke];
    
    self.ovalPath.lineWidth = 2;
    [self.ovalPath stroke];
}

-(CGRect) getSegmentRectBasedOnFrameContainer:(CGRect) rect{
    CGFloat diferenceToBorder = 10.0;
    CGFloat sizeSegmentContainer = rect.size.width - diferenceToBorder;
    CGPoint positionSegmentContainer = CGPointMake(rect.origin.x + (diferenceToBorder / 2), rect.origin.y + (diferenceToBorder / 2));
    
    
    return CGRectMake(positionSegmentContainer.x, positionSegmentContainer.y, sizeSegmentContainer, sizeSegmentContainer);
}


@end
