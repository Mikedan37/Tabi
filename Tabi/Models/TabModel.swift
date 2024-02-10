//
//  TabModel.swift
//  Tabi
//
//  Created by Michael Danylchuk on 2/6/24.
//

import Foundation
import Combine
import SwiftUI

final class Tab: ObservableObject,Identifiable{
    var id = UUID()
    @Published var numPeople:Int
    @Published var tab: [Item] = []
    init(){
        numPeople = 0
    }
}
