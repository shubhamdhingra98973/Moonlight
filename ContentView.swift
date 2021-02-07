//
//  ContentView.swift
//  Moonshot
//
//  Created by Apple on 06/02/21.
//

import SwiftUI


struct ContentView: View {
    
    let astronaut : [Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions : [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination : MissionView(mission : mission, astronauts : self.astronaut)) {
                    Image(mission.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    VStack(alignment : .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        Text(mission.formattedLaunchDate)
                    }
            }
       }.navigationBarTitle("Moonshot")
    }
    }
    
//    func dateFormatter(_ date : String) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.st = "dd MM yyyy"
//        dateFormatter.date(from: date)
//        return
//    }
}




















//struct CustomText : View {
//    var text : String
//    var body : some View {
//        Text(text)
//    }
//    init(_ text : String) {
//        print("Creating a custom View")
//        self.text = text
//    }
//}
//struct ContentView: View {
//    var body: some View {
////        ScrollView(.vertical) {
////            VStack(spacing : 20) {
////                ForEach(0..<100){
////                    CustomText("Item : \($0)").font(.title)
////                }
////            }.frame(maxWidth : .infinity)
////        }
//
//        List {
//            ForEach(0..<100){
//                CustomText("Item : \($0)").font(.title)
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
