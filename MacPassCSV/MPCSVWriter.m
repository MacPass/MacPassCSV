//
//  MPCSVWriter.m
//  MacPassCSV
//
//  Created by Michael Starke on 26.08.19.
//  Copyright © 2019 HicknHack Software GmbH. All rights reserved.
//

#import "MPCSVWriter.h"

@interface MPCSVWriter ()

@property (copy) NSString *separator;
@property (strong) NSMutableArray <NSArray <NSString *>*>*rows;
@property (copy) NSArray *columns;

@end

@implementation MPCSVWriter

- (instancetype)init {
  self = [self initWithColumnNames:@[]];
  return self;
}

- (instancetype)initWithColumnNames:(NSArray<NSString *> *)names {
  self = [super init];
  if(self) {
    self.columns = names;
    self.separator = @",";
    self.rows = [[NSMutableArray alloc] init];
  }
  return self;
}

- (BOOL)addRow:(NSArray<NSString *> *)row {
  if(row.count != self.columns.count) {
    return NO;
  }
  
  NSMutableArray *cleanRow = [[NSMutableArray alloc] init];
  for(NSString *value in row) {
    NSString *formatted = [self _formatValue:value];
    [cleanRow addObject:formatted];
  }
  [self.rows addObject:[cleanRow copy]];
  return YES;
}

- (BOOL)writeToURL:(NSURL *)url error:(NSError * _Nullable __autoreleasing *)error {
  NSMutableData *outData = [[NSMutableData alloc] init];
  
  // header
  NSMutableArray *columnNames = [[NSMutableArray alloc] init];
  for(NSString *columnName in self.columns) {
    [columnNames addObject:[self _formatValue:columnName]];
  }
  [outData appendData:[[columnNames componentsJoinedByString:self.separator] dataUsingEncoding:NSUTF8StringEncoding]];
  
  // content
  for(NSArray<NSString *>* row in self.rows) {
    // newline
    [outData appendData:[@"\n" dataUsingEncoding:NSUTF8StringEncoding]];
    // data
    [outData appendData:[[row componentsJoinedByString:self.separator] dataUsingEncoding:NSUTF8StringEncoding]];
    isFirst = NO;
  }
  return [outData writeToURL:url options:0 error:error];
}

- (NSString *)_formatValue:(NSString *)value {
  BOOL addQuotes = NO;
  NSMutableString *mutableValue = value.mutableCopy;
  NSRange quoteRange = [mutableValue rangeOfString:@"\""];
  if(quoteRange.location != NSNotFound) {
    addQuotes = YES;
    [mutableValue replaceOccurrencesOfString:@"\"" withString:@"\"\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, value.length)];
  }
  NSRange seperatorRange = [mutableValue rangeOfString:self.separator options:NSCaseInsensitiveSearch];
  if(seperatorRange.location != NSNotFound) {
    addQuotes = YES;
  }
  return addQuotes ? [NSString stringWithFormat:@"\"%@\"", mutableValue] : [mutableValue copy];
}

@end
