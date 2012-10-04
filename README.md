Collections-KeyPath
===================

Add useful methods to NSSet, NSArray and NSDictionary in order to retrieve the min or max object according to a KVC KeyPath.

## Methods on NSSet

    - (id)minObjectForKeyPath:(NSString*)keyPath;
    - (id)maxObjectForKeyPath:(NSString*)keyPath;

## Methods on NSArray

    - (id)minObjectForKeyPath:(NSString*)keyPath;
    - (id)maxObjectForKeyPath:(NSString*)keyPath;
    - (int)indexOfMinObjectForKeyPath:(NSString*)keyPath;
    - (int)indexOfMaxObjectForKeyPath:(NSString*)keyPath;

## Methods on NSDictionary

    - (id)minObjectForKeyPath:(NSString*)keyPath;
    - (id)maxObjectForKeyPath:(NSString*)keyPath;
    - (id)keyForMinObjectForKeyPath:(NSString*)keyPath;
    - (id)keyForMaxObjectForKeyPath:(NSString*)keyPath;
