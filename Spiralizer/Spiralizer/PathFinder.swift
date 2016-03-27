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
        
        if width-offset-2 >= offset {
            for i in offset...width-offset-2 {
                pathPoints.append(PathPoint(x: i, y: offset))
            }
        }
        
        if height-offset-2 >= offset+1 {
            for i in offset+1...height-offset-2 {
                pathPoints.append(PathPoint(x: width-offset-2, y: i))
            }
        }
        
        if width-offset-3 >= offset {
            for i in (offset...width-offset-3).reverse() {
                pathPoints.append(PathPoint(x: i, y: height-offset-2))
            }
        }
        
        if height-offset-3 >= offset+1 {
            for i in (offset+1...height-offset-3).reverse() {
                pathPoints.append(PathPoint(x: offset, y: i))
            }
        }
        
        respiralize(withWidth: width, andHeight: height, andOffset: offset+1)
        
    }
    
    
}