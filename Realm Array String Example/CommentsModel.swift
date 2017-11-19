//
//  CommentsModel.swift
//  Realm Array String Example
//
//  Created by Saleh AlDhobaie on 11/19/17.
//  Copyright © 2017 Saleh AlDhobaie. All rights reserved.
//

import Foundation
import RealmSwift

public func toRealmList<T: Object>(array: [T]) -> List<T> {
    
    let list = List<T>()
    for value in array {
        list.append(value)
    }
    return list
}

public class RealmString : Object {
    @objc dynamic var stringValue : String? = nil
}

public class CommentsModel : Object {
    
    public var listOfString = List<RealmString>()
}
