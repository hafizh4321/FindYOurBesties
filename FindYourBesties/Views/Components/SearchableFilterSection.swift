//
//  SearchableFilterSection.swift
//  FYB
//
//  Created by Muhammad HAFIZH on 12/05/25.
//

import SwiftUI

struct SearchableFilterSection: View {
    let title: String
    let items: [String]
    let selectedItems: Set<String>
    let onToggle: (String) -> Void
    
    @State private var searchText = ""
    
    private var filteredItems: [String] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .padding(.top, 10)
            
            // Mini search bar
            HStack {
                TextField("Search \(title.lowercased())...", text: $searchText)
                    .padding(8)
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
                            
                            if !searchText.isEmpty {
                                Button(action: {
                                    searchText = ""
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
            }
            
            // Use flexible grid with consistent sizing
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 8), count: 3), spacing: 8) {
                ForEach(filteredItems, id: \.self) { item in
                    toggleChip(
                        title: item,
                        isSelected: selectedItems.contains(item)
                    ) {
                        onToggle(item)
                    }
                }
            }
        }
    }
    
    func toggleChip(title: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.footnote)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
                .frame(minHeight: 56)
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.5))
                .foregroundColor(.white)
                .cornerRadius(12)
        }
    }
}

