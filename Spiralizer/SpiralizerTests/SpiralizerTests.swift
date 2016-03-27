//
//  SpiralizerTests.swift
//  SpiralizerTests
//
//  Created by Jonathon Rubin on 3/26/16.
//  Copyright © 2016 Jonathon Rubin. All rights reserved.
//

import XCTest
@testable import Spiralizer

class SpiralizerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
        
    func testSpiral3x3() {
        let pathFinder = PathFinder(withGridWidth: 3, andGridHeight: 3)
        
        let path = pathFinder.pathPoints
        
        XCTAssert(path.count == 3 * 3, "There should be a point for each square in the grid")
        
        /*      0   1   2
              -------------
            0 | 0 | 1 | 2 |
              -------------
            1 | 7 | 8 | 3 |
              -------------
            2 | 6 | 5 | 4 |
              -------------
        */
        
        XCTAssert(path[0] == PathPoint(x: 0, y: 0), "The 1st point should be 0,0")
        XCTAssert(path[1] == PathPoint(x: 1, y: 0), "The 2nd point should be 1,0")
        XCTAssert(path[2] == PathPoint(x: 2, y: 0), "The 3rd point should be 2,0")
        XCTAssert(path[3] == PathPoint(x: 2, y: 1), "The 4th point should be 2,1")
        XCTAssert(path[4] == PathPoint(x: 2, y: 2), "The 5th point should be 2,2")
        XCTAssert(path[5] == PathPoint(x: 1, y: 2), "The 6th point should be 1,2")
        XCTAssert(path[6] == PathPoint(x: 0, y: 2), "The 7th point should be 0,2")
        XCTAssert(path[7] == PathPoint(x: 0, y: 1), "The 8th point should be 0,1")
        XCTAssert(path[8] == PathPoint(x: 1, y: 1), "The 9th point should be 1,1")
        
        
    }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
    func testOneRow() {
        let pathFinder = PathFinder(withGridWidth: 3, andGridHeight: 1)
        let path = pathFinder.pathPoints
        
        XCTAssert(path.count == 3 * 1)

        XCTAssert(path[0] == PathPoint(x: 0, y: 0), "The 1st point should be 0,0")
        XCTAssert(path[1] == PathPoint(x: 1, y: 0), "The 2nd point should be 1,0")
        XCTAssert(path[2] == PathPoint(x: 2, y: 0), "The 3rd point should be 2,0")

    }

    func testOneColumn() {
        let pathFinder = PathFinder(withGridWidth: 1, andGridHeight: 3)
        let path = pathFinder.pathPoints
        
        XCTAssert(path.count == 1 * 3)
        
        XCTAssert(path[0] == PathPoint(x: 0, y: 0), "The 1st point should be 0,0")
        XCTAssert(path[1] == PathPoint(x: 0, y: 1), "The 2nd point should be 1,0")
        XCTAssert(path[2] == PathPoint(x: 0, y: 2), "The 3rd point should be 2,0")
        
    }
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
