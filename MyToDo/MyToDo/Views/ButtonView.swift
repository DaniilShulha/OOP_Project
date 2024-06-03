//
//  ButtonView.swift
//  MyToDo
//
//  Created by znexie on 24.04.24.
//

import SwiftUI
import OOPLibrary
struct ButtonView: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Value", background: .pink) {
            // Action
        }
    }
}
