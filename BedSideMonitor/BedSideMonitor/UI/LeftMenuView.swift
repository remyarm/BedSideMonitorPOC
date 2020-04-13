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
    
    init() {
        UITableView.appearance().backgroundColor = .clear
         UITableViewCell.appearance().backgroundColor = .clear
       
    }
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .leading) {
                Color.init(red: 76/255.0, green: 153/255.0, blue: 207/255.0)
                .edgesIgnoringSafeArea(.top)
                List() {
                        ForEach(mainViewModel.currentMenu.allMenuTypes(), id: \.self) { menu in
                            
                            Button(action: {
                                withAnimation {
                                guard let menuValue = MenuTypes(rawValue: menu) else { return}
                                self.mainViewModel.currentMenu = menuValue
                                self.mainViewModel.menuToggle.toggle()
                                }
                            }) {
                                Text(menu)
                                    .font(.custom("Georgia", size: 20))
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                Spacer()
                
            }
            .transition(.move(edge: .leading))
            .background(Color.init(red: 76/255.0, green: 153/255.0, blue: 207/255.0))
        .navigationBarTitle("Device List")
        }
 
    }

}

struct LeftMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenuView()
    }
}


