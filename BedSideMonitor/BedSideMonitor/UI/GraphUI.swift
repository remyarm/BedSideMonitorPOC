//
//  GraphView.swift
//  gView
//
//  Created by apple on 15/03/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import UIKit

struct Graph {
    static let kGraphHeight = 150
    static let kDefaultGraphWidth = 900
    static let kOffsetX = 0
    static let kStepX = 30
    static let kGraphBottom = 300
    static let kGrpahTop = 0
    static let kStepY = 15
    static let kOffsetY = 0
}
class GraphUI: UIView {
    var context: CGContext? = nil
    var data : [Double]? = [0]
    var currentRect: CGPoint = CGPoint(x: 0, y: 0)
    func drawLineGraph(count: Int, value: Double) {
        context?.setLineWidth(2.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let maxGraphHeight = Graph.kGraphHeight - Graph.kOffsetY
            context?.beginPath()
        
//        let point = CGPoint(x: Double(Graph.kOffsetX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * data![(count-1)])
        
        var point = CGPoint(x: 0, y: 0)
        if (count - 2 < 0) {
           //point = CGPoint(x: Double(Graph.kOffsetX) + Double(count-1) * Double(Graph.kStepX), y: Double(maxGraphHeight) * data![0])
            point = CGPoint(x: 0, y: 150)
        } else {
            point = CGPoint(x: Double(Graph.kOffsetX) + Double(count-1) * Double(Graph.kStepX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * data![(count-2)])
        }
        
        
       // print("Move To Point " + point.debugDescription)
        context?.move(to: point)
        //context.move(to: CGPoint(x: Graph.kOffsetX, y: T##CGFloat))
//        context.move(to: CGPoint(x: Double(Graph.kOffsetX) , y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * data[0]))
       
//        let value = (data?[drawPoint])!
      //  print("value = ", value)
        //for i in data! {
        context?.addLine(to: CGPoint(x: Double(Graph.kOffsetX) + Double(count) * Double(Graph.kStepX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * Double(value)))
        
        currentRect = CGPoint(x: Double(Graph.kOffsetX) + Double(count) * Double(Graph.kStepX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * value)
//        print("context To Point " + pp.debugDescription)
        context?.strokePath()

    }
    
    func addValue(value: Double) {
        data?.append(value)
        //drawLineGraph(count: (data!.count) , value: value)
        UIView.animate(withDuration: 5.0) {
            self.setNeedsDisplay()
        }
        
    }
    
//    func drawFlipped(in rect: CGRect, withAttributes attributes: [String: Any]) {
//           guard let gc = UIGraphicsGetCurrentContext() else { return }
//           gc.saveGState()
//           defer { gc.restoreGState() }
//           gc.translateBy(x: rect.origin.x, y: rect.origin.y + rect.size.height)
//           gc.scaleBy(x: 1, y: -1)
//           "ABC".draw(in: CGRect(origin: .zero, size: rect.size), withAttributes: attributes)
//       }
//
    override func draw(_ rect: CGRect) {
        print(self.frame)
        context = UIGraphicsGetCurrentContext()
        context?.setFillColor(CGColor(srgbRed: 191.0/2.055, green: 227.0/255.0, blue: 242.0/255.0, alpha: 0.8))
        context?.fill(self.bounds)
        context?.setLineWidth(0.6)
        context?.setStrokeColor(UIColor.black.cgColor)
        let lines = (Graph.kDefaultGraphWidth - Graph.kOffsetX) / Graph.kStepX
        
        for i in 0...lines {
            context?.move(to: CGPoint(x: Graph.kOffsetX + i * Graph.kStepX , y: Graph.kGrpahTop))
            context?.addLine(to: CGPoint(x: Graph.kOffsetX + i * Graph.kStepX, y: Graph.kGraphBottom))
        }
        
        let howManyHorizontal = (Graph.kGraphBottom - Graph.kGrpahTop - Graph.kOffsetY) / Graph.kStepY
        for i in 0...howManyHorizontal {
            context?.move(to: CGPoint(x: Graph.kOffsetX, y: Graph.kGraphBottom - Graph.kOffsetY - i * Graph.kStepY))
            context?.addLine(to: CGPoint(x: Graph.kDefaultGraphWidth, y: Graph.kGraphBottom - Graph.kOffsetY - i * Graph.kStepY))
//            print("Horizontal values")
//            print(CGPoint(x: Graph.kOffsetX, y: Graph.kGraphBottom - Graph.kOffsetY - i * Graph.kStepY))
//            print("Ssecond value")
          //  print( CGPoint(x: Graph.kDefaultGraphWidth, y: Graph.kGraphBottom - Graph.kOffsetY - i * Graph.kStepY))
            if (i==(howManyHorizontal/2)) {
        
              // var rectt = CGRect(x: 50.0, y: 50.0, width: 300, height: 300)
                context?.saveGState()
                defer {
                    context?.restoreGState()
                }
                
                let attrs = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 10)!]
                print(rect)
                context?.translateBy(x: rect.origin.x, y: rect.origin.y + rect.size.height)
                context?.scaleBy(x: 1.0, y: -1.0)
                for j in 0...10 {
                    "1.0".draw(in: CGRect(origin: CGPoint(x: (j*30), y: 0), size: CGSize(width: 50, height: 50)), withAttributes: attrs)
                }
                
            }
        }
 
        context?.strokePath()
        guard let con = context else {return}
        var count =  1
       // var start = limit
        for i in 0..<data!.count {
            print("Count " + i.description)
            drawLineGraph(count: count, value: (data?[i])!)
//            drawLineGraph(moveToPoint: count, drawPoint: count)
            count = count + 1
//            context?.strokePath()
        }
       // limit = (data?.count)! - 1
    }
    
    
//    override func draw(_ rect: CGRect) {
//        let context = UIGraphicsGetCurrentContext()
//        context?.setLineWidth(0.6)
//        context?.setStrokeColor(UIColor.lightGray.cgColor)
//        let lines = (Graph.kDefaultGraphWidth - Graph.kOffsetX) / Graph.kStepX
//
//        for i in 0...lines {
//            context?.move(to: CGPoint(x: Graph.kOffsetX + i * Graph.kStepX , y: Graph.kGrpahTop))
//            context?.addLine(to: CGPoint(x: Graph.kOffsetX + i * Graph.kStepX, y: Graph.kGraphBottom))
//        }
//
//        let howManyHorizontal = (Graph.kGraphBottom - Graph.kGrpahTop - Graph.kOffsetY) / Graph.kStepY
//        for i in 0...howManyHorizontal {
//            context?.move(to: CGPoint(x: Graph.kOffsetX, y: Graph.kGraphBottom - Graph.kOffsetY - i * Graph.kStepY))
//            context?.addLine(to: CGPoint(x: Graph.kDefaultGraphWidth, y: Graph.kGraphBottom - Graph.kOffsetY - i * Graph.kStepY))
//        }
//
//        context?.strokePath()
//
//        drawLineGraph(context: context!)
//        context?.strokePath()
//    }
}

