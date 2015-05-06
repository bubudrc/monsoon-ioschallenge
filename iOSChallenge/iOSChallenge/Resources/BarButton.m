//
//  BarButton.m
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/11/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import "BarButton.h"

@implementation BarButton



- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        // Initialization code
        
       

    }
    return self;
}

+ (id)barButtonWithImage:(NSString *)imageName style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
    
    
    UIImage *icon = [UIImage imageNamed:imageName];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, MAX(50, icon.size.width), 45);
    button.contentMode = UIViewContentModeCenter;
    [button setShowsTouchWhenHighlighted:YES];
    
    [button setImage:icon forState:UIControlStateNormal];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButtonItem;
}

+ (NSArray *)barButtonsBasedOnIcons:(NSArray *) icons target:(id)target action:(SEL)action{
    
    // create an array for the buttons
    NSMutableArray *buttonsBarRight = [[NSMutableArray alloc] init];
    for (NSString *imageName in icons) {
        [buttonsBarRight addObject:[BarButton barButtonWithImage:imageName style:UIBarButtonItemStylePlain target:target action:action]];
    }
    
    return [buttonsBarRight mutableCopy];
    
}


@end
