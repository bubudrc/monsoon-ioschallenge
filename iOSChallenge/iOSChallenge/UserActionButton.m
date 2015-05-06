//
//  UserActionButton.m
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/11/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import "UserActionButton.h"

@implementation UserActionButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self baseInitWithFrame:frame];

    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        // Initialization code
        [self baseInitWithFrame:self.frame];
        
    }
    return self;
}

- (void)baseInitWithFrame:(CGRect) frame {
    self.backgroundColor = [UIColor clearColor];
    [self setBackgroundImage:[UIImage imageNamed:@"MON_Ellipse-13-copy"] forState:UIControlStateNormal];
}


@end
