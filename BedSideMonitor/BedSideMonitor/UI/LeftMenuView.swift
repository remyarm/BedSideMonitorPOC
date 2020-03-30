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
        VStack {
            HStack {
                Image("openICE-software")
                .resizable()
                    .frame(width: 150, height: 150, alignment: .leading)
                    .scaledToFit()
                    .padding(30)
                Spacer()
            }
            .background(Color.gray)
            List {
                ForEach(deviceList, id: \.self) {
                        Text($0)
                            .foregroundColor(Color.primary)
                            //.font(Font.system(.))
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
