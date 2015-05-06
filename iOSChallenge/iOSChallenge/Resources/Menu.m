//
//  Menu.m
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/11/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import "Menu.h"
#import "ItemMenu.h"


const double SIZE_ITEM_MENU = 160.0;

@interface Menu()


@end

@implementation Menu


+(Menu *)loadMenuIntoView:(UIView *)superView withData:(NSMutableArray *) dataMenu{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    CGFloat heigtSize = (SIZE_ITEM_MENU + 5) * [dataMenu count] / 2;
    CGFloat yInitialPosition = 80.0;
    
    
    // Create a new view with the same frame size as the superView
    Menu *menuViewContainer = [[Menu alloc] initWithFrame:CGRectMake(0, yInitialPosition, screenWidth, heigtSize)];
    
    // If something's gone wrong, abort!
    if(!menuViewContainer){ return nil; }
    
    CGFloat xPosLeft = 20.0;
    CGFloat xPosRight = 20.0;
    
    
    __block CGPoint segmentPosition = CGPointMake(xPosLeft, yInitialPosition);

    
    NSMutableArray *dataView = [[NSMutableArray alloc] init];
    [dataMenu enumerateObjectsUsingBlock:^(NSArray *obj, NSUInteger idx, BOOL *stop) {
                
        if ((idx % 2) != 0) {
            //columnda derecha
            segmentPosition = CGPointMake(screenWidth - (xPosRight + SIZE_ITEM_MENU), SIZE_ITEM_MENU / 2 * (idx - 1));
        } else {
            //columnda izquierda
            segmentPosition = CGPointMake(xPosLeft, SIZE_ITEM_MENU / 2 * idx);
        }
        
        ItemMenu *newItem = [[ItemMenu alloc] initWithFrame:CGRectMake(segmentPosition.x, segmentPosition.y, SIZE_ITEM_MENU, SIZE_ITEM_MENU)];
        
        newItem.segmentsTitles = obj;
        newItem.separationSize = 5.0;
        
        [menuViewContainer addSubview:newItem];
        
        [dataView addObject:newItem];
        
    }];

    [superView addSubview:menuViewContainer];
    
    return menuViewContainer;
}

// .m file
-(void)removeBoard{
    // Take me the hells out of the superView!
    [super removeFromSuperview];
}

-(void) updateConstraints{
    [super updateConstraints];
}


@end
