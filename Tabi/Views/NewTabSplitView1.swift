//
//  NewTabSplitView1.swift
//  Tabi
//
//  Created by Michael Danylchuk on 2/4/24.
//

import Foundation
import SwiftUI

//First Pop over View
struct addNewItemsTotalView:View{
  @EnvironmentObject var appe: nameArr
    var body: some View{
        NavigationStack{
        ZStack{
            VStack{
                HowManyPeopleView().offset(x:0,y:-80)
                ZStack{
                    listOfPeopleView()
                    EnterNamesOfPeopleView().offset(x:0,y:-110)
                }
            }
            NavigationLink("->"){
                letsSetUpTheBill()
            }.offset(x:120,y:340).font(.system(size: 40)).bold()
            }
        }
    }
}

// How many people Text Section
struct HowManyPeopleView: View {
    @EnvironmentObject var appe: nameArr
    var body: some View{
        VStack{
            Text("This Many People?")
            Text("\(appe.nameArray.count)").multilineTextAlignment(.center).frame(width: 100).offset(x:0,y:20).font(.system(size: 20))
            
        }
    }
}

// Entering names textfield/prompts view
struct EnterNamesOfPeopleView: View{
    @EnvironmentObject var appe: nameArr
    @State var tooManyNames: Bool = false
    @State var person:String = ""
    var body: some View{
        VStack{
            Text("What are their names?")
            Text("[one at a time]")
            .foregroundStyle(.gray).padding(0)
            TextField(text: $person ,prompt: Text("Name")){}
            .frame(width:200).multilineTextAlignment(.center).padding(1)
            Button("->", systemImage: "tag.fill"){
                if appe.nameArray.count < 10{
                    if person != ""{
                        appe.nameArray.append(person)
                        if appe.nameArray.count % 2 == 0{
                            appe.rightArray.append(person)
                        }else{
                            appe.leftArray.append(person)
                        }
                        person = ""
                    }else{
                        person = ""
                    }
                }else{
                    tooManyNames.toggle()
                    person = ""
                }
            }.padding(1).buttonStyle(.bordered).alert(isPresented: $tooManyNames, content: {
                Alert(title: Text("Too many Names"))
            })
        }
    }
}

// Populates the list of people view
struct listOfPeopleView: View{
    @EnvironmentObject var appe: nameArr
    var body: some View {
            HStack {
                leftListView
                rightListView
            }
        }
        
        private var leftListView: some View {
            List(appe.leftArray, id: \.self) { item in
                Text(item)
                    .font(.system(size: 25))
                    .frame(width: 250)
            }
            .frame(width: 180, height: 350)
            .scrollDisabled(true)
            .listStyle(.plain)
            .offset(x: -20, y: 200)
        }
        
        private var rightListView: some View {
            List(appe.rightArray, id: \.self) { item in
                Text(item)
                    .font(.system(size: 25))
                    .frame(width: 250)
            }
            .frame(width: 180, height: 350)
            .scrollDisabled(true)
            .listStyle(.plain)
            .offset(x: -20, y: 200)
        }
}

struct addNewItemsTotalView_Previews: PreviewProvider {
    static var previews: some View {
        addNewItemsTotalView().environmentObject(nameArr())
    }
}


