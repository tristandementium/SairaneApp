//
//  MainViewController.h
//  Sairane
//
//  Created by selcuk.cigir on 8/28/13.
//  Copyright (c) 2013 selcuk.cigir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Wording.h"
#import <QuartzCore/QuartzCore.h>
#import "FontsTableView.h"
#import "FontPicker.h"
#import "RenklerViewController.h"
#import "SavePoetry.h"
#import "SavePoetryView.h"

#define lblFrameSizeFactor 15

@interface MainViewController : UIViewController <UIAlertViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIActionSheetDelegate, UIPickerViewDelegate, renkYollayanProtokol>
@property (strong, nonatomic) IBOutlet UIImageView *btnAddWord;
@property (strong, nonatomic) IBOutlet UIImageView *btnRemoveWord;
@property (strong, nonatomic) IBOutlet UIButton *btnRenkler;
@property (strong, nonatomic) IBOutlet UIButton *btnArkaPlan;
@property (strong, nonatomic) IBOutlet UIButton *btnMenu;
@property (strong, nonatomic) IBOutlet UIButton *btnFx;
@property (strong, nonatomic) IBOutlet UIButton *btnFont;
@property (strong, nonatomic) FontPicker * fontPicker;
@property (strong, nonatomic) UIImageView * bgImaj;

@property (strong, nonatomic) UIColor * chosenBgColor;
@property (strong, nonatomic) UIColor * chosenTextColor;

- (IBAction)btnArkaPlanClick:(UIButton *)sender;
- (IBAction)btnMenuClicked:(UIButton *)sender;
- (IBAction)btnFontClicked:(UIButton *)sender;

@end


