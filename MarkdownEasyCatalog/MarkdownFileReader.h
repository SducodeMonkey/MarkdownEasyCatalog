//
//  MarkdownFileReader.h
//  MarkdownEasyCatalog
//
//  Created by junmo on 16/12/12.
//  Copyright © 2016年 junmo. All rights reserved.
//

#ifndef MarkdownFileReader_h
#define MarkdownFileReader_h

#import "MarkdownCatalogList.h"

@interface MarkdownFileReader : NSObject

- (MarkdownCatalogList *)readFile;
- (void)writeFile:(NSString *)output;
@end

#endif /* MarkdownFileReader_h */
