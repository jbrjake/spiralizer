//
//  ViewController.swift
//  Spiralizer
//
//  Created by Jonathon Rubin on 3/26/16.
//  Copyright © 2016 Jonathon Rubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        self.view.backgroundColor = UIColor.whiteColor()
        let spiralView = SpiralView(frame: self.view.bounds)
        spiralView.contentMode = UIViewContentMode.Redraw
        spiralView.backgroundColor = UIColor.clearColor()
        spiralView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(spiralView)

        self.view.addConstraint(NSLayoutConstraint(item: spiralView, attribute: .TopMargin, relatedBy: .Equal, toItem: self.view, attribute: .TopMargin, multiplier: 1, constant: 40))
        self.view.addConstraint(NSLayoutConstraint(item: spiralView, attribute: .BottomMargin, relatedBy: .Equal, toItem: self.view, attribute: .BottomMargin, multiplier: 1, constant: -40))
        self.view.addConstraint(NSLayoutConstraint(item: spiralView, attribute: .LeadingMargin, relatedBy: .Equal, toItem: self.view, attribute: .LeadingMargin, multiplier: 1, constant: 8))
        self.view.addConstraint(NSLayoutConstraint(item: spiralView, attribute: .TrailingMargin, relatedBy: .Equal, toItem: self.view, attribute: .TrailingMargin, multiplier: 1, constant: -8))
        
        self.view.layoutSubviews()
    }
    
}

class SpiralView :UIView {
    
    override func drawRect(rect: CGRect) {
        
        if let sublayers = self.layer.sublayers {
            for subLayer in sublayers {
                subLayer.removeFromSuperlayer()
            }
        }
        
        let gridWidth = 4
        let gridHeight = 3
        let boxSize = 3
        
        // draw the grid...need to use boxsize + 1 to account for the gridlines
        let gridPath = CGPathCreateMutable()
        for horizontalLine in 0...gridHeight {
            CGPathMoveToPoint(gridPath, nil, 0, CGFloat(horizontalLine * (boxSize+1)))
            CGPathAddLineToPoint(gridPath, nil, CGFloat((gridWidth) * (boxSize+1)), CGFloat(horizontalLine * (boxSize+1)))
        }
        for verticalLine in 0...gridWidth {
            CGPathMoveToPoint(gridPath, nil, CGFloat(verticalLine * (boxSize+1)), 0 )
            CGPathAddLineToPoint(gridPath, nil, CGFloat(verticalLine * (boxSize+1)), CGFloat(gridHeight * (boxSize+1)))
        }
        
        let pathBuilder = PathBuilder(withGridWidth: gridWidth, andGridHeight: gridHeight, andBoxSize: boxSize)
        
        let spiralPath = CGPathCreateMutable()
        
        CGPathAddPath(spiralPath, nil, pathBuilder.path)

        let pathBounds = CGPathGetBoundingBox(gridPath)
            
        // Fit to aspect ratio
        let boundsAspect = pathBounds.width / pathBounds.height
        let viewAspect = self.frame.width / self.frame.height

        var scale = CGFloat(1.0)
        if boundsAspect > viewAspect {
            scale = self.frame.width / pathBounds.width
        }
        else {
            scale = self.frame.height / pathBounds.height
        }
        
        var transform = CGAffineTransformIdentity
        transform = CGAffineTransformScale(transform, scale, scale)
        transform = CGAffineTransformTranslate(transform, -pathBounds.minX, -pathBounds.minY) // Flip to UIKit

        // Center
        let scaledSize = CGSizeApplyAffineTransform(pathBounds.size, CGAffineTransformMakeScale(scale, scale))
        let offset = CGSizeMake((self.frame.width-scaledSize.width) / (scale * 2.0), (self.frame.height - scaledSize.height) / (scale * 2.0))
        transform = CGAffineTransformTranslate(transform, offset.width, offset.height)

        let scaledGridPath = CGPathCreateCopyByTransformingPath(gridPath, &transform)
        
        let gridLayer = CAShapeLayer()
        gridLayer.bounds = self.layer.frame
        gridLayer.position = self.layer.position
        
        gridLayer.backgroundColor = UIColor.clearColor().CGColor
        gridLayer.fillColor = nil
        gridLayer.strokeColor = UIColor.grayColor().CGColor
        gridLayer.opacity = 0.25
        
        gridLayer.path = scaledGridPath
        self.layer.addSublayer(gridLayer)
        
        let spiralLayer = CAShapeLayer()
        spiralLayer.bounds = self.layer.frame
        spiralLayer.position = self.layer.position
        
        spiralLayer.backgroundColor = UIColor.clearColor().CGColor
        spiralLayer.fillColor = nil
        spiralLayer.strokeColor = UIColor.blackColor().CGColor
        
        let scaledSpiralPath = CGPathCreateCopyByTransformingPath(spiralPath, &transform)

        spiralLayer.path = scaledSpiralPath
        self.layer.addSublayer(spiralLayer)
        
        var animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 1.0
        animation.fromValue = 0.0
        animation.toValue = 1.0
        gridLayer.addAnimation(animation, forKey: "strokeEnd")

        animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 2.0
        animation.fromValue = 0.0
        animation.toValue = 1.0
        spiralLayer.addAnimation(animation, forKey: "strokeEnd")

    }
}
