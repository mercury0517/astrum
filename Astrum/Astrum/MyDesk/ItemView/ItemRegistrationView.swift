//
//  ItemRegistrationView.swift
//  Astrum
//
//  Created by 伊原明宏 on 2022/12/10.
//

import SwiftUI

struct ItemRegistrationView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Register New Item")
                    .navigationTitle("Add new item")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarColorScheme(.dark, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
            }
        }
    }
}

struct ItemRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRegistrationView()
    }
}
