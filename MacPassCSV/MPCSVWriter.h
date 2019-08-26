//
//  MPCSVWriter.h
//  MacPassCSV
//
//  Created by Michael Starke on 26.08.19.
//  Copyright © 2019 HicknHack Software GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MPCSVWriter : NSObject

- (instancetype)initWithColumnNames:(NSArray <NSString *>*)names NS_DESIGNATED_INITIALIZER;

- (BOOL)addRow:(NSArray <NSString *>*)row;
- (BOOL)writeToURL:(NSURL *)url error:(NSError * __autoreleasing *)error;

@end

NS_ASSUME_NONNULL_END
