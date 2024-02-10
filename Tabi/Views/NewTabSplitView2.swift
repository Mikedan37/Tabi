//
//  NewTabSplitView2.swift
//  Tabi
//
//  Created by Michael Danylchuk on 2/4/24.
//

import Foundation
import SwiftUI

struct letsSetUpTheBill: View{
    @EnvironmentObject var appe: nameArr
    @EnvironmentObject var ite: Item
    @EnvironmentObject var teb: Tab
    @State var isalert = false
    @State var nam = ""
    @State var price = ""
    @State var isHilighted = false

    var body: some View{
        VStack{
            HStack{
                TextField(text: $nam ,prompt: Text("Name")){}.padding(10)
                TextField(text: $price ,prompt: Text("Price")){}
                Button{
                    if nam.isEmpty || price.isEmpty{
                        isalert = true
                    } else{
                        isalert = false
                        teb.tab.append(Item(Name: nam, Price: Double(price) ?? 0))
                        nam = "";price = ""
                    }
                }label:{
                    Image(systemName: "square.and.arrow.down").foregroundStyle(.gray)
                }.alert(isPresented: $isalert){
                    Alert(title: Text("Must fill both fields"))
                }
            }
           ScrollView{
               VStack{
                   ForEach(teb.tab){i in
                       HStack{
                           Text(i.Name)
                           Text(String(format: "%.2f",i.Price))
                       }
                   }
               }
           }.padding(10)
            Spacer()
            HStack{
                ForEach(appe.nameArray, id: \.self){ na in
                    Button{
                        
                    }label:{
                        Text(na)
                    }
                }
            }
        }
    }
}

struct letsSetUpTheBill_Previews: PreviewProvider {
    static var previews: some View {
        letsSetUpTheBill().environmentObject(nameArr()).environmentObject(Item()).environmentObject(Tab())
    }
}
