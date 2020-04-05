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
                    
                }
//                }
            }
            .transition(.move(edge: .leading))
            .background(Color.black)
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
