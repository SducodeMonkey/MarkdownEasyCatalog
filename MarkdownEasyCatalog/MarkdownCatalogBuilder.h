//
//  MarkdownCatalogBuilder.h
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#ifndef MarkdownCatalogBuilder_h
#define MarkdownCatalogBuilder_h

#import "MarkdownCatalogList.h"

@interface MarkdownCatalogBuilder : NSObject

+ (void)scanCatalogList:(MarkdownCatalogList *)list;

@end

#endif /* MarkdownCatalogBuilder_h */
