//
//  UserChoiceViewController.m
//  iOSChallenge
//
//  Created by Marcelo Perretta on 12/11/14.
//  Copyright (c) 2014 MaWaPe. All rights reserved.
//

#import "UserChoiceViewController.h"

@interface UserChoiceViewController () <UITextViewDelegate>


@end

@implementation UserChoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITextView *userSelectionTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    userSelectionTextView.delegate = self;
    [userSelectionTextView setEditable:NO];
    [userSelectionTextView setSelectable:YES];

    userSelectionTextView.text = self.userChoicedData;
    
    [self.view addSubview:userSelectionTextView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
