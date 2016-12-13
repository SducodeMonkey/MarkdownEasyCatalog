//
//  MarkdownCatalogItem.m
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkdownCatalogItem.h"

@implementation MarkdownCatalogItem

- (instancetype)init {
    if (self = [super init]) {
        self.catalogLevel = 0;
        self.catalogContent = nil;
        self.catalogLink = nil;
    }
    return self;
}

- (void)description {
    NSLog(@"MarkdownCatalogItem: [%d] - [%@] - [%@].", self.catalogLevel, self.catalogContent, self.catalogLink);
}

@end
