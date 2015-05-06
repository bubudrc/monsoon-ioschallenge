//
//  Footer.h
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/11/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Footer : UIView

+(NSDictionary *)loadFooterIntoView:(UIView *)superView withData:(NSMutableArray *) dataMenu;
-(void)removeFooter;

@end
