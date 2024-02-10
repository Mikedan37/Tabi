
/*
This Class is a Data Model for the names we will use to split items in the tab
*/

import Foundation
import SwiftUI
import Combine

// Conforms to ObservableObject
final class nameArr:ObservableObject, Identifiable{
    
    // To conform to Identifiable
    var id = UUID()
    
    // Array to store all of the entered names
    @Published var nameArray:[String] = []
    
    // Array to store and then populate left side of scroll View in NewTabSplitView1
    @Published var leftArray:[String] = []
    
    // Array to store and then populate right side of scroll View in NewTabSplitView1
    @Published var rightArray:[String] = []
    
    // Empty Array Initializers
    init() {
        self.nameArray = []
        self.leftArray = []
        self.rightArray = []
    }
}
