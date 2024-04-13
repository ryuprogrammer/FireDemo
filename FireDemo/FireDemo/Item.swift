//
//  Item.swift
//  FireDemo
//
//  Created by トム・クルーズ on 2024/04/12.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
