//
//  CurveView.swift
//  BasicSwift
//
//  Created by Aradhana Verma on 27/06/19.
//  Copyright © 2019 Aradhana Verma. All rights reserved.
//

import UIKit

class CurveView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // Drawing code
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        drawMountains(in: rect, in: context, with: colorSpace)
    }
 
    private func drawMountains(in rect: CGRect, in context: CGContext,
                               with colorSpace: CGColorSpace?) {
//        below code for gradient in area below curve
        let darkColor = UIColor.red
        let lightColor = UIColor.green

        let mountainColors = [darkColor.cgColor, lightColor.cgColor]
        let mountainLocations: [CGFloat] = [1,0.5]
        guard let mountainGrad = CGGradient.init(colorsSpace: colorSpace,
                                                 colors: mountainColors as CFArray, locations: mountainLocations) else {
                                                    return
        }
        let rectHeight = rect.size.height*2/3
        let mountainStart = CGPoint(x: 0, y: 0)
        let mountainEnd = CGPoint(x: rect.size.height, y: rect.size.width)
        
        context.saveGState()
        do { context.restoreGState() }
        
        let backgroundMountains = CGMutablePath()
        backgroundMountains.move(to: CGPoint(x:0, y:  rect.size.height), transform: .identity)
        backgroundMountains.addLine(to: CGPoint(x: 0 , y: rectHeight),
                                    transform: .identity)
        backgroundMountains.addQuadCurve(to: CGPoint(x: rect.size.width, y: rectHeight),
                                         control: CGPoint(x: rect.size.width/2, y: rectHeight + 100),
                                         transform: .identity)
        backgroundMountains.addLine(to: CGPoint(x: rect.size.width , y: rect.size.height),
                                    transform: .identity)
        backgroundMountains.addLine(to: CGPoint(x:0 , y: rect.size.height),
                                    transform: .identity)
        // Background Mountain Stroking
        context.addPath(backgroundMountains)
        context.clip()
        context.drawLinearGradient(mountainGrad, start: mountainStart,
                                   end: mountainEnd, options: [])
        
    }
}
