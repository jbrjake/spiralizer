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
        
        if offset >= self.width / 2 {
            return
        }

        if offset >= self.height / 2 {
            return
        }
        
        for i in offset...width-offset-1 {
            pathPoints.append(PathPoint(x: i, y: offset))
        }
        
        for i in offset+1...height-offset-1 {
            pathPoints.append(PathPoint(x: width-offset-1, y: i))
        }
        
        for i in (offset...width-offset-1).reverse() {
            pathPoints.append(PathPoint(x: i, y: height-offset))
        }
        
        for i in (offset...height-1).reverse() {
            pathPoints.append(PathPoint(x: offset, y: i))
        }
        
        respiralize(withWidth: width, andHeight: height, andOffset: offset+1)
        
    }
    
    
}