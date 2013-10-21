//
//  RenklerViewController.m
//  Sairane
//
//  Created by selcuk.cigir on 9/3/13.
//  Copyright (c) 2013 selcuk.cigir. All rights reserved.
//

#import "RenklerViewController.h"

@interface RenklerViewController ()

@end

@implementation RenklerViewController
@synthesize textBaslikLabel, textSliderBlue, textSliderGreen, textSliderRed, backBaslikLabel, backSliderBlue, backSliderGreen, backSliderRed, lblOrnek, btnGeri, btnTamam, kirmizi1, kirmizi2, yesil1, yesil2, mavi1, mavi2, alpha1, alpha2, textSliderAlpha, backSliderAlpha, delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // UI elementleri pozisyonlanıyor
    if ([UIScreen mainScreen].bounds.size.height == 480)
    {
        UIColor * textColorRef = self.lblTextRengi;
        UIColor * backColorRef = self.lblBackgroundRengi;
        CGFloat textRed, textGreen, textBlue, textAlpha;
        CGFloat backRed, backGreen, backBlue, backAlpha;
        [textColorRef getRed:&textRed green:&textGreen blue:&textBlue alpha:&textAlpha];
        [backColorRef getRed:&backRed green:&backGreen blue:&backBlue alpha:&backAlpha];
        
        UIImageView * imajView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pw_pattern_@4X.png"]];
        imajView.frame = self.view.bounds;
        [self.view addSubview:imajView];
        
        kirmizi1 = [[UIView alloc] initWithFrame:CGRectMake(285, 40, 20, 20)];
        kirmizi1.backgroundColor = [UIColor redColor];
        kirmizi1.userInteractionEnabled = NO;
        [self.view addSubview:kirmizi1];
        
        yesil1 = [[UIView alloc] initWithFrame:CGRectMake(285, 80, 20, 20)];
        yesil1.backgroundColor = [UIColor greenColor];
        yesil1.userInteractionEnabled = NO;
        [self.view addSubview:yesil1];
        
        mavi1 = [[UIView alloc] initWithFrame:CGRectMake(285, 120, 20, 20)];
        mavi1.backgroundColor = [UIColor blueColor];
        mavi1.userInteractionEnabled = NO;
        [self.view addSubview:mavi1];
        
        alpha1 = [[UIView alloc] initWithFrame:CGRectMake(285, 160, 20, 20)];
        alpha1.backgroundColor = [UIColor grayColor];
        alpha1.userInteractionEnabled = NO;
        [self.view addSubview:alpha1];
        
        kirmizi2 = [[UIView alloc] initWithFrame:CGRectMake(285, 250, 20, 20)];
        kirmizi2.backgroundColor = [UIColor redColor];
        kirmizi2.userInteractionEnabled = NO;
        [self.view addSubview:kirmizi2];
        
        yesil2 = [[UIView alloc] initWithFrame:CGRectMake(285, 290, 20, 20)];
        yesil2.backgroundColor = [UIColor greenColor];
        yesil2.userInteractionEnabled = NO;
        [self.view addSubview:yesil2];
        
        mavi2 = [[UIView alloc] initWithFrame:CGRectMake(285, 330, 20, 20)];
        mavi2.backgroundColor = [UIColor blueColor];
        mavi2.userInteractionEnabled = NO;
        [self.view addSubview:mavi2];
        
        alpha2 = [[UIView alloc] initWithFrame:CGRectMake(285, 370, 20, 20)];
        alpha2.backgroundColor = [UIColor grayColor];
        alpha2.userInteractionEnabled = NO;
        [self.view addSubview:alpha2];
        
        textBaslikLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 12, 108, 21)];
        textBaslikLabel.text = @"Yazı rengi";
        textBaslikLabel.textColor = [UIColor redColor];
        textBaslikLabel.backgroundColor = [UIColor clearColor];
        textBaslikLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        textBaslikLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:textBaslikLabel];
        
        textSliderRed = [[UISlider alloc] initWithFrame:CGRectMake(18, 40, 254, 23)];
        textSliderRed.minimumValue = 0;
        textSliderRed.maximumValue = 255;
        textSliderRed.minimumTrackTintColor = [UIColor redColor];
        if (textColorRef == [UIColor whiteColor]) {
            textSliderRed.value = 255;
        }
        else
        {
            textSliderRed.value = (textRed * 255);
        }
        
        [self.view addSubview:textSliderRed];
        
        textSliderGreen = [[UISlider alloc] initWithFrame:CGRectMake(18, 80, 254, 23)];
        textSliderGreen.minimumValue = 0;
        textSliderGreen.maximumValue = 255;
        textSliderGreen.minimumTrackTintColor = [UIColor greenColor];
        if (textColorRef == [UIColor whiteColor]) {
            textSliderGreen.value = 255;
        }
        else
        {
            textSliderGreen.value = (textGreen * 255);
        }
        [self.view addSubview:textSliderGreen];
        
        textSliderBlue = [[UISlider alloc] initWithFrame:CGRectMake(18, 120, 254, 23)];
        textSliderBlue.minimumValue = 0;
        textSliderBlue.maximumValue = 255;
        textSliderBlue.minimumTrackTintColor = [UIColor blueColor];
        if (textColorRef == [UIColor whiteColor]) {
            textSliderBlue.value = 255;
        }
        else
        {
            textSliderBlue.value = (textBlue * 255);
        }
        [self.view addSubview:textSliderBlue];
        
        textSliderAlpha = [[UISlider alloc] initWithFrame:CGRectMake(18, 160, 254, 23)];
        textSliderAlpha.minimumValue = 0;
        textSliderAlpha.maximumValue = 1.0;
        textSliderAlpha.minimumTrackTintColor = [UIColor grayColor];
        textSliderAlpha.value = textAlpha;
        if (textColorRef == [UIColor whiteColor]) {
            textSliderAlpha.value = 1.0;
        }
        else
        {
            textSliderAlpha.value = textAlpha;
        }
        [self.view addSubview:textSliderAlpha];
        
        backBaslikLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 210, 121, 28)];
        backBaslikLabel.text = @"Arka plan rengi";
        backBaslikLabel.textColor = [UIColor whiteColor];
        backBaslikLabel.backgroundColor = [UIColor redColor];
        backBaslikLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
        backBaslikLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:backBaslikLabel];

        backSliderRed = [[UISlider alloc] initWithFrame:CGRectMake(18, 250, 254, 23)];
        backSliderRed.minimumValue = 0;
        backSliderRed.maximumValue = 255;
        backSliderRed.minimumTrackTintColor = [UIColor redColor];
        if (backColorRef == [UIColor whiteColor]) {
            backSliderRed.value = 255;
        }
        else
        {
            backSliderRed.value = (backRed * 255);
        }
        [self.view addSubview:backSliderRed];
        
        backSliderGreen = [[UISlider alloc] initWithFrame:CGRectMake(18, 290, 254, 23)];
        backSliderGreen.minimumValue = 0;
        backSliderGreen.maximumValue = 255;
        backSliderGreen.minimumTrackTintColor = [UIColor greenColor];
        if (backColorRef == [UIColor whiteColor]) {
            backSliderGreen.value = 255;
        }
        else
        {
            backSliderGreen.value = (backGreen * 255);
        }
        [self.view addSubview:backSliderGreen];
        
        backSliderBlue = [[UISlider alloc] initWithFrame:CGRectMake(18, 330, 254, 23)];
        backSliderBlue.minimumValue = 0;
        backSliderBlue.maximumValue = 255;
        backSliderBlue.minimumTrackTintColor = [UIColor blueColor];
        if (backColorRef == [UIColor whiteColor]) {
            backSliderBlue.value = 255;
        }
        else
        {
            backSliderBlue.value = (backBlue * 255);
        }
        [self.view addSubview:backSliderBlue];
        
        backSliderAlpha = [[UISlider alloc] initWithFrame:CGRectMake(18, 370, 254, 23)];
        backSliderAlpha.minimumValue = 0;
        backSliderAlpha.maximumValue = 1.0;
        backSliderAlpha.minimumTrackTintColor = [UIColor grayColor];
        if (backColorRef == [UIColor whiteColor]) {
            backSliderAlpha.value = 1.0;
        }
        else
        {
            backSliderAlpha.value = backAlpha;
        }
        [self.view addSubview:backSliderAlpha];
        
        btnGeri = [UIButton buttonWithType:UIButtonTypeCustom];
        btnGeri.frame = CGRectMake(18, 435, 30, 30);
        [btnGeri setImage:[UIImage imageNamed:@"btnGeri.png"] forState:UIControlStateNormal];
        [btnGeri addTarget:self action:@selector(btnGeriClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnGeri];
        
        btnTamam = [UIButton buttonWithType:UIButtonTypeCustom];
        btnTamam.frame = CGRectMake(273, 435, 30, 30);
        [btnTamam setImage:[UIImage imageNamed:@"btnOk.png"] forState:UIControlStateNormal];
        [btnTamam addTarget:self action:@selector(btnTamamClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btnTamam];
        
        lblOrnek = [[UILabel alloc] initWithFrame:CGRectMake(130, 420, 95, 38)];
        lblOrnek.backgroundColor = self.lblBackgroundRengi;
        lblOrnek.textColor = self.lblTextRengi;
        lblOrnek.font = [UIFont fontWithName:self.lblFont.familyName size:20];
        lblOrnek.text = self.lblString;
        [lblOrnek adjustsFontSizeToFitWidth];
        [lblOrnek sizeToFit];
        lblOrnek.frame = CGRectMake(lblOrnek.frame.origin.x, lblOrnek.frame.origin.y, lblOrnek.frame.size.width +10, lblOrnek.frame.size.height +10);
        lblOrnek.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:lblOrnek];
        
        NSArray * textArray = [NSArray arrayWithObjects:textSliderRed, textSliderGreen, textSliderBlue, textSliderAlpha, nil];
        NSArray * bgArray = [NSArray arrayWithObjects:backSliderRed, backSliderGreen, backSliderBlue, backSliderAlpha, nil];
        for (UISlider * us in textArray) {
            [us addTarget:self action:@selector(textSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        }
        for (UISlider * us in bgArray) {
            [us addTarget:self action:@selector(backSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        }
    }
    else if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        
    }
    
}

- (void) textSliderValueChanged: (id)sender
{
    lblOrnek.textColor = [UIColor colorWithRed:textSliderRed.value/255  green:textSliderGreen.value/255 blue:textSliderBlue.value/255 alpha:textSliderAlpha.value];
}

- (void) backSliderValueChanged: (id)sender
{
    lblOrnek.backgroundColor = [UIColor colorWithRed:backSliderRed.value/255  green:backSliderGreen.value/255 blue:backSliderBlue.value/255 alpha:backSliderAlpha.value];
}

- (void) btnGeriClick: (id) sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void) btnTamamClick: (id) sender
{
    [self renkDelegateGenerator];
    [self.navigationController popToRootViewControllerAnimated:YES];
    NSLog(@"Renk onaylama butonu Tıklandı...");
}

- (void) renkDelegateGenerator
{
    NSNotification * renkNotifikasyon = [NSNotification notificationWithName:@"renkNotification" object:self];
    [[NSNotificationCenter defaultCenter] postNotification:renkNotifikasyon];
    [delegate arkaPlanRengi:lblOrnek.backgroundColor yaziRengi:lblOrnek.textColor];
    NSLog(@"renkDelegateGenerator çalıştı...");
}







@end
