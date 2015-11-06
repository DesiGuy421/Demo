//
//  NSManagedObjectContext+AFGAdditions.m
//  WUSample
//
//  Created by Aqeel Gunja on 12/22/14.
//
//

#import "NSManagedObjectContext+QLIAdditions.h"

@implementation NSManagedObjectContext (WMLAdditions)

- (NSDictionary *)wml_dictionaryOfExistingObjectsOfEntity:(NSEntityDescription *)entityDescription mappedToIdentifierKey:(NSString *)identifierKey
{
    NSError *fetchError = nil;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[entityDescription name]];
    NSArray *existingCategories = [self executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError) {
        NSLog(@"Error fetching objects: %@", fetchError);
    }
    NSArray *identifiers = [existingCategories valueForKey:identifierKey];
    NSDictionary *existingCategoryDictionary = [NSDictionary dictionaryWithObjects:existingCategories forKeys:identifiers];
    return existingCategoryDictionary;
}

@end
