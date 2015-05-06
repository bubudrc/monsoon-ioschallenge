//
//  Title.m
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/10/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import "Title.h"

@implementation Title

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self baseInitWithFrame:frame];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        // Initialization code
        [self baseInitWithFrame:self.frame];
    }
    return self;
}



- (void)baseInitWithFrame:(CGRect) frame {
    self.textColor = [UIColor whiteColor];
    self.textAlignment = NSTextAlignmentCenter;
    self.numberOfLines = 1;
    self.backgroundColor = [UIColor clearColor];
    self.font = [UIFont fontWithName:@"Helvetica" size:17];
    [self setMinimumScaleFactor:8.0];
    self.adjustsFontSizeToFitWidth = YES;
    [self.text uppercaseString];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
