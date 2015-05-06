//
//  Footer.m
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/11/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import "Footer.h"
#import "UserActionButton.h"

@implementation Footer

+(NSDictionary *)loadFooterIntoView:(UIView *)superView withData:(NSMutableArray *) dataMenu{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    CGFloat buttonSize = 50;
    
    CGFloat widthSize = (buttonSize + 2.5) * [dataMenu count];
    
    
    // Create a new view with the same frame size as the superView
    Footer *footerViewContainer = [[Footer alloc] initWithFrame:CGRectMake((screenWidth - widthSize) / 2 , screenHeight - (buttonSize + 20.0), widthSize, buttonSize)];
    
    // If something's gone wrong, abort!
    if(!footerViewContainer){ return nil; }

    
    
    NSMutableArray *dataView = [[NSMutableArray alloc] init];
    
    [dataMenu enumerateObjectsUsingBlock:^(NSString *actionButtonString, NSUInteger idx, BOOL *stop) {
        
        CGFloat xPos = 0;
        
        if(idx != 0){
            xPos = footerViewContainer.frame.size.width - (idx * buttonSize);
        }
        
        UserActionButton *actionButton = [[UserActionButton alloc] initWithFrame:CGRectMake(xPos, 0, buttonSize, buttonSize)];
        [actionButton setImage:[UIImage imageNamed:actionButtonString] forState:UIControlStateNormal];
        [actionButton setTag:idx];
        
        [footerViewContainer addSubview:actionButton];
        
        [dataView addObject:actionButton];
    }];
    
    [superView addSubview:footerViewContainer];
    
    return @{@"view": footerViewContainer, @"data":dataView};
}


// .m file
-(void)removeFooter{
    // Take me the hells out of the superView!
    [super removeFromSuperview];
}

-(void) updateConstraints{
    [super updateConstraints];
}


@end
