//
//  SavePoetryView.m
//  Sairane
//
//  Created by selcuk.cigir on 9/20/13.
//  Copyright (c) 2013 selcuk.cigir. All rights reserved.
//

#import "SavePoetryView.h"

@implementation SavePoetryView
@synthesize txtSaveName, btnSave;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // border radius
        [self.layer setCornerRadius:12.0f];
        
        // border
        [self.layer setBorderColor:[UIColor lightGrayColor].CGColor];
        [self.layer setBorderWidth:0.1f];
        
        // drop shadow
        [self.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.layer setShadowOpacity:0.8];
        [self.layer setShadowRadius:3.0];
        [self.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
        txtSaveName = [[UITextField alloc] initWithFrame:CGRectMake(self.frame.origin.x - 20, self.frame.origin.y - 85, self.frame.size.width - 30, self.frame.size.height - 70)];
        txtSaveName.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:txtSaveName];
        
        btnSave = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btnSave setTitle:@"Kaydet" forState:UIControlStateNormal];
        btnSave.frame = CGRectMake(self.frame.origin.x - 20, self.frame.origin.y - 35, self.frame.size.width - 30, self.frame.size.height - 70);
        btnSave.tintColor = [UIColor whiteColor];
        [btnSave addTarget:self action:@selector(btnSaveClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnSave];
    }
    return self;
}

- (void) btnSaveClicked: (id)sender
{
    NSLog(@"btnSave tıklandı");
}



@end
