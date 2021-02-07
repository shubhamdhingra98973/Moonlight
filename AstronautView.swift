//
//  AstronautView.swift
//  Moonshot
//
//  Created by Apple on 07/02/21.
//

import SwiftUI

struct AstronautView: View {
    
    var astronaut : Astronaut
    
    var body: some View {
        GeometryReader() { geo in
            ScrollView(.vertical) {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaleEffect()
                    .frame(maxWidth:geo.size.width)
                
                Text(astronaut.description)
                    .padding()
                    .layoutPriority(1)
                
            }.navigationBarTitle(Text(astronaut.name),displayMode : .inline)
        }
    }
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronaut : [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronaut[0])
    }
}
