//
//  ContentView.swift
//  BedSideMonitor
//
//  Created by apple on 27/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Spacer()
                    .layoutPriority(1)
                GeometryReader { metrics in
                    if (self.mainViewModel.menuToggle) {
                        LeftMenuView()
                            .frame(minWidth: nil, idealWidth: nil, maxWidth: metrics.size.height * 0.30, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .topLeading)
                            .transition(.move(edge: .leading))
                        
                    }
                }
                
            }
            .background(Color.gray)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle("BedSideMonitor", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    withAnimation {
                        self.mainViewModel.menuToggle.toggle()
                    }
                }) {
                    Image("menu")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
