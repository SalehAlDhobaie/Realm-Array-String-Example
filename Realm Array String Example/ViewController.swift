//
//  ViewController.swift
//  Realm Array String Example
//
//  Created by Saleh AlDhobaie on 11/19/17.
//  Copyright © 2017 Saleh AlDhobaie. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadComments()
        saveComments()
        loadComments()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadComments() {
        do {
            
            let realm = try Realm()
            let objs = realm.objects(CommentsModel.self)
            print("objs: \n \(objs)")
            
        } catch (let error) {
            print("error: \(error)")
        }
    }
    
    func saveComments() {
        let values = ["Hi", "All", "This", "is", "just"]
        do {
            let realm = try Realm()
            let comments = CommentsModel()
            let list = values.map{ item -> RealmString in
                let realmString = RealmString()
                realmString.stringValue = item
                return realmString
            }
            
            let listString = toRealmList(array: list)
            comments.listOfString = listString
            
            try realm.write {
                realm.add(comments)
            }
            
        }catch(let error) {
            print("error: \(error)")
        }
    }


}

