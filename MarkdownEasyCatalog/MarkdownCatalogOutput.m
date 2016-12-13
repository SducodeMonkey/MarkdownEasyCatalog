//
//  MarkdownCatalogOutput.m
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkdownCatalogOutput.h"
#import "MarkdownCatalogItem.h"

@implementation MarkdownCatalogOutput

+ (NSString *)output:(MarkdownCatalogList *)list {
    if (!list) {
        return nil;
    }
    [list clearIndex];
    MarkdownCatalogItem *item;
    NSString *prefix = @"- ";
    NSString *space = @"  ";
    NSMutableString *output = [NSMutableString string];
    int minLevel = [list getMinLevel];
    while ((item = [list getNextItem])) {
        NSMutableString *thisCatalog = [NSMutableString string];
        int spaceCount = item.catalogLevel - minLevel;
        while ((--spaceCount) >= 0) {
            [thisCatalog appendString:space];
        }
        NSLog(@"This catalog is: %@%@[%@](%@)", thisCatalog, prefix, item.catalogContent, item.catalogLink);
        [output appendFormat:@"%@%@[%@](%@)\n", thisCatalog, prefix, item.catalogContent, item.catalogLink];
    }
    NSLog(@"Output is: \n %@", output);
    return output;
}

@end
