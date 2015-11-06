//
//  NSManagedObjectContext+AFGAdditions.h
//  WUSample
//
//  Created by Aqeel Gunja on 12/22/14.
//
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (WMLAdditions)

// identifierKey must be a uniquely identifiable attribute on an Entity.
- (NSDictionary *)wml_dictionaryOfExistingObjectsOfEntity:(NSEntityDescription *)entityDescription mappedToIdentifierKey:(NSString *)identifierKey;

@end
