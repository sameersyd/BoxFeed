//
//  HomeView.swift
//  BoxFeed
//
//  Created by Sameer Nawaz on 07/07/21.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primary_color.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    HStack(alignment: .center) {
                        Text(AppConfig.APP_NAME).foregroundColor(.main_color)
                            .modifier(FontModifier(.bold, size: 32))
                        Spacer()
                        
                        Image.bookmark.resizable().renderingMode(.template)
                            .foregroundColor(.black).frame(width: 22, height: 22)
                    }.padding(.horizontal, 16)
                    
                    NewsSelectorView(selection: $viewModel.selection)
                        .padding(.top, 24)
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
