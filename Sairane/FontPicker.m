//
//  FontPicker.m
//  Sairane
//
//  Created by selcuk.cigir on 9/6/13.
//  Copyright (c) 2013 selcuk.cigir. All rights reserved.
//

#import "FontPicker.h"

@implementation FontPicker

@synthesize fontsArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.dataSource = self;
    }
    return self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [FontPicker fontAilesiUret].count;
}

+ (NSArray *)fontAilesiUret
{
    NSArray * returningArray = [NSArray arrayWithObjects:@"AmericanTypewriter",
                                @"AmericanTypewriter-Bold",
                                @"AppleGothic",
                                @"Arial-BoldItalicMT",
                                @"Arial-BoldMT",
                                @"Arial-ItalicMT",
                                @"ArialMT",
                                @"ArialHebrew",
                                @"ArialHebrew-Bold",
                                @"ArialRoundedMTBold",
                                @"BanglaSangamMN",
                                @"BanglaSangamMN-Bold",
                                @"Baskerville",
                                @"Baskerville-Bold",
                                @"Baskerville-BoldItalic",
                                @"Baskerville-Italic",
                                @"Cochin",
                                @"Cochin-Bold",
                                @"Cochin-BoldItalic",
                                @"Cochin-Italic",
                                @"Courier",
                                @"Courier-Bold",
                                @"Courier-BoldOblique",
                                @"Courier-Oblique",
                                @"CourierNewPS-BoldItalicMT",
                                @"CourierNewPS-BoldMT",
                                @"CourierNewPS-ItalicMT",
                                @"CourierNewPSMT",
                                @"DBLCDTempBlack",
                                @"DevanagariSangamMN",
                                @"DevanagariSangamMN-Bold",
                                @"Futura-CondensedExtraBold",
                                @"Futura-Medium",
                                @"Futura-MediumItalic",
                                @"GeezaPro",
                                @"GeezaPro-Bold",
                                @"Georgia",
                                @"Georgia-Bold",
                                @"Georgia-BoldItalic",
                                @"Georgia-Italic",
                                @"GujaratiSangamMN",
                                @"GujaratiSangamMN-Bold",
                                @"GurmukhiMN",
                                @"GurmukhiMN-Bold",
                                @"STHeitiJ-Light",
                                @"STHeitiJ-Medium",
                                @"STHeitiK-Light",
                                @"STHeitiK-Medium",
                                @"STHeitiSC-Light",
                                @"STHeitiSC-Medium",
                                @"STHeitiTC-Light",
                                @"STHeitiTC-Medium",
                                @"Helvetica",
                                @"Helvetica-Bold",
                                @"Helvetica-BoldOblique",
                                @"Helvetica-Oblique",
                                @"HelveticaNeue",
                                @"HelveticaNeue-Bold",
                                @"HiraKakuProN-W3",
                                @"HiraKakuProN-W6",
                                @"KannadaSangamMN",
                                @"KannadaSangamMN-Bold",
                                @"MalayalamSangamMN",
                                @"MalayalamSangamMN-Bold",
                                @"MarkerFelt-Thin",
                                @"MarkerFelt-Wide",
                                @"OriyaSangamMN",
                                @"OriyaSangamMN-Bold",
                                @"Palatino-Bold",
                                @"Palatino-BoldItalic",
                                @"Palatino-Italic",
                                @"Palatino-Roman",
                                @"SinhalaSangamMN",
                                @"SinhalaSangamMN-Bold",
                                @"TamilSangamMN",
                                @"TamilSangamMN-Bold",
                                @"TeluguSangamMN",
                                @"TeluguSangamMN-Bold",
                                @"Thonburi",
                                @"Thonburi-Bold",
                                @"TimesNewRomanPS-BoldItalicMT",
                                @"TimesNewRomanPS-BoldMT",
                                @"TimesNewRomanPS-ItalicMT",
                                @"TimesNewRomanPSMT",
                                @"Trebuchet-BoldItalic",
                                @"TrebuchetMS",
                                @"TrebuchetMS-Bold",
                                @"TrebuchetMS-Italic",
                                @"Verdana",
                                @"Verdana-Bold",
                                @"Verdana-BoldItalic",
                                @"Verdana-Italic",
                                @"Zapfino", nil];
    return returningArray;
}

@end
