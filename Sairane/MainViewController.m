//
//  MainViewController.m
//  Sairane
//
//  Created by selcuk.cigir on 8/28/13.
//  Copyright (c) 2013 selcuk.cigir. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
{
    NSMutableArray * mutuArray;
    UITapGestureRecognizer * tapperAdd; UITapGestureRecognizer * tapperRemove; UITapGestureRecognizer * tapperAddDouble; UITapGestureRecognizer * tapperRemoveDouble;
    UIPinchGestureRecognizer * pincher;
    CALayer * sublayer;
    UIFont * currentFont;
}

@end

@implementation MainViewController
@synthesize btnAddWord, btnRemoveWord, btnRenkler, btnArkaPlan, btnMenu, btnFx, btnFont, fontPicker, bgImaj;

- (void)viewDidLoad
{
    [super viewDidLoad];
    bgImaj = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view insertSubview:bgImaj atIndex:0];
	mutuArray = [self sozGenerateEt];
    [self labellariDiz];
    self.navigationController.navigationBarHidden = YES;
    RenklerViewController * rvc = [[RenklerViewController alloc] init];
    rvc.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(renkNotificationHandler:) name:@"renkNotification" object:nil];
    UILabel * lastObjectLabel = self.view.subviews.lastObject;
    if ([lastObjectLabel isKindOfClass:[UILabel class]])
    {
        currentFont = [UIFont fontWithName:lastObjectLabel.font.fontName size:lastObjectLabel.font.pointSize];
    }
    else
    {
        currentFont = [UIFont fontWithName:@"Helvetica" size:16];
    }
    
    // Button resize for iPhone 5 and pre iPhone 5
    if ([UIScreen mainScreen].bounds.size.height == 480)
    {
        btnAddWord.image = [UIImage imageNamed:@"plus.png"];
        btnRemoveWord.image = [UIImage imageNamed:@"minus.png"];
        btnAddWord.highlightedImage = [UIImage imageNamed:@"plus-highlighted.png"];
        btnRemoveWord.highlightedImage = [UIImage imageNamed:@"minus-highlighted.png"];
        [btnRenkler setImage:[UIImage imageNamed:@"colors.png"] forState:UIControlStateNormal];
        [btnArkaPlan setImage:[UIImage imageNamed:@"btnArkaPlan.png"] forState:UIControlStateNormal];
        [btnFx setImage:[UIImage imageNamed:@"btnFx.png"] forState:UIControlStateNormal];
        [btnFont setImage:[UIImage imageNamed:@"btnFont.png"] forState:UIControlStateNormal];
        [btnMenu setImage:[UIImage imageNamed:@"btnMenu.png"] forState:UIControlStateNormal];
    }
    else if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        btnAddWord.image = [UIImage imageNamed:@"plus2x.png"];
        btnRemoveWord.image = [UIImage imageNamed:@"minus2x.png"];
        btnAddWord.highlightedImage = [UIImage imageNamed:@"plus-highlighted2x.png"];
        btnRemoveWord.highlightedImage = [UIImage imageNamed:@"minus-highlighted2x.png"];
        [btnRenkler setImage:[UIImage imageNamed:@"colors2x.png"] forState:UIControlStateNormal];
        [btnArkaPlan setImage:[UIImage imageNamed:@"btnArkaPlan2x.png"] forState:UIControlStateNormal];
        [btnFx setImage:[UIImage imageNamed:@"btnFx2x.png"] forState:UIControlStateNormal];
        [btnFont setImage:[UIImage imageNamed:@"btnFont2x.png"] forState:UIControlStateNormal];
        [btnMenu setImage:[UIImage imageNamed:@"btnMenu2x.png"] forState:UIControlStateNormal];
    }
    // Label ekleyen butona gesture recognizer ekleniyor
    tapperAdd = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapperAction:)];
    tapperAdd.numberOfTapsRequired = 1;
    [btnAddWord addGestureRecognizer:tapperAdd];
    
    // Label alanındaki Labelları silen butona gesture recognizer ekleniyor
    tapperRemove = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapperAction:)];
    tapperRemove.numberOfTapsRequired = 1;
    [btnRemoveWord addGestureRecognizer:tapperRemove];
    
    // Custom Label ekleyen butona gesture recognizer ekleniyor
    tapperAddDouble = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapperAction:)];
    tapperAddDouble.numberOfTapsRequired = 2;
    [btnAddWord addGestureRecognizer:tapperAddDouble];
    
    // Bütün Labelları silen butona gesture recognizer ekleniyor
    tapperRemoveDouble = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapperAction:)];
    tapperRemoveDouble.numberOfTapsRequired = 2;
    [btnRemoveWord addGestureRecognizer:tapperRemoveDouble];
    
    [tapperAdd requireGestureRecognizerToFail:tapperAddDouble];
    [tapperRemove requireGestureRecognizerToFail:tapperRemoveDouble];
}

- (NSMutableArray *) sozGenerateEt
{
    NSMutableArray * aray = [NSMutableArray arrayWithCapacity:6];
    for (int i = 1; i <= 7 ; i++)
    {
        Wording * word = [[Wording alloc] init];
        NSString * soz = [word sozDondur];
        [aray addObject:soz];
    }
    return aray;
}

// Labelları sayfaya ekleyen method.
- (void) labellariDiz
{
    mutuArray = [self sozGenerateEt];
    // Labelları ekliyoruz.
    if (mutuArray)
    {
        [self clear];
        NSMutableArray * tempArray = [[NSMutableArray alloc] init];
        for (int i = 1; i <= mutuArray.count-1; i++)
        {
            NSString * wordString = [[NSString alloc] init];
            wordString = mutuArray[i];
            [tempArray addObject:wordString];
        }
        
        if ([UIScreen mainScreen].bounds.size.height == 480)
        {
            /* --------------------- Label 1 iphone 4 --------------------- */
            UILabel * lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 338, 69, 36)];
            lbl1.text = tempArray[0];
            lbl1.font = [UIFont fontWithName:currentFont.fontName size:18.0f];
            lbl1.textColor = [UIColor whiteColor];
            lbl1.textAlignment = NSTextAlignmentCenter;
            lbl1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl1.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl1.frame = CGRectMake(lbl1.frame.origin.x, lbl1.frame.origin.y, lbl1.frame.size.width+lblFrameSizeFactor, lbl1.frame.size.height+lblFrameSizeFactor);
            lbl1.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl1.userInteractionEnabled = YES;
            [lbl1 sizeToFit];
            lbl1.frame = CGRectMake(lbl1.frame.origin.x, lbl1.frame.origin.y, lbl1.frame.size.width+lblFrameSizeFactor, lbl1.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl1];
            
            /* --------------------- Label 2 iphone 4 --------------------- */
            UILabel * lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(125, 338, 69, 36)];
            lbl2.text = tempArray[1];
            lbl2.font = lbl1.font;
            lbl2.textColor = lbl1.textColor;
            lbl2.textAlignment = lbl1.textAlignment;
            lbl2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl2.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl2.frame = CGRectMake(lbl2.frame.origin.x, lbl2.frame.origin.y, lbl2.frame.size.width+lblFrameSizeFactor, lbl2.frame.size.height+lblFrameSizeFactor);
            lbl2.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl2.userInteractionEnabled = YES;
            [lbl2 sizeToFit];
            lbl2.frame = CGRectMake(lbl2.frame.origin.x, lbl2.frame.origin.y, lbl2.frame.size.width+lblFrameSizeFactor, lbl2.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl2];
            
            /* --------------------- Label 3 iphone 4 --------------------- */
            UILabel * lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(231, 338, 69, 36)];
            lbl3.text = tempArray[2];
            lbl3.font = lbl1.font;
            lbl3.textColor = lbl1.textColor;
            lbl3.textAlignment = lbl1.textAlignment;
            lbl3.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl3.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl3.frame = CGRectMake(lbl3.frame.origin.x, lbl3.frame.origin.y, lbl3.frame.size.width+lblFrameSizeFactor, lbl3.frame.size.height+lblFrameSizeFactor);
            lbl3.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl3.userInteractionEnabled = YES;
            [lbl3 sizeToFit];
            lbl3.frame = CGRectMake(lbl3.frame.origin.x, lbl3.frame.origin.y, lbl3.frame.size.width+lblFrameSizeFactor, lbl3.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl3];
            
            /* --------------------- Label 4 iphone 4 --------------------- */
            UILabel * lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 387, 69, 36)];
            lbl4.text = tempArray[3];
            lbl4.font = lbl1.font;
            lbl4.textColor = lbl1.textColor;
            lbl4.textAlignment = lbl1.textAlignment;
            lbl4.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl4.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl4.frame = CGRectMake(lbl4.frame.origin.x, lbl4.frame.origin.y, lbl4.frame.size.width+lblFrameSizeFactor, lbl4.frame.size.height+lblFrameSizeFactor);
            lbl4.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl4.userInteractionEnabled = YES;
            [lbl4 sizeToFit];
            lbl4.frame = CGRectMake(lbl4.frame.origin.x, lbl4.frame.origin.y, lbl4.frame.size.width+lblFrameSizeFactor, lbl4.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl4];
            
            /* --------------------- Label 5 iphone 4 --------------------- */
            UILabel * lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(125, 387, 69, 36)];
            lbl5.text = tempArray[4];
            lbl5.font = lbl1.font;
            lbl5.textColor = lbl1.textColor;
            lbl5.textAlignment = lbl1.textAlignment;
            lbl5.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl5.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl5.frame = CGRectMake(lbl5.frame.origin.x, lbl5.frame.origin.y, lbl5.frame.size.width+lblFrameSizeFactor, lbl5.frame.size.height+lblFrameSizeFactor);
            lbl5.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl5.userInteractionEnabled = YES;
            [lbl5 sizeToFit];
            lbl5.frame = CGRectMake(lbl5.frame.origin.x, lbl5.frame.origin.y, lbl5.frame.size.width+lblFrameSizeFactor, lbl5.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl5];
            
            /* --------------------- Label 6 iphone 4 --------------------- */
            UILabel * lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(231, 387, 69, 36)];
            lbl6.text = tempArray[5];
            lbl6.font = lbl1.font;
            lbl6.textColor = lbl1.textColor;
            lbl6.textAlignment = lbl1.textAlignment;
            lbl6.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl6.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl6.frame = CGRectMake(lbl6.frame.origin.x, lbl6.frame.origin.y, lbl6.frame.size.width+lblFrameSizeFactor, lbl6.frame.size.height+lblFrameSizeFactor);
            lbl6.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl6.userInteractionEnabled = YES;
            [lbl6 sizeToFit];
            lbl6.frame = CGRectMake(lbl6.frame.origin.x, lbl6.frame.origin.y, lbl6.frame.size.width+lblFrameSizeFactor, lbl6.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl6];
        }
        else if ([UIScreen mainScreen].bounds.size.height == 568)
        {
            /* --------------------- Label 1 iphone 5 --------------------- */
            UILabel * lbl1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 426, 69, 36)];
            lbl1.text = tempArray[0];
            lbl1.font = [UIFont fontWithName:currentFont.fontName size:18.0f];
            lbl1.textColor = [UIColor whiteColor];
            lbl1.textAlignment = NSTextAlignmentCenter;
            lbl1.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl1.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl1.frame = CGRectMake(lbl1.frame.origin.x, lbl1.frame.origin.y, lbl1.frame.size.width+lblFrameSizeFactor, lbl1.frame.size.height+lblFrameSizeFactor);
            lbl1.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl1.userInteractionEnabled = YES;
            [lbl1 sizeToFit];
            lbl1.frame = CGRectMake(lbl1.frame.origin.x, lbl1.frame.origin.y, lbl1.frame.size.width+lblFrameSizeFactor, lbl1.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl1];
            
            /* --------------------- Label 2 iphone 5 --------------------- */
            UILabel * lbl2 = [[UILabel alloc] initWithFrame:CGRectMake(125, 426, 69, 36)];
            lbl2.text = tempArray[1];
            lbl2.font = lbl1.font;
            lbl2.textColor = lbl1.textColor;
            lbl2.textAlignment = lbl1.textAlignment;
            lbl2.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl2.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl2.frame = CGRectMake(lbl2.frame.origin.x, lbl2.frame.origin.y, lbl2.frame.size.width+lblFrameSizeFactor, lbl2.frame.size.height+lblFrameSizeFactor);
            lbl2.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl2.userInteractionEnabled = YES;
            [lbl2 sizeToFit];
            lbl2.frame = CGRectMake(lbl2.frame.origin.x, lbl2.frame.origin.y, lbl2.frame.size.width+lblFrameSizeFactor, lbl2.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl2];
            
            /* --------------------- Label 3 iphone 5 --------------------- */
            UILabel * lbl3 = [[UILabel alloc] initWithFrame:CGRectMake(231, 426, 69, 36)];
            lbl3.text = tempArray[2];
            lbl3.font = lbl1.font;
            lbl3.textColor = lbl1.textColor;
            lbl3.textAlignment = lbl1.textAlignment;
            lbl3.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl3.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl3.frame = CGRectMake(lbl3.frame.origin.x, lbl3.frame.origin.y, lbl3.frame.size.width+lblFrameSizeFactor, lbl3.frame.size.height+lblFrameSizeFactor);
            lbl3.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl3.userInteractionEnabled = YES;
            [lbl3 sizeToFit];
            lbl3.frame = CGRectMake(lbl3.frame.origin.x, lbl3.frame.origin.y, lbl3.frame.size.width+lblFrameSizeFactor, lbl3.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl3];
            
            /* --------------------- Label 4 iphone 5 --------------------- */
            UILabel * lbl4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 475, 69, 36)];
            lbl4.text = tempArray[3];
            lbl4.font = lbl1.font;
            lbl4.textColor = lbl1.textColor;
            lbl4.textAlignment = lbl1.textAlignment;
            lbl4.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl4.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl4.frame = CGRectMake(lbl4.frame.origin.x, lbl4.frame.origin.y, lbl4.frame.size.width+lblFrameSizeFactor, lbl4.frame.size.height+lblFrameSizeFactor);
            lbl4.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl4.userInteractionEnabled = YES;
            [lbl4 sizeToFit];
            lbl4.frame = CGRectMake(lbl4.frame.origin.x, lbl4.frame.origin.y, lbl4.frame.size.width+lblFrameSizeFactor, lbl4.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl4];
            
            /* --------------------- Label 5 iphone 5 --------------------- */
            UILabel * lbl5 = [[UILabel alloc] initWithFrame:CGRectMake(125, 475, 69, 36)];
            lbl5.text = tempArray[4];
            lbl5.font = lbl1.font;
            lbl5.textColor = lbl1.textColor;
            lbl5.textAlignment = lbl1.textAlignment;
            lbl5.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl5.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl5.frame = CGRectMake(lbl5.frame.origin.x, lbl5.frame.origin.y, lbl5.frame.size.width+lblFrameSizeFactor, lbl5.frame.size.height+lblFrameSizeFactor);
            lbl5.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl5.userInteractionEnabled = YES;
            [lbl5 sizeToFit];
            lbl5.frame = CGRectMake(lbl5.frame.origin.x, lbl5.frame.origin.y, lbl5.frame.size.width+lblFrameSizeFactor, lbl5.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl5];
            
            /* --------------------- Label 6 iphone 5 --------------------- */
            UILabel * lbl6 = [[UILabel alloc] initWithFrame:CGRectMake(231, 475, 69, 36)];
            lbl6.text = tempArray[5];
            lbl6.font = lbl1.font;
            lbl6.textColor = lbl1.textColor;
            lbl6.textAlignment = lbl1.textAlignment;
            lbl6.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            lbl6.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            lbl6.frame = CGRectMake(lbl6.frame.origin.x, lbl6.frame.origin.y, lbl6.frame.size.width+lblFrameSizeFactor, lbl6.frame.size.height+lblFrameSizeFactor);
            lbl6.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.8 alpha:1];
            lbl6.userInteractionEnabled = YES;
            [lbl6 sizeToFit];
            lbl6.frame = CGRectMake(lbl6.frame.origin.x, lbl6.frame.origin.y, lbl6.frame.size.width+lblFrameSizeFactor, lbl6.frame.size.height+lblFrameSizeFactor);
            [self.view addSubview:lbl6];
        }
        
        pincher = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinched:)];
        pincher.cancelsTouchesInView = YES;

        [self.view addGestureRecognizer:pincher];
    }
}

#pragma mark UI Button Methods
// Recognize edilen buttona göre buttonu highlight eden method.
- (void) tapperAction: (UIGestureRecognizer *) recognizer
{
    if (recognizer.view == btnAddWord)
    {
        btnAddWord.highlighted = YES;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tapperOneTapAdd) userInfo:nil repeats:NO];
    }
    if (recognizer.view == btnRemoveWord)
    {
        btnRemoveWord.highlighted = YES;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tapperOneTapRemove) userInfo:nil repeats:NO];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.title isEqualToString:@"Uyarı"])
    {
        switch (buttonIndex) {
            case 0:
            {
                for (UILabel * lbl in self.view.subviews)
                {
                    if ([lbl isKindOfClass:[UILabel class]])
                    {
                        [lbl removeFromSuperview];
                    }
                }
            }
            break;
            case 1:
            {
                [alertView dismissWithClickedButtonIndex:1 animated:YES];
            }
            break;
                
            default:
                break;
        }
    }
}

- (void) tapperOneTapAdd
{
    btnAddWord.highlighted = NO;
    [self clear];
    [self labellariDiz];
}

- (void) tapperOneTapRemove
{
    btnRemoveWord.highlighted = NO;
    [self clear];
}

- (void) doubleTapperAction: (UIGestureRecognizer *) recognizer
{
    if (recognizer.view == btnAddWord)
    {
        [self performSegueWithIdentifier:@"kelimeEklettir" sender:self];
    }
    if (recognizer.view == btnRemoveWord)
    {
        
        UIAlertView * alertClearing= [[UIAlertView alloc] initWithTitle:@"Uyarı" message:@"Tüm kelimeler silinecek. Emin misiniz?" delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:@"İptal", nil];
        [alertClearing show];
    }
}


- (IBAction)btnArkaPlanClick:(UIButton *)sender
{
    NSLog(@"BtnArkaPlan tıklandı.");
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePicker animated:YES completion:^{
            
        }];
    }
}

- (IBAction)btnMenuClicked:(UIButton *)sender
{
    UIActionSheet * eksin = [[UIActionSheet alloc] initWithTitle:@"Menü" delegate:self cancelButtonTitle:@"İptal" destructiveButtonTitle:nil otherButtonTitles:@"Kaydet", @"Paylaş", @"Ana Menü", nil];
    eksin.tag = 0;
    [eksin showFromRect:btnMenu.frame inView:self.view animated:YES];
}

- (IBAction)btnFontClicked:(id)sender
{
    fontPicker = [[FontPicker alloc]init];
    if ([UIScreen mainScreen].bounds.size.height == 480)
    {
        fontPicker.frame = CGRectMake(self.view.frame.origin.x, 225, self.view.frame.size.width, 216);
    }
    else if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        fontPicker.frame = CGRectMake(self.view.frame.origin.x, 320, self.view.frame.size.width, 216);
    }
    fontPicker.delegate = self;
    fontPicker.showsSelectionIndicator = YES;
    fontPicker.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view addSubview:fontPicker];
        fontPicker.alpha = 1.0f;
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark PickerView Delegate Methpds

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    NSArray * fontsArray = [FontPicker fontAilesiUret];
    NSMutableArray * sortedFontArray = [NSMutableArray array];
    for (NSString * s in fontsArray)
    {
        UILabel * fontLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, pickerView.frame.size.width, pickerView.frame.size.height - 20)];
        fontLabel.text = s;
        fontLabel.font = [UIFont fontWithName:s size:16];
        fontLabel.backgroundColor = [UIColor colorWithRed:0.2 green:0.4 blue:1.0 alpha:0.2];
        fontLabel.textColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.5 alpha:1.0];
        [sortedFontArray addObject:fontLabel];
    }
    
    return [sortedFontArray objectAtIndex:row];
}

#pragma mark ActionSheet Delegate - Save Image methods
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([actionSheet.title isEqualToString:@"Menü"])
    {
        switch (buttonIndex) {
            case 0:             // Kaydet
            {
                // show Save Image actionsheet
                UIActionSheet * kaydetEksin = [[UIActionSheet alloc] initWithTitle:@"Kaydet" delegate:self cancelButtonTitle:@"İptal" destructiveButtonTitle:nil otherButtonTitles:@"Görsel Kaydet", @"Şiir Kaydet", nil];
                [kaydetEksin showFromRect:btnMenu.frame inView:self.view animated:YES];
            }
                break;
            case 1:             // Paylaş
            {
                
            }
                break;
            case 2:             // Ana Menü
            {
                
            }
                break;
                
            default:
                break;
        }
    }
    else if ([actionSheet.title isEqualToString:@"Kaydet"])
    {
        switch (buttonIndex) {
            case 0:             // Görsel Kaydet
            {
                UIImage * imaj = [self saveImage];
                UIImageWriteToSavedPhotosAlbum(imaj, nil, nil, nil);
                UIAlertView * alarmaKaydedildi = [[UIAlertView alloc] initWithTitle:@"Resim kaydedildi!" message:@"Resim fotoğraf albümünüze kaydedildi." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Tamam", nil];
                [alarmaKaydedildi show];
            }
                break;
            case 1:             // Şiir Kaydet
            {
                NSLog(@"Şiir Kaydet Tıklandı");
                SavePoetryView * sv = [[SavePoetryView alloc] initWithFrame:CGRectMake(35, 100, 250, 100)];
                sv.backgroundColor = [UIColor grayColor];
                sv.alpha = 0;
                [self.view insertSubview:sv aboveSubview:self.view.subviews.lastObject];
                [UIView animateWithDuration:0.5 animations:^{
                    sv.alpha = 1.0;
                } completion:^(BOOL finished) {
                    
                }];
            }
                break;
                
            default:
                break;
        }
    }
}

- (UIImage *)saveImage
{
    btnAddWord.hidden = YES;
    btnRemoveWord.hidden = YES;
    sublayer.hidden = YES;
    for (UIButton * btn in self.view.subviews)
    {
        if ([btn isKindOfClass:[UIButton class]])
        {
            btn.hidden = YES;
        }
    }
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    {
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, [UIScreen mainScreen].scale);
    }
    else
    {
        UIGraphicsBeginImageContext(self.view.bounds.size);
    }
    
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    btnAddWord.hidden = NO;
    btnRemoveWord.hidden = NO;
    sublayer.hidden = NO;
    for (UIButton * btn in self.view.subviews)
    {
        if ([btn isKindOfClass:[UIButton class]])
        {
            btn.hidden = NO;
        }
    }
    return image;
}

#pragma mark Checking connection to Internet

- (BOOL) connectedToInternet
{
    NSString * stringo =  [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"] encoding:NSASCIIStringEncoding error:nil];
    return ( stringo != NULL ) ? YES : NO;
}

#pragma mark Touch Methods

- (void) pinched: (UIPinchGestureRecognizer *) recognizer
{
    id sonObje = self.view.subviews.lastObject;
    if ([sonObje isKindOfClass:[UILabel class]])
    {
        UILabel * lbl = self.view.subviews.lastObject;
        if (recognizer.state == UIGestureRecognizerStateChanged)
        {
            UIFont * fontAilesi = lbl.font;
            int fontSize = lbl.font.pointSize;
            CGPoint actualCenter = lbl.center;
            CGFloat pinchScale = recognizer.scale;
            pinchScale = round(pinchScale * 1000) / 1000.0;
            if(pinchScale > 1.0)
            {
                fontSize += pinchScale * 2.0;
            }
            else
            {
                fontSize -= pinchScale * 2.0;
            }
            if (fontSize > 90) {
                fontSize = 90; return;
            }
            if (fontSize < 15) {
                fontSize = 15; return;
            }
            lbl.font = [UIFont fontWithName:fontAilesi.fontName size:fontSize];
            [lbl sizeToFit];
            lbl.frame = CGRectMake(lbl.frame.origin.x, lbl.frame.origin.y, lbl.frame.size.width+15, lbl.frame.size.height+10);
            lbl.center = actualCenter;
            [sublayer removeFromSuperlayer];
            
        }
        if (recognizer.state == UIGestureRecognizerStateEnded)
        {
            [sublayer removeFromSuperlayer];
            [self borderEkle:lbl];
        }
    }
    else
    {
        NSMutableArray * labelArray = [NSMutableArray array];
        for (UILabel * lbl in self.view.subviews)
        {
            if ([lbl isKindOfClass:[UILabel class]])
            {
                [labelArray addObject:lbl];
            }
        }
        [self.view insertSubview:labelArray.lastObject aboveSubview:self.view.subviews.lastObject];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint touchPosition = [touch locationInView:self.view];
    for (UILabel * lbl in self.view.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            if (touch.view == lbl)
            {
                [sublayer removeFromSuperlayer];
                [self.view insertSubview:lbl aboveSubview:self.view.subviews.lastObject];
                if (self.view.subviews.lastObject == lbl)
                {
                    [self borderEkle:lbl];
                }
            }
        }
    }
    for (UIPickerView * pickerView in self.view.subviews)
    {
        if ([pickerView isKindOfClass:[UIPickerView class]])
        {
            if (!CGRectContainsPoint(pickerView.frame, touchPosition))
            {
                [UIView animateWithDuration:0.5 animations:^{
                    pickerView.alpha = 0;
                } completion:^(BOOL finished) {
                    [pickerView removeFromSuperview];
                }];
            }
        }
    }
    for (SavePoetryView * spv in self.view.subviews)
    {
        if ([spv isKindOfClass:[SavePoetryView class]])
        {
            if (!CGRectContainsPoint(spv.frame, touchPosition))
            {
                [UIView animateWithDuration:0.5 animations:^{
                    spv.alpha = 0;
                } completion:^(BOOL finished) {
                    [spv removeFromSuperview];
                }];
            }
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    for (UILabel * lbl in self.view.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            if (touch.view == lbl)
            {
                lbl.center = [touch locationInView:self.view];
            }
        }
    }
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    for (UILabel * lbl in self.view.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            if (touch.view == lbl)
            {
                
            }
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    for (UILabel * lbl in self.view.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            if (touch.view == lbl)
            {
                lbl.center = [touch locationInView:self.view];
            }
        }
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"renkDegistir"])
    {
        RenklerViewController * rvc = segue.destinationViewController;
        UILabel * ornekLabel = self.view.subviews.lastObject;
        if ([ornekLabel isKindOfClass:[UILabel class]])
        {
            rvc.lblBackgroundRengi = ornekLabel.backgroundColor;
            rvc.lblTextRengi = ornekLabel.textColor;
            rvc.lblFont = ornekLabel.font;
            rvc.lblString = ornekLabel.text;
        }
        else
        {
            NSLog(@"değil");
        }
    }
}

#pragma mark Label font, color etc manipulation methods

// Tüm labelları silen method
- (void) clear
{
    if ([UIScreen mainScreen].bounds.size.height == 480)
    {
        // iPhone 4 ekranı clear kodu
        CGRect silinecekAlan = CGRectMake(0, 346, 320, 135);
        for (UILabel * lbl in self.view.subviews)
        {
            if ([lbl isKindOfClass:[UILabel class]])
            {
                if (CGRectContainsRect(silinecekAlan, lbl.frame) || CGRectContainsPoint(silinecekAlan, lbl.center))
                {
                    [lbl removeFromSuperview];
                }
            }
        }
    }
    else if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        // iPhone 5 ekranı clear kodu
        CGRect silinecekAlan = CGRectMake(0, 434, 320, 135);
        for (UILabel * lbl in self.view.subviews)
        {
            if ([lbl isKindOfClass:[UILabel class]])
            {
                if (CGRectContainsRect(silinecekAlan, lbl.frame) || CGRectContainsPoint(silinecekAlan, lbl.center))
                {
                    [lbl removeFromSuperview];
                }
            }
        }
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    UILabel * label = (UILabel *)[pickerView viewForRow:row forComponent:component];
    for (UILabel * lbl in self.view.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            lbl.font = [UIFont fontWithName:label.text size:lbl.font.pointSize];
            [lbl sizeToFit];
            lbl.frame = CGRectMake(lbl.frame.origin.x, lbl.frame.origin.y, lbl.frame.size.width +lblFrameSizeFactor, lbl.frame.size.height +lblFrameSizeFactor);
            currentFont = lbl.font;
            [sublayer removeFromSuperlayer];
            [self borderEkle:lbl];
        }
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        bgImaj.image = image;
    }];
}

-(void)arkaPlanRengi:(UIColor *)arkaPlanRengi yaziRengi:(UIColor *)yaziRengi
{
    UILabel * lbl = self.view.subviews.lastObject;
    if([lbl isKindOfClass:[UILabel class]])
    {
        lbl.backgroundColor = arkaPlanRengi;
        lbl.textColor = yaziRengi;
    }
}

- (void) renkNotificationHandler: (NSNotification *)notifikasyon
{
    RenklerViewController * rvc = [notifikasyon object];
    rvc.delegate = self;
}

- (void) borderEkle: (UILabel *)label
{
    sublayer = [CALayer layer];
    sublayer.backgroundColor = [UIColor clearColor].CGColor;
    sublayer.frame = CGRectMake(label.bounds.origin.x, label.bounds.origin.y, label.bounds.size.width, label.bounds.size.height);
    sublayer.borderColor = [UIColor blackColor].CGColor;
    if (label.frame.size.width <= 100)
    {
        sublayer.borderWidth = 2.0;
    }
    else if (label.frame.size.width > 75)
    {
        sublayer.borderWidth = 3.0;
    }
    else if (label.frame.size.width <= 30)
    {
        sublayer.borderWidth = 1.0;
    }
    [label.layer addSublayer:sublayer];
}



@end
