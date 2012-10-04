//
//  Collections+KeyPath.m

/***********************************************************************************
 *
 * Copyright (c) 2012 Thomas Dupont
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NON INFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 ***********************************************************************************/

#import "Collections+KeyPath.h"

@implementation NSSet (KeyPath)

- (id)minObjectForKeyPath:(NSString*)path
{
	id minValue = nil;
	id minObj = nil;
	
	for (id obj in self)
	{
		if (!minObj)
		{
			minValue = [obj valueForKeyPath:path];
			minObj = obj;
		}
		else
		{
			id objValue = [obj valueForKeyPath:path];
			NSComparisonResult result = [minValue compare:objValue];
			if (result == NSOrderedDescending)
			{
				minValue = objValue;
				minObj = obj;
			}
		}
	}
	
	return minObj;
}

- (id)maxObjectForKeyPath:(NSString*)path
{
	id maxValue = nil;
	id maxObj = nil;
	
	for (id obj in self)
	{
		if (!maxObj)
		{
			maxValue = [obj valueForKeyPath:path];
			maxObj = obj;
		}
		else
		{
			id objValue = [obj valueForKeyPath:path];
			NSComparisonResult result = [maxValue compare:objValue];
			if (result == NSOrderedAscending)
			{
				maxValue = objValue;
				maxObj = obj;
			}
		}
	}
	
	return maxObj;
}

@end

@implementation NSArray (KeyPath)

- (id)minObjectForKeyPath:(NSString*)path
{
	id minValue = nil;
	id minObj = nil;
	
	for (id obj in self)
	{
		if (!minObj)
		{
			minValue = [obj valueForKeyPath:path];
			minObj = obj;
		}
		else
		{
			id objValue = [obj valueForKeyPath:path];
			NSComparisonResult result = [minValue compare:objValue];
			if (result == NSOrderedDescending)
			{
				minValue = objValue;
				minObj = obj;
			}
		}
	}
	
	return minObj;
}

- (id)maxObjectForKeyPath:(NSString*)path
{
	id maxValue = nil;
	id maxObj = nil;
	
	for (id obj in self)
	{
		if (!maxObj)
		{
			maxValue = [obj valueForKeyPath:path];
			maxObj = obj;
		}
		else
		{
			id objValue = [obj valueForKeyPath:path];
			NSComparisonResult result = [maxValue compare:objValue];
			if (result == NSOrderedAscending)
			{
				maxValue = objValue;
				maxObj = obj;
			}
		}
	}
	
	return maxObj;
}

- (int)indexOfMinObjectForKeyPath:(NSString*)path
{
	__block id minValue = nil;
	__block int minIndex = NSNotFound;
	
	[self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		
		if (minIndex == NSNotFound)
		{
			minValue = [obj valueForKeyPath:path];
			minIndex = idx;
		}
		else
		{
			id objValue = [obj valueForKeyPath:path];
			NSComparisonResult result = [minValue compare:objValue];
			if (result == NSOrderedDescending)
			{
				minValue = objValue;
				minIndex = idx;
			}
		}
	}];
	
	return minIndex;
}

- (int)indexOfMaxObjectForKeyPath:(NSString*)path
{
	__block id maxValue = nil;
	__block int maxIndex = NSNotFound;
	
	[self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		
		if (maxIndex == NSNotFound)
		{
			maxValue = [obj valueForKeyPath:path];
			maxIndex = idx;
		}
		else
		{
			id objValue = [obj valueForKeyPath:path];
			NSComparisonResult result = [maxValue compare:objValue];
			if (result == NSOrderedAscending)
			{
				maxValue = objValue;
				maxIndex = idx;
			}
		}
	}];
	
	return maxIndex;
}

@end

@implementation NSDictionary (KeyPath)

- (id)minObjectForKeyPath:(NSString*)path
{
	__block id minValue = nil;
	__block id minObj = nil;
	
	[self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		
		if (!minObj)
		{
			minValue = [obj valueForKeyPath:path];
			minObj = obj;
		}
		else
		{
			id objValue = [obj valueForKeyPath:path];
			NSComparisonResult result = [minValue compare:objValue];
			if (result == NSOrderedDescending)
			{
				minValue = objValue;
				minObj = obj;
			}
		}
		
	}];
	
	return minObj;
}

- (id)maxObjectForKeyPath:(NSString*)path
{
	__block id maxValue = nil;
	__block id maxObj = nil;
	
	[self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		
		if (!maxObj)
		{
			maxValue = [obj valueForKeyPath:path];
			maxObj = obj;
		}
		else
		{
			id objValue = [obj valueForKeyPath:path];
			NSComparisonResult result = [maxValue compare:objValue];
			if (result == NSOrderedAscending)
			{
				maxValue = objValue;
				maxObj = obj;
			}
		}
		
	}];
	
	return maxObj;
}

- (id)keyForMinObjectForKeyPath:(NSString*)path
{
	__block id minValue = nil;
	__block id minKey = nil;
	
	[self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		
		if (!minKey)
		{
			minValue = [obj valueForKeyPath:path];
			minKey = key;
		}
		else
		{
			id objValue = [obj valueForKeyPath:path];
			NSComparisonResult result = [minValue compare:objValue];
			if (result == NSOrderedDescending)
			{
				minValue = objValue;
				minKey = key;
			}
		}
		
	}];
	
	return minKey;
}

- (id)keyForMaxObjectForKeyPath:(NSString*)path
{
	__block id maxValue = nil;
	__block id maxKey = nil;
	
	[self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		
		if (!maxKey)
		{
			maxValue = [obj valueForKeyPath:path];
			maxKey = key;
		}
		else
		{
			id objValue = [obj valueForKeyPath:path];
			NSComparisonResult result = [maxValue compare:objValue];
			if (result == NSOrderedAscending)
			{
				maxValue = objValue;
				maxKey = key;
			}
		}
		
	}];
	
	return maxKey;
}

@end
