//
//  BarButton.h
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/11/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarButton : UIBarButtonItem

+ (id)barButtonWithImage:(NSString *)imageName style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;

+ (NSArray *)barButtonsBasedOnIcons:(NSArray *) icons target:(id)target action:(SEL)action;

@end
