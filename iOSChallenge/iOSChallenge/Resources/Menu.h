//
//  Menu.h
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/11/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import <UIKit/UIKit.h>


extern const double SIZE_ITEM_MENU;

@interface Menu : UIView

+(Menu *)loadMenuIntoView:(UIView *)superView withData:(NSMutableArray *) dataMenu;
-(void)removeBoard;


@end
