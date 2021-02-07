//
//  MissionView.swift
//  Moonshot
//
//  Created by Apple on 07/02/21.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember  {
        var role : String
        let astronaut  : Astronaut
    }
    
    
    var mission : Mission
    let astronauts : [CrewMember]
    var body: some View {
        GeometryReader() { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth : geo.size.width * 0.7)
                        .padding()
                    Text(mission.description)
                        .padding()
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        
                        HStack {
                            NavigationLink(destination : AstronautView(astronaut: crewMember.astronaut)) {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.primary, lineWidth: 1))

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()
                            }.buttonStyle(PlainButtonStyle())
                        }.padding(.horizontal)
                    }
                    
                    Spacer(minLength: 25)
                }
            }
        }.navigationBarTitle(Text(mission.displayName) , displayMode: .inline)
    }
    
    init(mission : Mission , astronauts : [Astronaut]) {
        self.mission = mission
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: {$0.id == member.name}) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            }
            else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions : [Mission] = Bundle.main.decode("missions.json")
    static let astronauts : [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        MissionView(mission:missions[0] , astronauts : astronauts)
    }
}
