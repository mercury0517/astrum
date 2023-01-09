//
//  DeskItem.swift
//  Astrum
//
//  Created by 伊原明宏 on 2023/01/07.
//

import Foundation
import RealmSwift

class DeskItem: Object, Identifiable {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var memo: String?
    @objc dynamic var url: String?
    @objc dynamic var isWishList: Bool = false
}

class DeskItemFixture {
    static func sampleItem() -> DeskItem {
        let item = DeskItem()
        item.id = "12345"
        item.title = "Apple Studio Display"
        item.memo = "27-inch 5K Retina display. 12MP Ultra Wide camera with Center Stage. Studio-quality mics. Six-speaker sound system with Spatial Audio."
        item.url = "https://www.hogefuga.com"
        item.isWishList = false
        
        return item
    }
    
    static func emptyItem() -> DeskItem {
        let item = DeskItem()
        item.id = ""
        item.title = ""
        item.memo = ""
        item.url = ""
        item.isWishList = false

        return item
    }
}
