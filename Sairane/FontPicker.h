//
//  FontPicker.h
//  Sairane
//
//  Created by selcuk.cigir on 9/6/13.
//  Copyright (c) 2013 selcuk.cigir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FontPicker : UIPickerView <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray * fontsArray;

+ (NSArray *) fontAilesiUret;

@end
