//
//  GraphView.swift
//  BedSideMonitor
//
//  Created by apple on 08/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import SwiftUI

//struct GraphView: UIViewRepresentable {
//    typealias UIViewType = GraphScrollView
//
//    @Binding var value: Double
//    func makeUIView(context: UIViewRepresentableContext<GraphView>) -> GraphScrollView {
//        return GraphScrollView()
//    }
//
//    func updateUIView(_ uiView: GraphScrollView, context: UIViewRepresentableContext<GraphView>) {
//
//        //uiView.addValue(value: value)
////        guard let sView = uiView.superview, let scrollView = sView as? ScrollView<<#Content: View#>> else { return }
////
////        if uiView.currentRect.x > scrollView.frame.width {
////            scrollView.scrollRectToVisible(CGRect(x: uiView.currentRect.x, y: uiView.currentRect.y, width: 50, height: 50), animated: true)
////        }
//    }
//}


struct GraphView: UIViewRepresentable {
    typealias UIViewType = GraphUI
    
    @Binding var value: Double
    func makeUIView(context: UIViewRepresentableContext<GraphView>) -> GraphUI {
        return GraphUI()
    }
    
    func updateUIView(_ uiView: GraphUI, context: UIViewRepresentableContext<GraphView>) {
       
        uiView.addValue(value: value)
//        guard let sView = uiView.superview, let scrollView = sView as? ScrollView<<#Content: View#>> else { return }
//
//        if uiView.currentRect.x > scrollView.frame.width {
//            scrollView.scrollRectToVisible(CGRect(x: uiView.currentRect.x, y: uiView.currentRect.y, width: 50, height: 50), animated: true)
//        }
    }
}
