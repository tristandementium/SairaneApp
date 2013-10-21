//
//  RenklerViewController.h
//  Sairane
//
//  Created by selcuk.cigir on 9/3/13.
//  Copyright (c) 2013 selcuk.cigir. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol renkYollayanProtokol <NSObject>

@required
- (void)arkaPlanRengi: (UIColor *)arkaPlanRengi yaziRengi: (UIColor *)yaziRengi;

@end

@interface RenklerViewController : UIViewController

@property (nonatomic, strong) UILabel * textBaslikLabel;
@property (nonatomic, strong) UISlider * textSliderRed;
@property (nonatomic, strong) UISlider * textSliderGreen;
@property (nonatomic, strong) UISlider * textSliderBlue;
@property (nonatomic, strong) UISlider * textSliderAlpha;

@property (nonatomic, strong) UILabel * backBaslikLabel;
@property (nonatomic, strong) UISlider * backSliderRed;
@property (nonatomic, strong) UISlider * backSliderGreen;
@property (nonatomic, strong) UISlider * backSliderBlue;
@property (nonatomic, strong) UISlider * backSliderAlpha;

@property (nonatomic, strong) UIView * kirmizi1;
@property (nonatomic, strong) UIView * yesil1;
@property (nonatomic, strong) UIView * mavi1;
@property (nonatomic, strong) UIView * alpha1;
@property (nonatomic, strong) UIView * kirmizi2;
@property (nonatomic, strong) UIView * yesil2;
@property (nonatomic, strong) UIView * mavi2;
@property (nonatomic, strong) UIView * alpha2;

@property (nonatomic, strong) UILabel * lblOrnek;
@property (nonatomic, strong) UIButton * btnGeri;
@property (nonatomic, strong) UIButton * btnTamam;

@property (nonatomic, copy) UIColor * lblBackgroundRengi;
@property (nonatomic, copy) UIColor * lblTextRengi;
@property (nonatomic, copy) UIFont * lblFont;
@property (nonatomic, copy) NSString * lblString;

@property (nonatomic, weak) id <renkYollayanProtokol>delegate;


@end
