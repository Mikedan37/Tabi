//
//  ContentView.swift
//  Tabi
//
//  Created by Michael Danylchuk on 1/28/24.
//

import SwiftUI
import Combine

struct FrontPageView: View {
    @EnvironmentObject var appe: nameArr
    @EnvironmentObject var ite: Item
    @EnvironmentObject var teb: Tab
    @State var isPushed = false
    @State var alerted = false
    @State var selectedOption = 0
    var body: some View {
        TabView(selection: $selectedOption){
            ZStack{
                NavigationStack {
                    Text("").navigationTitle("Tabi")
                }.offset(x:0,y:-85)
                HStack{
                    
                    Button("+", systemImage: "pencil.and.list.clipboard"){
                        isPushed = true
                    }.buttonStyle(.bordered).offset(x:125,y:-315).popover(isPresented: $isPushed, content: {
                        addNewItemsTotalView()
                    })
                }
                Form{
                    Section(header: Text("Most Recent Tab")) {
                        peopleView()
                        HStack{
                            VStack{
                                HStack{
                                    Text("Sunnyvale, CA")
                                    Spacer()
                                    Text("70.23")
                                    Text("/")
                                    Image(systemName: "person")
                                }
                                
                            }
                        }
                    }
                }.background(.clear).frame(height: 635).offset(x:0,y:30)
            }
            .tabItem{
                Image(systemName: "house")
                Text("Tabs")
            }
            
            Text("Hello")
            .tabItem{
                Image(systemName: "gear")
                Text("Settings")
            }
        }.background(.gray)
    }
}

struct peopleView: View{
    @EnvironmentObject var teb: Tab
    var body: some View{
        HStack{
            Text("Chic Fil A")
            Spacer()
            Text("\(teb.numPeople)")
            Image(systemName: "person.2")
        }
    }
}
//preview that needs DATA
struct listOfPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        FrontPageView().environmentObject(nameArr()).environmentObject(Item()).environmentObject(Tab())
    }
}
