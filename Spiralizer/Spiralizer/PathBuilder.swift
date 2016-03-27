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
        
        self.buildPath()
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
        return CGPoint(
            x: pathPoint.x + calculatePadding(pathPoint.x), 
            y: pathPoint.y + calculatePadding(pathPoint.y))
    }
    
    func calculatePadding(ordinate :Int) -> Int {
        return (ordinate * (self.boxSize)) + Int( round( Float(self.boxSize) / Float(2) ) )
    }
}