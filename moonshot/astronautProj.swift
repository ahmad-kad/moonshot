//
//  astronautProj.swift
//  moonshot
//
//  Created by ahmad kaddoura on 1/18/24.
//

import SwiftUI

struct astronautProj: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions){mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        }label:{
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100,height: 100)
                                    .padding()
                                VStack{
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(Color(red: 0.9 , green: 0.9, blue: 0.9))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBg)
                            }
                            .clipShape(.rect(cornerRadius:10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBg)
                            )
                            
                            }
                        
                        }
                }
                .padding([.horizontal,.bottom])
            }
                .navigationTitle("MoonShot")
                .background(.darkBg)
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    astronautProj()
}
