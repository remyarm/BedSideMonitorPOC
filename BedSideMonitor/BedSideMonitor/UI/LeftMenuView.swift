//
//  LeftMenuView.swift
//  BedSideMonitor
//
//  Created by apple on 28/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import SwiftUI

struct LeftMenuView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            VStack {
//                HStack {
                    Image("openICE-software")
                        .resizable()
                        .frame(width: CGFloat(150), height: CGFloat(150), alignment: .leading)
                        .scaledToFit()
//                        .padding(30)
//                    Spacer()
//                }
                //            .background(Color.gray)
//                NavigationLink(destination: EmptyView()) {
                List() {
                    
//
                        ForEach(mainViewModel.currentMenu.allMenuTypes(), id: \.self) { menu in
                            
                            Button(action: {
                                withAnimation {
                                guard let menuValue = MenuTypes(rawValue: menu) else { return}
                                self.mainViewModel.currentMenu = menuValue
                                self.mainViewModel.menuToggle.toggle()
                                }
                            }) {
                                Text(menu)
                            }
                        
                                //foregroundColor(Color.black)
                                //.font(.custom("Georgia", size: 20))
                            
                        }
//                    }
                    
//                .listRowBackground(Color.gray)
                }
                .background(Color.init(red: 0/255.0, green: 100/255.0, blue: 0/255.0))
            }
            .transition(.move(edge: .leading))
            .background(Color.init(red: 0/255.0, green: 100/255.0, blue: 0/255.0))
        }
        .navigationBarTitle("", displayMode: .inline)
        
        //        .background(Color.gray)
    }
}

struct LeftMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenuView()
    }
}
