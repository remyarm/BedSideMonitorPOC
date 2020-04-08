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
    var change = true
    var body: some View {
        NavigationView {
            
            
            HStack {
                
            
                if (mainViewModel.currentMenu == .none) {
                HStack {
                     Spacer()
                    //                        .layoutPriority(1)
                                        GeometryReader { metrics in
                                            if (self.mainViewModel.menuToggle) {
                                                LeftMenuView()
                                                    .frame(minWidth: nil, idealWidth: nil, maxWidth: metrics.size.height * 0.30, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .topLeading)
                                                    .transition(.move(edge: .leading))
//                                                .background(Color.gray)
                                            }
                                        }
                    }
                .background(Color.blue)
                    }
                else if (mainViewModel.currentMenu == .ECG) {
                    HStack {
                    Spacer()
                    //                        .layoutPriority(1)
                                        GeometryReader { metrics in
                                            if (self.mainViewModel.menuToggle) {
                                                LeftMenuView()
                                                    .frame(minWidth: nil, idealWidth: nil, maxWidth: metrics.size.height * 0.30, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .topLeading)
                                                    .transition(.move(edge: .leading))
//                                                    .background(Color.blue)
                                                
                                            }
                                        }
                    }
                    .background(Color.gray)
                } else if (mainViewModel.currentMenu == .Device1) {
                    HStack {
                    Spacer()
                    //                        .layoutPriority(1)
                                        GeometryReader { metrics in
                                            if (self.mainViewModel.menuToggle) {
                                                LeftMenuView()
                                                    .frame(minWidth: nil, idealWidth: nil, maxWidth: metrics.size.height * 0.30, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .topLeading)
                                                    .transition(.move(edge: .leading))
//                                                    .background(Color.yellow)
                                                
                                            }
                                        }
                    }
                    .background(Color.yellow)
                }
            }
            
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
