//
//  CurveView.swift
//  BasicSwift
//
//  Created by Aradhana Verma on 27/06/19.
//  Copyright © 2019 Aradhana Verma. All rights reserved.
//

import UIKit

class CurveView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
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
        //  drawGrass(in: rect, in: context, with: colorSpace)
    }
 
    private func drawMountains(in rect: CGRect, in context: CGContext,
                               with colorSpace: CGColorSpace?) {
//        below code for gradient in area below curve
        let darkColor = UIColor.white
        let lightColor = UIColor.white

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
        
        // More coming 1...
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

    private func drawSky(in rect: CGRect, context: CGContext, colorSpace: CGColorSpace?) {
        // 1
        context.saveGState()
        defer { context.restoreGState() }
        
        // 2
        let baseColor = UIColor(red: 148.0 / 255.0, green: 158.0 / 255.0,
                                blue: 183.0 / 255.0, alpha: 1.0)
        let middleStop = UIColor(red: 127.0 / 255.0, green: 138.0 / 255.0,
                                 blue: 166.0 / 255.0, alpha: 1.0)
        let farStop = UIColor(red: 96.0 / 255.0, green: 111.0 / 255.0,
                              blue: 144.0 / 255.0, alpha: 1.0)
        
        let gradientColors = [baseColor.cgColor, middleStop.cgColor, farStop.cgColor]
        let locations: [CGFloat] = [0.0, 0.1, 0.25]
        
        guard let gradient = CGGradient(
            colorsSpace: colorSpace,
            colors: gradientColors as CFArray,
            locations: locations)
            else {
                return
        }
        
        // 3
        let startPoint = CGPoint(x: rect.size.height / 2, y: 0)
        let endPoint = CGPoint(x: rect.size.height / 2, y: rect.size.width)
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
    }
}
