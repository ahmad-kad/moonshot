//
//  scrollView.swift
//  moonshot
//
//  Created by ahmad kaddoura on 1/18/24.
//

import SwiftUI

struct CustomText: View{
    let text : String
    var body : some View{
        Text(text)
    }
    init(text: String){
        // If using VStack, it loads everything at once
        // Lazy Vstack leads things dynamically
        print("Creating a new Custom Text")
        self.text = text
    }
}
struct scrollView: View {
    @Environment(\.layoutDirection) private var layoutDirection
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ScrollView{
            LazyVStack(alignment: .leading, spacing:10) {
                ForEach(0..<100){
                    Text("Item: \($0)")
                        .font(.subheadline)
                        .alignmentGuide(.leading) { _ in
                            let leadingPadding: CGFloat = layoutDirection == .leftToRight ? 0 : 20
                            return leadingPadding
                        }
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(25)
        }
    }
}

#Preview {
    scrollView()
}
