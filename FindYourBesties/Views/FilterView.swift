//
//  FilterView.swift
//  FindYOurBesties
//
//  Created by Muhammad HAFIZH on 10/05/25.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedGender: String
    @ObservedObject var parentViewModel: LearnerListViewModel
    @StateObject private var viewModel: FilterViewModel
    
    init(selectedGender: Binding<String>, parentViewModel: LearnerListViewModel) {
        self._selectedGender = selectedGender
        self.parentViewModel = parentViewModel
        self._viewModel = StateObject(wrappedValue: FilterViewModel(parentViewModel: parentViewModel))
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Gender filter section
                        Text("Gender")
                            .font(.headline)
                            .padding(.top)
                        HStack {
                            genderButton("Male")
                            genderButton("Female")
                            genderButton("All")
                        }
                        
                        // SIG filter section
                        SearchableFilterSection(
                            title: "SIG",
                            items: viewModel.availableSIGs,
                            selectedItems: viewModel.selectedSIGs,
                            onToggle: viewModel.toggleSIG
                        )
                        
                        // SIG Learning filter section
                        SearchableFilterSection(
                            title: "SIG Learning",
                            items: viewModel.availableSigLearning,
                            selectedItems: viewModel.selectedSigLearning,
                            onToggle: viewModel.toggleSigLearning
                        )
                        
                        // Hobbies filter section
                        SearchableFilterSection(
                            title: "Hobbies",
                            items: viewModel.availableHobbies,
                            selectedItems: viewModel.selectedHobbies,
                            onToggle: viewModel.toggleHobby
                        )
                        
                        // Add padding at bottom to prevent content being hidden behind button
                        Spacer(minLength: 80)
                    }
                    .padding()
                }
                
                // Sticky Apply Filters button
                VStack {
                    Spacer()
                    Button(action: {
                        viewModel.applyFilters()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Apply Filters")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 15)
                    .padding(.top, 15)
                    .background(.ultraThinMaterial)
                }
            }
            .navigationBarTitle("Filters", displayMode: .inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Reset") {
                    viewModel.resetFilters()
                    selectedGender = "All"
                }
            )
            .onDisappear {
//                viewModel.saveToParentViewModel()
            }
        }
    }
    
    
    // Replace the genderButton function in FilterView.swift:
    func genderButton(_ title: String) -> some View {
        Button(action: {
            selectedGender = title
        }) {
            Text(title)
                .font(.footnote)
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
                .frame(minHeight: 44)
                .frame(maxWidth: .infinity)
                .background(selectedGender == title ? Color.blue : Color.gray.opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(12)
        }
    }
    
    func toggleChip(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(20)
        }
    }
}
