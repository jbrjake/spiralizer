//
//  PathFinder.swift
//  Spiralizer
//
//  Created by Jonathon Rubin on 3/26/16.
//  Copyright © 2016 Jonathon Rubin. All rights reserved.
//

import Foundation

public struct PathPoint {
    let x :Int
    let y :Int
}

extension PathPoint :Equatable {
    
}

public func ==(lhs :PathPoint, rhs :PathPoint) -> Bool {
    return 
        lhs.x == rhs.x && 
        lhs.y == rhs.y
}



public class PathFinder {
    
    public let width :Int
    public let height :Int
    
    public private(set) var pathPoints = [PathPoint]()
    
    public init(
        withGridWidth width :Int, 
        andGridHeight height :Int
    ) {
        self.width = width
        self.height = height
        
        self.generateSpiralPath()
    }
    
    private func generateSpiralPath() {
        respiralize(withWidth: self.width+1, andHeight: self.height+1, andOffset: 0)
    }
    
    private func respiralize(withWidth width :Int, andHeight height :Int, andOffset offset :Int) {
        
        guard
            Float(offset) <= Float(self.width  / 2) &&
            Float(offset) <= Float(self.height / 2)
        else {
            // The path is complete
            return
        }
        
        let startTopLine    = offset
        let endTopLine      = width - offset - 2
        let topLineY        = offset
        
        if endTopLine >= startTopLine {
            for topLineX in startTopLine...endTopLine {
                pathPoints.append(PathPoint(x: topLineX, y: topLineY))
            }
        }
        
        let startRightLine  = offset + 1
        let endRightLine    = height - offset - 2
        let rightLineX      = width  - offset - 2
        
        if endRightLine >= startRightLine {
            for rightLineY in startRightLine...endRightLine {
                pathPoints.append(PathPoint(x: rightLineX, y: rightLineY))
            }
        }
        
        let startBottomLine = width  - offset - 3
        let endBottomLine   = offset
        let bottomLineY     = height - offset - 2

        if startBottomLine >= endBottomLine && self.height > 1{
            for bottomLineX in (endBottomLine...startBottomLine).reverse() {
                pathPoints.append(PathPoint(x: bottomLineX, y: bottomLineY))
            }
        }
        
        let startLeftLine   = height - offset - 3
        let endLeftLine     = offset + 1
        let leftLineX       = offset
        
        if startLeftLine >= endLeftLine && self.width > 1 {
            for leftLineY in (endLeftLine...startLeftLine).reverse() {
                pathPoints.append(PathPoint(x: leftLineX, y: leftLineY))
            }
        }
        
        respiralize(withWidth: width, andHeight: height, andOffset: offset+1)
    }
    
    
}