//
//  GraphScrollView.swift
//  BedSideMonitor
//
//  Created by apple on 11/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation
import UIKit
/*
class GraphScrollView: UIView {
    let scrollView = UIScrollView()
    let graphUI = GraphUI()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadGrpahToScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadGrpahToScrollView() {
        self.backgroundColor = UIColor.red
        self.addSubview(scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false;

                //Constrain scroll view
                scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true;
                scrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true;
                self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true;
                self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true;
                
                //constrain width of stack view to width of self.view, NOT scroll view
               // self.graphUI.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
                
                //add image views to stack view
//                let kittenImageView1 = UIImageView(image: UIImage(named: "kittens1"))
//                self.stackView.addArrangedSubview(kittenImageView1)
//
//                let kittenImageView2 = UIImageView(image: UIImage(named: "kittens2"))
//                self.stackView.addArrangedSubview(kittenImageView2)
//
//                let kittenImageView3 = UIImageView(image: UIImage(named: "kittens3"))
                
      //  self.stackView.addArrangedSubview(kittenImageView3)

    }
    override func layoutSubviews() {
        graphUI.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
                        //Add and setup stack view
                        self.addSubview(graphUI)
                        
                        graphUI.contentMode = UIView.ContentMode.redraw
                        graphUI.translatesAutoresizingMaskIntoConstraints = false
        //                self.stackView.axis = .vertical
        //                self.stackView.spacing = 10;

                        //constrain stack view to scroll view
                        graphUI.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true;
                        graphUI.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true;
                        graphUI.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true;
                        graphUI.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true;
                        graphUI.layoutIfNeeded()
    }
}
*/

class GraphScrollView_old: UIScrollView {
//    let scrollView = UIScrollView()
    let graphUI = GraphUI()
    let stackView = UIStackView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadGrpahToScrollView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadGrpahToScrollView() {
        self.backgroundColor = UIColor.red
//        self.addSubview(graphUI)
//        self.graphUI.translatesAutoresizingMaskIntoConstraints = false;
//
//                //Constrain scroll view
//                graphUI.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true;
//                graphUI.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true;
//                self.graphUI.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true;
//                self.graphUI.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true;
//
                //constrain width of stack view to width of self.view, NOT scroll view
               // self.graphUI.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
                
                //add image views to stack view
//                let kittenImageView1 = UIImageView(image: UIImage(named: "kittens1"))
//                self.stackView.addArrangedSubview(kittenImageView1)
//
//                let kittenImageView2 = UIImageView(image: UIImage(named: "kittens2"))
//                self.stackView.addArrangedSubview(kittenImageView2)
//
//                let kittenImageView3 = UIImageView(image: UIImage(named: "kittens3"))
                
      //  self.stackView.addArrangedSubview(kittenImageView3)
        //Add and setup stack view
                self.addSubview(self.stackView)
                self.stackView.translatesAutoresizingMaskIntoConstraints = false
                self.stackView.axis = .vertical
                self.stackView.spacing = 10;

                //constrain stack view to scroll view
                self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true;
                self.stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
                self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true;
                self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true;
                
                //constrain width of stack view to width of self.view, NOT scroll view
        //        self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true;
                
                //add image views to stack view

//                let kittenImageView1 = UIImageView(image: UIImage(named: "kittens1"))
//                self.stackView.addArrangedSubview(kittenImageView1)
//
//                let kittenImageView2 = UIImageView(image: UIImage(named: "kittens2"))
//                self.stackView.addArrangedSubview(kittenImageView2)
//
//                let kittenImageView3 = UIImageView(image: UIImage(named: "kittens3"))
//                self.stackView.addArrangedSubview(kittenImageView3)
    }
    override func layoutSubviews() {
        graphUI.frame = CGRect(x: 0, y: 0, width: 200, height: 500)
                        //Add and setup stack view
        
        self.stackView.addSubview(graphUI)

                        graphUI.contentMode = UIView.ContentMode.redraw
                        graphUI.translatesAutoresizingMaskIntoConstraints = false
        //                self.stackView.axis = .vertical
        //                self.stackView.spacing = 10;

                        //constrain stack view to scroll view
                        graphUI.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true;
                        graphUI.topAnchor.constraint(equalTo: self.topAnchor).isActive = true;
                        graphUI.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true;
                        graphUI.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true;
                        graphUI.layoutIfNeeded()
    }
}


