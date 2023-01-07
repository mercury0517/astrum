//
//  DeskItem.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/07.
//

import Foundation
import RealmSwift

class DeskItem: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var memo: String?
    @objc dynamic var url: String?
    @objc dynamic var isWishList: Bool = false
}
