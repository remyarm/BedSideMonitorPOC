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
    
    init(){
        UITableView.appearance().backgroundColor = .clear
         UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View {
        
        NavigationView {
            VStack {
                Color.init(red: 76/255.0, green: 153/255.0, blue: 207/255.0)
                
                .edgesIgnoringSafeArea(.top)
//                Spacer().frame(width: 300, height: 100, alignment: .leading)
//                    .background(Color.init(red: 76/255.0, green: 153/255.0, blue: 207/255.0))
//                HStack {
//                    Image("openICE-software")
//                        .resizable()
//                        .frame(width: CGFloat(150), height: CGFloat(150), alignment: .leading)
//                        .scaledToFit()
//                        .padding(30)
//                    Spacer()
//                }
                //            .background(Color.gray)
//                NavigationLink(destination: EmptyView()) {
                List() {
//                    
//                         Color.init(red: 76/255.0, green: 153/255.0, blue: 207/255.0)
                        ForEach(mainViewModel.currentMenu.allMenuTypes(), id: \.self) { menu in
                            
                            Button(action: {
                                withAnimation {
                                guard let menuValue = MenuTypes(rawValue: menu) else { return}
                                self.mainViewModel.currentMenu = menuValue
                                self.mainViewModel.menuToggle.toggle()
                                }
                            }) {
                                Text(menu)
                                    .font(.custom("Georgia Bold", size: 20))
//                                .fontWeight(.bold)
                                
                                    .foregroundColor(Color.white)
                            }
                           // .listRowBackground(Color.init(red: 76/255.0, green: 153/255.0, blue: 207/255.0))
                                //foregroundColor(Color.black)
                                //.font(.custom("Georgia", size: 20))
                            
                        }
                    }
                
            }
            .transition(.move(edge: .leading))
            .background(Color.init(red: 76/255.0, green: 153/255.0, blue: 207/255.0))
        }
    }
}

struct LeftMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenuView()
    }
}


