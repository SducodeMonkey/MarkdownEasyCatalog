//
//  MarkdownCatalogOutput.h
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#ifndef MarkdownCatalogOutput_h
#define MarkdownCatalogOutput_h
#import "MarkdownCatalogList.h"

@interface MarkdownCatalogOutput : NSObject

+ (NSString *)output:(MarkdownCatalogList *)list;

@end

#endif /* MarkdownCatalogOutput_h */
