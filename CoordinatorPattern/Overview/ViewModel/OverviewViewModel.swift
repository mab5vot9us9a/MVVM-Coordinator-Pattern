//
//  OverviewViewModel.swift
//  CoordinatorPattern
//
//  Created by Maurice Fahn on 12.06.18.
//  Copyright © 2018 Maurice Fahn. All rights reserved.
//

import Foundation

struct OverviewViewModel: CustomStringConvertible {
    let id: Int
    
    var title: String {
        return "#\(id+1)"
    }
    
    var description: String {
        return "This is OverviewViewModel #\(id+1)"
    }
    
    init(item: OverviewItem) {
        self.id = item.id
    }
}

struct OverviewListViewModel {
    var title: String {
        return "Overview Items"
    }
    
    var count: Int {
        return items.count
    }
    
    var items: [OverviewViewModel]
    
    init(items: [OverviewViewModel]) {
        self.items = items
    }
    
    
}
