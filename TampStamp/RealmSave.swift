//
//  RealmSave.swift
//  TampStamp
//
//  Created by 長崎茉優 on 2022/09/19.
//

import Foundation
import RealmSwift

class Save: Object {
    @objc dynamic var card: String = ""
    @objc dynamic var todo: String = ""
    @objc dynamic var reward: String = ""
    @objc dynamic var date: String = ""
    let children = List<Child>()
}

class Child: Object {
    @objc dynamic var title: String = ""
}
