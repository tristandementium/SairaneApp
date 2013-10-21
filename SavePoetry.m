//
//  SavePoetry.m
//  Sairane
//
//  Created by selcuk.cigir on 9/20/13.
//  Copyright (c) 2013 selcuk.cigir. All rights reserved.
//

#import "SavePoetry.h"

@implementation SavePoetry
@synthesize saveName, saveArray;

-(id)initWithSaveName: (NSString *)name saveArray: (NSMutableArray *)array
{
    self = [super init];
    if (self) {
        name = saveName;
        array = saveArray;
    }
    return self;
}

- (void) savePoetry
{
    if (saveName && ![saveName isEqualToString:@" "])
    {
        NSMutableData * mutuData = [[NSMutableData alloc] init];
        NSKeyedArchiver * archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mutuData];
        [archiver encodeObject:saveArray forKey:saveName];
        [archiver finishEncoding];
        NSString * baseFilename = [saveName stringByAppendingString:@".txt" ];
        BOOL success = [mutuData writeToFile:[self getFilePath:baseFilename] atomically:YES];
        if (success)
        {
            NSLog(@"%@ arşivi yazıldı", saveName);
            NSString * mesaj = [NSString stringWithFormat:@"Şiir %@ adıyla kaydedildi.", saveName];
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Uyarı" message:mesaj delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
            [alert show];
        }
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Uyarı" message:@"Kayıt adını boş geçemezsiniz!" delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (NSArray *) loadPoetry
{
    NSString * baseFilename = [saveName stringByAppendingString:@".txt" ];
    NSData * readData = [[NSData alloc] initWithContentsOfFile:[self getFilePath:baseFilename]];
    NSKeyedUnarchiver * unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:readData];
    NSArray * loadedArray = [unarchiver decodeObjectForKey:saveName];
    NSLog(@"loaded array is: %@", loadedArray);
    return loadedArray;

}

- (NSString *)getFilePath: (NSString *)file
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentsDirectory = [paths objectAtIndex:0];
    NSString * filePath = [documentsDirectory stringByAppendingPathComponent:file];
    return filePath;
}

@end
