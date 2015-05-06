//
//  ViewController.m
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/9/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import "ViewController.h"
#import "UserChoiceViewController.h"

#import "TransparentToolbar.h"
#import "BarButton.h"
#import "Menu.h"
#import "ItemMenu.h"
#import "Footer.h"
#import "UserActionButton.h"



@interface ViewController ()

@property(nonatomic, strong) NSDictionary *dataBoard;
@property (nonatomic, strong) NSArray *menuItems;

@property (nonatomic, strong) Menu *currentMenu;

@end

@implementation ViewController

#pragma mark - UIVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    /* ------------------ Menu ------------------ */
    NSArray *leftButtonsImageName = @[@"MON_searchIcon", @"MON_calendarIcon", @"MON_compassIcon"];
    NSArray *rightButtonsImageName = @[@"MON_menuIcon"];
    
    
    CGFloat widthToolbar = 60.0 * [leftButtonsImageName count];
    // create a toolbar where we can place some buttons
    TransparentToolbar *toolbar = [[TransparentToolbar alloc]
                          initWithFrame:CGRectMake(0, 0, widthToolbar, 45)];
    
    // put the left buttons in the toolbar and release them
    [toolbar setItems:[BarButton barButtonsBasedOnIcons:leftButtonsImageName target:self action:@selector(buttonBarPressed:)]animated:YES];
    
    // place the toolbar into the navigation bar
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithCustomView:toolbar];
    // put the right buttons
    self.navigationItem.rightBarButtonItems = [BarButton barButtonsBasedOnIcons:rightButtonsImageName target:self action:@selector(buttonBarPressed:)];

    
    /* ------------------ Board ------------------ */
    // set the values for each menu for each segment
    self.menuItems = @[@[@"one of a kind", @"small batch", @"large batch", @"mass market"],
                           @[@"savory", @"sweet", @"umami"],
                           @[@"spicy", @"mild"],
                           @[@"crunchy", @"mushy", @"smooth"],
                           @[@"a little", @"a lot"],
                           @[@"breakfast", @"brunch", @"lunch", @"snack", @"dinner"]];
    
    // draw and show the menu board
    self.currentMenu = [Menu loadMenuIntoView:self.view withData:[self.menuItems mutableCopy]];

    /* ------------------ Footer ------------------ */
    NSArray *footerButtons = @[@"MON_shuffleIcon", @"MON_GO"];
    NSDictionary *dataFooter = [Footer loadFooterIntoView:self.view withData:[footerButtons mutableCopy]];
    NSArray *buttonsFooter = dataFooter[@"data"];
    
    [buttonsFooter enumerateObjectsUsingBlock:^(UserActionButton *userButton, NSUInteger idx, BOOL *stop) {
        [userButton addTarget:self
                   action:@selector(footerButtonPressed:)
         forControlEvents:UIControlEventTouchUpInside];
    }];

    
}

#pragma mark - UIButtons

-(void) buttonBarPressed:(UIBarButtonItem *) sender{
    NSLog(@"Bar Button Pressed: %@", sender);
}

-(void) footerButtonPressed:(UserActionButton *) sender{
    
    switch ([sender tag]) {
        case 0:
            [self randomizeItems];
            break;
        case 1:
            [self performSegueWithIdentifier:@"showUserChoice" sender:[self obtainUserPreferences]];
            break;
        default:
            break;
    }
    
}

#pragma mark - Actions:
#pragma mark Randomize
-(void) randomizeItems{

    
    NSMutableArray *currentItems = [[NSMutableArray alloc] initWithArray:self.menuItems];
    
    //remove current board
    [self.currentMenu removeFromSuperview];
    
    //randomize data
    for (NSInteger x = 0; x < [self.menuItems count]; x++) {
        NSInteger randInt = (random() % ([currentItems count] - x)) + x;
        [currentItems exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }
    
    //set new data
    self.menuItems = currentItems;

    //create new board
    self.currentMenu = [Menu loadMenuIntoView:self.view withData:[self.menuItems mutableCopy]];
    
    currentItems = nil;
    
}

#pragma mark Go user selection
-(NSString *) obtainUserPreferences{
    
    NSString *userChoiced = @"";
    for (UIView *itemMenuSelected in self.currentMenu.subviews) {
        if([itemMenuSelected isKindOfClass:[ItemMenu class]]){
            ItemMenu *temporaryItem = (ItemMenu *) itemMenuSelected;
            userChoiced = [userChoiced stringByAppendingString:[NSString stringWithFormat:@"%@\n", [self getSubmenuSelectedFromItemMenu:temporaryItem]]];
            
            temporaryItem = nil;
            
        }

    }
    
    return userChoiced;
}

-(NSString *) getSubmenuSelectedFromItemMenu:(ItemMenu *) itemMenu{
    return itemMenu.segmentTitle.text;
}


#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"showUserChoice"]) {
        [segue.destinationViewController setUserChoicedData:(NSString *) sender];
    }
}




@end
