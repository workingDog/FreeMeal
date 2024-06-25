//
//  IngredientsView.swift
//  FreeMeal (iOS)
//
//  Created by Ringo Wathelet on 2024/06/24.
//

import Foundation
import SwiftUI


struct IngredientsList: View {
    @Binding var allIngrd: [String]
    @Binding var selections: [String]

    var body: some View {
        List {
            ForEach(allIngrd, id: \.self) { item in
                IngredientRow(title: item, isSelected: selections.contains(item)) {
                    if selections.contains(item) {
                        selections.removeAll(where: { $0 == item })
                    }
                    else {
                        selections.append(item)
                    }
                }
            }
        }
    }
}

struct IngredientRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                if isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
