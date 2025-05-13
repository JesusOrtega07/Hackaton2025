//
//  Custom.swift
//  Bimbo
//
//  Created by Jesus Ortega on 13/05/25.
//

import SwiftUI

struct CustomCheckbox: View {
    let label: String
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isChecked ? .green : .secondary)
            
            Text(label)
                .foregroundColor(.green)
        }
        .onTapGesture {
            isChecked.toggle()
        }
    }
}
