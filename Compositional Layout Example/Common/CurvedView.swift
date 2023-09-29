//
//  CurvedView.swift
//  Compositional Layout Example
//
//  Created by Raju Kumar on 29/09/23.
//

import Foundation
import UIKit


class CurvedView: UIView {
    
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.addCurveShape()
    }
    
    func addCurveShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.createPath()
        shapeLayer.fillColor = UIColor.white.cgColor
        
        //Add shadow
        shapeLayer.shadowColor = UIColor.gray.cgColor
        shapeLayer.shadowOpacity = 1.0
        shapeLayer.shadowRadius = 5
        shapeLayer.shadowOffset = CGSize(width: 0, height: 3)
        
        if let oldshapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldshapeLayer, with: shapeLayer)
        }else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
    }
    
    func createPath() -> CGPath {
        let height: CGFloat = 45.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - height * 2), y: 0))
        
        // first curve down
        path.addCurve(to: CGPoint(x: centerWidth, y: height), controlPoint1: CGPoint(x: (centerWidth - 35), y: 0), controlPoint2: CGPoint(x: centerWidth - 40, y: height))
        //second curve up
        path.addCurve(to: CGPoint(x: (centerWidth + height * 2), y: 0), controlPoint1: CGPoint(x: (centerWidth + 40), y: height), controlPoint2: CGPoint(x: centerWidth + 35, y: 0))
        
        //complete curve
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
}
