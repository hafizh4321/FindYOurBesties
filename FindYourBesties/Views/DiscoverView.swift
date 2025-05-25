//
//  DiscoverView.swift
//  FindYourBesties
//
//  Created by Muhammad HAFIZH on 10/05/25.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject private var viewModel = LearnerListViewModel()
    @State private var showFilters = false

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {

                    Section(header: searchBarView) {
                        if viewModel.filteredLearners.isEmpty {
                            // Show "not found" view when no results
                            GeometryReader { geometry in
                                notFoundView
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                            .frame(minHeight: 270)
                        } else {
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(viewModel.sortedFilteredLearners) { learner in
                                    LearnerGridItemView(learner: learner, onTap: {
                                        viewModel.selectLearner(learner)
                                    })
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("Discover")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showFilters, onDismiss: {
                
            }) {
                FilterView(selectedGender: $viewModel.tempGender, parentViewModel: viewModel)
            }
            .background(
                NavigationLink(
                    destination: LearnerDetailView(learner: viewModel.selectedLearner),
                    isActive: Binding(
                        get: { viewModel.selectedLearner != nil },
                        set: { if !$0 { viewModel.clearSelectedLearner() } }
                    )
                ) { EmptyView() }
            )
        }
    }


    // Not found view
    var notFoundView: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.fill.questionmark")
                .font(.system(size: 80))
                .foregroundColor(.gray.opacity(0.5))

            VStack(spacing: 8) {
                Text("No Learners Found")
                    .font(.title2)
                    .fontWeight(.semibold)

                if !viewModel.searchText.isEmpty {
                    Text("No results for '\(viewModel.searchText)'")
                        .font(.body)
                        .foregroundColor(.gray)
                } else {
                    Text("No learners match your filters")
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }

            if !viewModel.searchText.isEmpty || hasActiveFilters {
                Button("Clear Search & Filters") {
                    viewModel.searchText = ""
                    viewModel.clearAllFilters()
                }
                
                
                .padding(.top, 20)
            }
        }
        .frame(maxHeight: .infinity)  // Add this line
        .padding()
    }

    private var hasActiveFilters: Bool {
        viewModel.appliedGender != "All" ||
        !viewModel.appliedSIGs.isEmpty ||
        !viewModel.appliedSigLearning.isEmpty ||
        !viewModel.appliedHobbies.isEmpty
    }


    // Active filters chips view
    var activeFiltersView: some View {
        let hasFilters = viewModel.appliedGender != "All" ||
                        !viewModel.appliedSIGs.isEmpty ||
                        !viewModel.appliedSigLearning.isEmpty ||
                        !viewModel.appliedHobbies.isEmpty

        if hasFilters {
            return AnyView(
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        // Gender filter chip
                        if viewModel.appliedGender != "All" {
                            filterChip(title: viewModel.appliedGender, type: "Gender")
                        }
                        
                        // SIG filter chips
                        ForEach(Array(viewModel.appliedSIGs), id: \.self) { sig in
                            filterChip(title: sig, type: "SIG")
                        }

                        // SIG Learning filter chips
                        ForEach(Array(viewModel.appliedSigLearning), id: \.self) { learning in
                            filterChip(title: learning, type: "SIG Learning")
                        }

                        // Hobbies filter chips
                        ForEach(Array(viewModel.appliedHobbies), id: \.self) { hobby in
                            filterChip(title: hobby, type: "Hobbies")
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)
            )
        } else {
            return AnyView(EmptyView())
        }
    }

    // Filter chip helper function
    private func filterChip(title: String, type: String) -> some View {
        HStack(spacing: 4) {
            Text(title)
                .font(.footnote)
                .lineLimit(1)

            Button(action: {
                removeFilter(title: title, type: type)
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.caption)
            }
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color.blue.opacity(0.7))
        .foregroundColor(.white)
        .cornerRadius(8)
    }

    // Function to remove individual filters
    private func removeFilter(title: String, type: String) {
        switch type {
        case "Gender":
            viewModel.appliedGender = "All"
            viewModel.tempGender = "All"
        case "SIG":
            viewModel.appliedSIGs.remove(title)
            viewModel.tempSIGs.remove(title)
        case "SIG Learning":
            viewModel.appliedSigLearning.remove(title)
            viewModel.tempSigLearning.remove(title)
        case "Hobbies":
            viewModel.appliedHobbies.remove(title)
            viewModel.tempHobbies.remove(title)
        default:
            break
        }
        viewModel.applyFilters()
    }


    var searchBarView: some View {
        VStack(spacing: 0) {
            HStack {
                TextField("Search learner's name", text: $viewModel.searchText)
                    .padding(10)
                    .padding(.leading, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)

                            Spacer()

                            if !viewModel.searchText.isEmpty {
                                Button(action: {
                                    viewModel.searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )

                Button(action: {
                    viewModel.tempGender = viewModel.appliedGender
                    showFilters.toggle()
                }) {
                    Image(systemName: viewModel.appliedGender != "All" || !viewModel.appliedSIGs.isEmpty ||
                                      !viewModel.appliedSigLearning.isEmpty || !viewModel.appliedHobbies.isEmpty ?
                                      "line.3.horizontal.decrease.circle.fill" : "line.3.horizontal.decrease.circle")
                        .foregroundColor(.blue)
                        .font(.system(size: 22))
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
            .padding(.bottom, 10)
            .background(Color(.systemBackground))

            // Add active filters chips
            activeFiltersView
        }
    }
}




#Preview {
    DiscoverView()
}
