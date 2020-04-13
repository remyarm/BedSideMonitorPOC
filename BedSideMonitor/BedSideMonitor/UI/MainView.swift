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
    init() {
        UIScrollView.appearance().backgroundColor = UIColor.clear
        UIStackView.appearance().backgroundColor = UIColor(displayP3Red: 72/255.0, green: 118/255.0, blue: 172/255.0, alpha: 1)
    }
    var body: some View {
        GeometryReader { metrics in
            NavigationView {
                VStack {
                    
                    if (self.mainViewModel.currentMenu == .none) {
                        VStack {
//                            Spacer()
                            GeometryReader { metrics in
                                if (self.mainViewModel.menuToggle) {
                                    LeftMenuView()
                                        .frame(width: metrics.size.width*0.7, height: metrics.size.height, alignment: .top)
                                        //  .frame(minWidth: nil, idealWidth: nil, maxWidth: metrics.size.height * 0.30, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .top)
                                        .transition(.move(edge: .leading))
                                    
                                }
                            }
                        }
                        .background(Color.init(red: 72/255.0, green: 118/255.0, blue: 172/255.0))
                    }
                        
                    else if (self.mainViewModel.currentMenu == .ECG) {
                        ZStack {
                            GeometryReader { metrics in
                                if (self.mainViewModel.menuToggle) {
                                    LeftMenuView()
                                        .frame(minWidth: nil, idealWidth: nil, maxWidth: metrics.size.height * 0.30, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .topLeading)
                                        
                                        .transition(.move(edge: .leading))
                                    
                                }
                            }
                            if (self.mainViewModel.menuToggle == false) {
                                VStack {
                                    //  Spacer().frame(width: 300, height: 30, alignment: .top)
                                    ScrollView {
                                        VStack {
                                            Text("ECG Lead I")
                                                .padding(20)
                                            GraphView(value: self.$mainViewModel.currentValue).frame(width: 600 , height: 200, alignment: .topLeading
                                            )
                                                .padding([.leading,.trailing, .top, .bottom], 20)
                                                .background(Color.init(red: 72/255.0, green: 118/255.0, blue: 172/255.0))
                                        }
                                       
                                    }
                                    
                                    ScrollView {
                                        VStack {
                                            Text("ECG Lead I")
                                            GraphView(value: self.$mainViewModel.currentValue).frame(width: 600 , height: 200, alignment: .topLeading
                                            )
                                                .padding([.leading,.trailing, .top, .bottom], 20)
                                                .background(Color.init(red: 72/255.0, green: 118/255.0, blue: 172/255.0))
                                        }
                                        .background(Color.init(red: 72/255.0, green: 118/255.0, blue: 172/255.0))
                                    }
                                        
                                        
                                        
                                    .padding(20)
                                    .background(Color.init(red: 72/255.0, green: 118/255.0, blue: 172/255.0))
                                    
                                }
                            }
                            
                        }
                                             .background(Color.init(red: 72/255.0, green: 118/255.0, blue: 172/255.0))
                        
                    } else if (self.mainViewModel.currentMenu == .Device1) {
                        VStack {
                           
                            GeometryReader { metrics in
                                if (self.mainViewModel.menuToggle) {
                                    LeftMenuView()
                                        .frame(minWidth: nil, idealWidth: nil, maxWidth: metrics.size.height * 0.30, minHeight: nil, idealHeight: nil, maxHeight: .infinity, alignment: .topLeading)
                                        .transition(.move(edge: .leading))
                                    
                                    
                                }
                            }
                        }
                        .background(Color.init(red: 72/255.0, green: 118/255.0, blue: 172/255.0))
                    }
                    
                }
                    
                    //                .edgesIgnoringSafeArea(.all)
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
