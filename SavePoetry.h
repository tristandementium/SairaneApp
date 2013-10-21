//
//  SavePoetry.h
//  Sairane
//
//  Created by selcuk.cigir on 9/20/13.
//  Copyright (c) 2013 selcuk.cigir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavePoetry : NSObject

@property (nonatomic, strong) NSString * saveName;
@property (nonatomic, strong) NSMutableArray * saveArray;

- (id)initWithSaveName: (NSString *)name saveArray: (NSMutableArray *)array;
- (void) savePoetry;
- (NSArray *) loadPoetry;

@end
