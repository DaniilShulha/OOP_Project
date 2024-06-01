//
//  Header.swift
//  MyToDo
//
//  Created by znexie on 24.04.24.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundColor(background)
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50)).bold()
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(.system(size: 25)).bold()
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width, height: 300)
        .offset(y: -60)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", background: .green)
}
