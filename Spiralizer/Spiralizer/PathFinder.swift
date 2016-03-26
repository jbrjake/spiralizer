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
        
    }
    
    private func respiralize(withWidth width :Int, withHeight height :Int) {
        
    }
    
}