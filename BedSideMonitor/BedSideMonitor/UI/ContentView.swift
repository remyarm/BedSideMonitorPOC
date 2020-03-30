//
//  ContentView.swift
//  BedSideMonitor
//
//  Created by apple on 27/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Text("")
            .navigationBarTitle("BedSideMonitor", displayMode: .inline)
            .navigationBarItems(leading:
                    NavigationLink(destination: LeftMenuView()) {
                        Image("menu")
                    }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
