//
//  FilterViewModel.swift
//  FindYourBesties
//
//  Created by Muhammad HAFIZH on 10/05/25.
//

import SwiftUI
import Combine

class FilterViewModel: ObservableObject {
    // Reference to parent view model for accessing data and applying filters
    private var parentViewModel: LearnerListViewModel
    
    // Temporary states for filter selection
    @Published var selectedSIGs: Set<String>
    @Published var selectedSigLearning: Set<String>
    @Published var selectedHobbies: Set<String>
    
    // Available options from the database
    private(set) var availableSIGs: [String] = []
    private(set) var availableSigLearning: [String] = []
    private(set) var availableHobbies: [String] = []
    
    init(parentViewModel: LearnerListViewModel) {
        self.parentViewModel = parentViewModel
        self.selectedSIGs = parentViewModel.tempSIGs
        self.selectedSigLearning = parentViewModel.tempSigLearning
        self.selectedHobbies = parentViewModel.tempHobbies
        
        // Load data from parent view model
        self.availableSIGs = parentViewModel.getAllSIGs()
        self.availableSigLearning = parentViewModel.getAllSigLearning()
        self.availableHobbies = parentViewModel.getAllHobbies()
    }
    
    func resetFilters() {
        selectedSIGs.removeAll()
        selectedSigLearning.removeAll()
        selectedHobbies.removeAll()
        // Reset gender in parent view model
           parentViewModel.tempGender = "All"
    }
    
    func toggleSIG(_ sig: String) {
        if selectedSIGs.contains(sig) {
            selectedSIGs.remove(sig)
        } else {
            selectedSIGs.insert(sig)
        }
    }
    
    func toggleSigLearning(_ learning: String) {
        if selectedSigLearning.contains(learning) {
            selectedSigLearning.remove(learning)
        } else {
            selectedSigLearning.insert(learning)
        }
    }
    
    func toggleHobby(_ hobby: String) {
        if selectedHobbies.contains(hobby) {
            selectedHobbies.remove(hobby)
        } else {
            selectedHobbies.insert(hobby)
        }
    }
    
    // Save temporary filter states back to parent view model
    func saveToParentViewModel() {
        parentViewModel.tempSIGs = selectedSIGs
        parentViewModel.tempSigLearning = selectedSigLearning
        parentViewModel.tempHobbies = selectedHobbies
    }
    
    // Apply all filters (called when "Apply Filters" button is clicked)
    func applyFilters() {
        saveToParentViewModel()
        parentViewModel.applyFilters()
    }
    
}
