//
//  resizeImage.swift
//  moonshot
//
//  Created by ahmad kaddoura on 1/18/24.
//

import SwiftUI

struct resizeImage: View {
    var body: some View {
        Image(.apollo13)
            .resizable()
            //.scaledToFill() // resizes dimensions to encompass the frame
             .scaledToFit() // resizes image to fit within the frame
            //.frame(width: 300,height: 300)
            .containerRelativeFrame(.horizontal){size,axis in
                size * 0.8}
            
    }
}

#Preview {
    resizeImage()
}
