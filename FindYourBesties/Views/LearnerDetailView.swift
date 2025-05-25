//
//  LearnerDetailView.swift
//  FindYourBesties
//
//  Created by Muhammad HAFIZH on 10/05/25.
//

import SwiftUI

struct LearnerDetailView: View {
    let learner: Learner?
    
    var body: some View {
        if let learner = learner {
            ScrollView {
                VStack(spacing: 16) {
                    Image(learner.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 330)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    
                    Text(learner.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom, 25)
                    
                    
                    InfoRow(icon: "calendar", text: learner.birthday)
                        
                    InfoRow(icon: "mappin.and.ellipse", text: learner.hometown)
                        
                    InfoRow(icon: "house", text: learner.address)
                        
                    InfoRow(image: "ig_logo", text: learner.instagram)
                        
                    InfoRow(icon: "phone", text: learner.phone)
                        .padding(.bottom, 25)
                    
                    // SIGs section
                    VStack(alignment: .leading, spacing: 6) {
                        Text("SIG")
                            .font(.title3)
                            .fontWeight(.semibold)
                        ForEach(learner.sigs, id: \.self) { sig in
                            InfoRow(icon: "circle.fill", text: sig, iconSize: 10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)

                    // SIG Learning section
                    VStack(alignment: .leading, spacing: 6) {
                        Text("SIG Learning")
                            .font(.title3)
                            .fontWeight(.semibold)
                        ForEach(learner.sigLearning, id: \.self) { learning in
                            InfoRow(icon: "circle.fill", text: learning, iconSize: 10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)

                    // Hobbies section
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Hobbies")
                            .font(.title3)
                            .fontWeight(.semibold)
                        ForEach(learner.hobbies, id: \.self) { hobby in
                            InfoRow(icon: "circle.fill", text: hobby, iconSize: 10)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)

                }
                .padding()
            }
            .navigationTitle("Full Biodata")
            .navigationBarTitleDisplayMode(.inline)
        } else {
            EmptyView()
        }
    }
}

#Preview {
    LearnerDetailView(learner: Learner(
        name: "Muhammad Hafizh dos santos aveiro",
        imageName: "Muhammad hafizh",
        gender: "Male",
        birthday: "19 February",
        hometown: "Studento L22/19",
        address: "Bandung",
        instagram: "@i.fizh",
        phone: "+6281224855016",
        sigs: ["Magic Hand (Art Club) S1", "Badminton"],
        sigLearning: ["Product", "Competitive Programming"],
        hobbies: ["Basket", "Badminton"]
    ))
}
