//
//  PathBuilder.swift
//  Spiralizer
//
//  Created by Jonathon Rubin on 3/27/16.
//  Copyright © 2016 Jonathon Rubin. All rights reserved.
//

import Foundation
import CoreGraphics

class PathBuilder {
    
    let gridWidth   :Int
    let gridHeight  :Int
    let boxSize     :Int
    
    let pathFinder  :PathFinder
    
    let path :CGMutablePathRef = CGPathCreateMutable()
    
    init(
        withGridWidth gridWidth :Int, 
        andGridHeight gridHeight :Int,
        andBoxSize boxSize :Int
    ) {
        self.gridWidth   = gridWidth
        self.gridHeight  = gridHeight
        self.boxSize     = boxSize

        self.pathFinder = PathFinder(
            withGridWidth: self.gridWidth, 
            andGridHeight: self.gridHeight)
    }
    
    func followPath() {
        let paddedPoints = pathFinder.pathPoints.map { (pathPoint) -> CGPoint in
            return padPoint(pathPoint)
        }

        for paddedPoint in paddedPoints {
            CGPathMoveToPoint(self.path, nil, paddedPoint.x, paddedPoint.y)
        }
    }
    
    func padPoint(pathPoint :PathPoint) -> CGPoint {
        // Let's say we're at 0,0
        // But our boxes are 5x5 (they should always be odd-numbered)
        // Then if x == 0, paddedX = 0 + 2
        // And if y == 0, paddedY = 0 + 2
        
        return CGPoint(x: pathPoint.x + boxSize / 2, y: pathPoint.y + boxSize / 2)
    }
    
}