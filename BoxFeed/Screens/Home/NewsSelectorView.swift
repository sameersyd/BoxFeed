//
//  NewsSelectorView.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 07/07/21.
//

import SwiftUI

struct NewsSelectorView: View {
    
    @Binding var selection: Int
    private let sources = Sources.allCases
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top) {
                ForEach(0..<sources.count) { index in
                    VStack(spacing: 8) {
                        Text(sources[index].name)
                            .foregroundColor(Color.text_primary)
                            .modifier(FontModifier(.bold, size: 14))
                            .layoutPriority(1).fixedSize(horizontal: true, vertical: false)
                        if selection == index {
                            Rectangle().frame(height: 2)
                                .foregroundColor(.main_color)
                        }
                    }
                    .padding(.horizontal, 8)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) { selection = index }
                    }
                }
            }.padding(.horizontal, 12)
        }
    }
}
