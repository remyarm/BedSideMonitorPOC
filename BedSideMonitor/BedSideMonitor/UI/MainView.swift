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
        GeometryReader { metrics in
        NavigationView {
            VStack {
                
                if (self.mainViewModel.currentMenu == .none) {
                    VStack {
                        Spacer()
                        GeometryReader { metrics in
                            if (self.mainViewModel.menuToggle) {
                                LeftMenuView()
                                    .frame(minWidth: nil, idealWidth: nil, maxWidth: metrics.size.height * 0.30, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .leading)
                                    .transition(.move(edge: .leading))
                                    .background(Color.gray)
                            }
                        }
                    }
                .background(Color.gray)
                }
                    
                else if (self.mainViewModel.currentMenu == .ECG) {
                    ZStack {
                        GeometryReader { metrics in
                            if (self.mainViewModel.menuToggle) {
                                LeftMenuView()
                                    .frame(minWidth: nil, idealWidth: nil, maxWidth: metrics.size.height * 0.30, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .topLeading)
                                
                                    .transition(.move(edge: .leading))
                                    .background(Color.blue)
                            }
                        }
                        VStack {
                            ScrollView(.horizontal) {
                                GraphView(value: self.$mainViewModel.currentValue).frame(width: metrics.size.width , height: 200, alignment: .topLeading
                                )
                                .padding(10)
                                
//                                if self.graphView.currentRect.x > self.scroller.frame.width {
//                                    self.scroller.scrollRectToVisible(CGRect(x: self.graphView.currentRect.x, y: self.graphView.currentRect.y, width: 50, height: 50), animated: true)
//                                }
                            }
                            
                            
                            Spacer().frame(width: 300, height: 30, alignment: .top)
//                            GraphView().frame(width: 300, height: 200, alignment: .top)
//                            Spacer().frame(width: 300, height: 30, alignment: .top)
//                            GraphView().frame(width: 300, height: 200, alignment: .top)
                        }
                    }
                    .background(Color.gray)
                    
                } else if (self.mainViewModel.currentMenu == .Device1) {
                    VStack {
                    Spacer()
                        GeometryReader { metrics in
                            if (self.mainViewModel.menuToggle) {
                                LeftMenuView()
                                    .frame(minWidth: nil, idealWidth: nil, maxWidth: metrics.size.height * 0.30, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .topLeading)
                                    .transition(.move(edge: .leading))
                                    .background(Color.yellow)
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
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
