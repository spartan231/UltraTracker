//
//  Item.swift
//  UltraTracker
//
//  Created by Marcus Miller on 1/1/26.
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
