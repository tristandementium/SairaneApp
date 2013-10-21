//
//  Wording.m
//  Sairane
//
//  Created by selcuk.cigir on 8/28/13.
//  Copyright (c) 2013 selcuk.cigir. All rights reserved.
//

#import "Wording.h"

@implementation Wording

- (NSArray *)sozDizisi
{
    if (!_sozDizisi) {
        _sozDizisi = [[NSArray alloc] initWithObjects:@"soz1", @"soz2", @"soz3", @"soz4", @"soz5", @"soz6", nil];
    }
    return _sozDizisi;
}

-(NSString *)sozDondur
{
    NSString * soz = [self.sozDizisi objectAtIndex:arc4random()% self.sozDizisi.count];
    return soz;
}

@end
