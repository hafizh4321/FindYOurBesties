//
//  Learner.swift
//  FindYourBesties
//
//  Created by Muhammad HAFIZH on 10/05/25.
//

import SwiftUI

struct Learner: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let gender: String
    let birthday: String
    let hometown: String
    let address: String
    let instagram: String
    let phone: String
    let sigs: [String]
    let sigLearning: [String] 
    let hobbies: [String]
}
