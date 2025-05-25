    //
//  LearnerGridItemView.swift
//  FindYourBesties
//
//  Created by Muhammad HAFIZH on 10/05/25.
//

import SwiftUI

struct LearnerGridItemView: View {
    let learner: Learner
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            
            ZStack(alignment: .bottom) {
                Image(learner.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 230)
                    .clipped()
                    .cornerRadius(10)
                
                Text(learner.name)
                    .font(.headline)
                    .padding(8)
                    .frame(maxWidth: .infinity)
//                    .background(Color.black.opacity(0.1))
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding(.horizontal, 6)
//                    .padding(.bottom, 6)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
