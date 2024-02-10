//
//  TabModel.swift
//  Tabi
//
//  Created by Michael Danylchuk on 2/5/24.
//

import Foundation
import Combine
import SwiftUI

final class Item: ObservableObject, Identifiable{
    var id = UUID()
    @Published var Name: String
    @Published var Price: Double
    @Published var NameWPrice:[String:Double]
    
    init(){
        self.Name = ""
        self.Price = 0
        self.NameWPrice = ["":0]
    }
    
    init(Name: String, Price: Double) {
        self.Name = Name
        self.Price = Price
        self.NameWPrice = [Name:Price]
    }
}
