//
//  GraphView.swift
//  BedSideMonitor
//
//  Created by apple on 08/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import SwiftUI

struct GraphView: UIViewRepresentable {
    @Binding var value: Double
    func makeUIView(context: UIViewRepresentableContext<GraphView>) -> GraphUI {
        return GraphUI()
    }
    
    func updateUIView(_ uiView: GraphUI, context: UIViewRepresentableContext<GraphView>) {
        uiView.addValue(value: value)
    }
    
    typealias UIViewType = GraphUI
    
    
}
