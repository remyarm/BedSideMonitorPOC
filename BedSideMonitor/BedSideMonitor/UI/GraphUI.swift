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
    static let kStepX = 15
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
        
        
        print("Move To Point " + point.debugDescription)
        context?.move(to: point)
        //context.move(to: CGPoint(x: Graph.kOffsetX, y: T##CGFloat))
//        context.move(to: CGPoint(x: Double(Graph.kOffsetX) , y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * data[0]))
       
//        let value = (data?[drawPoint])!
        print("value = ", value)
        //for i in data! {
        context?.addLine(to: CGPoint(x: Double(Graph.kOffsetX) + Double(count) * Double(Graph.kStepX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * Double(value)))
        
        currentRect = CGPoint(x: Double(Graph.kOffsetX) + Double(count) * Double(Graph.kStepX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * value)
//        print("context To Point " + pp.debugDescription)
        context?.strokePath()
    
//            count = count + 1
        //}
    }
 
    
//    func drawLineGraph(context: CGContext) {
//        //        let data = [0.7,0.4,0.9,1.0,0.2,0.85,0.11,0.75,0.53,0.44,0.88,0.77,0.99,0.55]
//        data = [0.7,0.45]
//        context.setLineWidth(2.0)
//        context.setStrokeColor(UIColor.blue.cgColor)
//        let maxGraphHeight = Graph.kGraphHeight - Graph.kOffsetY
//        context.beginPath()
//        let point = CGPoint(x: Double(Graph.kOffsetX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * data![0])
//        context.move(to: point)
//
//        print("Move To Point " + point.debugDescription)
//
//        //context.move(to: CGPoint(x: Graph.kOffsetX, y: <#T##CGFloat#>))
//        //        context.move(to: CGPoint(x: Double(Graph.kOffsetX) , y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * data[0]))
//        var count = 1
//        for i in data! {
//            context.addLine(to: CGPoint(x: Double(Graph.kOffsetX) + Double(count) * Double(Graph.kStepX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * i))
//            count = count + 1
//            let pp =  CGPoint(x: Double(Graph.kOffsetX) + Double(count) * Double(Graph.kStepX), y: Double(Graph.kGraphHeight) - Double(maxGraphHeight) * i)
//            print("Context Point " + pp.debugDescription)
//        }
//    }
    
    func addValue(value: Double) {
        data?.append(value)
        //drawLineGraph(count: (data!.count) , value: value)
        UIView.animate(withDuration: 5.0) {
            self.setNeedsDisplay()
        }
        
    }
    
    override func draw(_ rect: CGRect) {
        print(self.frame)
        context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.white.cgColor)
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

