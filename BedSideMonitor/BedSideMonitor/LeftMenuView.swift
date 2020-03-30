//
//  LeftMenuView.swift
//  BedSideMonitor
//
//  Created by apple on 28/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import SwiftUI

struct LeftMenuView: View {
    let deviceList = ["ECG","Device1","Device2"]
    var body: some View {
        NavigationLink(destination: EmptyView()) {
            List {
                ForEach(deviceList, id: \.self) {
                        Text($0)
                }
            }
        }
    }
}

struct LeftMenuView_Previews: PreviewProvider {
    static var previews: some View {
        LeftMenuView()
    }
}
