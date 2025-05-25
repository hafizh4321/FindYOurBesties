//
//  InfoRow.swift
//  FindYourBesties
//
//  Created by Muhammad HAFIZH on 10/05/25.
//


import SwiftUI

struct InfoRow: View {
    let icon: String?
    let image: String?
    let text: String
    var iconSize: CGFloat = 16


    init(icon: String? = nil, image: String? = nil, text: String, iconSize: CGFloat = 16) {
        self.icon = icon
        self.image = image
        self.text = text
        self.iconSize = iconSize
    }

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            ZStack {
                if let iconName = icon {
                    Image(systemName: iconName)
                        .font(.system(size: iconSize)) 
                        .frame(width: 24, height: 24)
                }
                if let imageName = image {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
            }
            .frame(width: 24, height: 24)
            
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
