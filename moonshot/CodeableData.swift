//
//  CodeableData.swift
//  moonshot
//
//  Created by ahmad kaddoura on 1/18/24.
//

import SwiftUI

struct User: Codable {
    let name :String
    let address : Address
}

struct Address : Codable{
    let street : String
    let city : String
}

struct CodeableData: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("Decode JSON"){
            let input = """
            {
            "name: "Fred Jones",
            "address":{
                "street": "123, Mystery Inc. Van
                "city": Boston
            
            
            }
            """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data){
                print(user.address.street)
            }
        }
    }
}

#Preview {
    CodeableData()
}
