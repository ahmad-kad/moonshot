//
//  MissionView.swift
//  moonshot
//
//  Created by ahmad kaddoura on 1/18/24.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember{
        let role : String
        let astronaut : Astronaut
    }
    
    let mission : Mission
    let crew : [CrewMember]
    
    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal){
                        width, axis in
                        width * 0.6
                    }
                    .padding()
                
                VStack (alignment: .leading){
                    HStack{
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.horizontal)
                        Text(mission.year)
                            .font(.subheadline)
                            .bold()
                    }.padding(.bottom,10)
                    Text(mission.description)
                        .fontWeight(.semibold)
                    
                }.padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators:false){
                    HStack{
                        ForEach(crew, id: \.role){crewMember in
                            NavigationLink{
                                AstronautView(astronaut: crewMember.astronaut)
                            }label: {
                                HStack{
                                    Image(crewMember.astronaut.id)
                                        .resizable()
                                        .frame(width : 104,height : 72)
                                        .clipShape(.circle)
                                        .overlay(
                                            Circle().strokeBorder(.white, lineWidth: 1)
                                        )
                                    
                                    VStack(alignment: .leading){
                                        Text(crewMember.astronaut.name)
                                            .foregroundStyle(.white)
                                            .font(.headline)
                                        Text(crewMember.role)
                                            .foregroundStyle(Color(red: 0.9, green: 0.9, blue: 0.9))
                                            
                                    }
                                }
                            }.padding()
                            
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]){
        self.mission = mission
        self.crew = mission.crew.map {member in
            if let astronaut = astronauts[member.name]{
                return CrewMember(role: member.role, astronaut: astronaut)
            }else{
                fatalError("Missing \(member.name)")
            }
        
            }
    }
}

#Preview {
    let missions : [Mission] = Bundle.main.decode("missions.json")
    let astronauts : [String:Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
