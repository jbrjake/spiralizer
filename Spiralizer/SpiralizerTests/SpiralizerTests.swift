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
        
    func testSpiralNeg1x1() {
        let pathFinder = PathFinder(withGridWidth: -1, andGridHeight: 1)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 0, "Negative width and height should result in no path being found")
    }
    
    func testSpiral1xNeg1() {
        let pathFinder = PathFinder(withGridWidth: 1, andGridHeight: -1)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 0, "Negative height should result in no path being found")
    }

    func testSpiralNeg1xNeg1() {
        let pathFinder = PathFinder(withGridWidth: -1, andGridHeight: -1)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 0, "Negative width should result in no path being found")
    }

    func testSpiral0x0() {
        let pathFinder = PathFinder(withGridWidth: 0, andGridHeight: 0)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 0 * 0, "Zero width and height should result in no path being found")
    }
    
    func testSpiral1x0() {
        let pathFinder = PathFinder(withGridWidth: 1, andGridHeight: 0)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 1 * 0, "Zero width should result in no path being found")
    }
    
    func testSpiral0x1() {
        let pathFinder = PathFinder(withGridWidth: 0, andGridHeight: 1)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 0 * 1, "Zero height should result in no path being found")
    }
    
    func testSpiral1x1() {
        let pathFinder = PathFinder(withGridWidth: 1, andGridHeight: 1)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 1 * 1, "A 1x1 grid should have one path point")
        
        XCTAssertEqual(path[0], PathPoint(x: 0, y: 0), "The only point should be at 0,0")
    }

    func testSpiral3x3() {
        let pathFinder = PathFinder(withGridWidth: 3, andGridHeight: 3)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 3 * 3, "There should be a point for each square in the grid")
        
        /*      0   1   2
              -------------
            0 | 0 | 1 | 2 |
              -------------
            1 | 7 | 8 | 3 |
              -------------
            2 | 6 | 5 | 4 |
              -------------
        */
        
        XCTAssertEqual(path[0], PathPoint(x: 0, y: 0), "The 1st point should be 0,0")
        XCTAssertEqual(path[1], PathPoint(x: 1, y: 0), "The 2nd point should be 1,0")
        XCTAssertEqual(path[2], PathPoint(x: 2, y: 0), "The 3rd point should be 2,0")
        XCTAssertEqual(path[3], PathPoint(x: 2, y: 1), "The 4th point should be 2,1")
        XCTAssertEqual(path[4], PathPoint(x: 2, y: 2), "The 5th point should be 2,2")
        XCTAssertEqual(path[5], PathPoint(x: 1, y: 2), "The 6th point should be 1,2")
        XCTAssertEqual(path[6], PathPoint(x: 0, y: 2), "The 7th point should be 0,2")
        XCTAssertEqual(path[7], PathPoint(x: 0, y: 1), "The 8th point should be 0,1")
        XCTAssertEqual(path[8], PathPoint(x: 1, y: 1), "The 9th point should be 1,1")
    }
    
    func testSpiral4x4() {
        let pathFinder = PathFinder(withGridWidth: 4, andGridHeight: 4)
        let path = pathFinder.pathPoints

        XCTAssertEqual(path.count, 4 * 4, "There should be a point for each square in the grid")
        
        /*      0    1    2    3
              ---------------------
            0 | 00 | 01 | 02 | 03 |
              ---------------------
            1 | 11 | 12 | 13 | 04 |
              ---------------------
            2 | 10 | 15 | 14 | 05 |
              ---------------------
            3 | 09 | 08 | 07 | 06 |
              ---------------------
        */
        
        XCTAssertEqual(path[0],  PathPoint(x: 0, y: 0), "The 1st  point should be 0,0")
        XCTAssertEqual(path[1],  PathPoint(x: 1, y: 0), "The 2nd  point should be 1,0")
        XCTAssertEqual(path[2],  PathPoint(x: 2, y: 0), "The 3rd  point should be 2,0")
        XCTAssertEqual(path[3],  PathPoint(x: 3, y: 0), "The 4th  point should be 3,0")
        XCTAssertEqual(path[4],  PathPoint(x: 3, y: 1), "The 5th  point should be 3,1")
        XCTAssertEqual(path[5],  PathPoint(x: 3, y: 2), "The 6th  point should be 3,2")
        XCTAssertEqual(path[6],  PathPoint(x: 3, y: 3), "The 7th  point should be 3,3")
        XCTAssertEqual(path[7],  PathPoint(x: 2, y: 3), "The 8th  point should be 2,3")
        XCTAssertEqual(path[8],  PathPoint(x: 1, y: 3), "The 9th  point should be 1,3")
        XCTAssertEqual(path[9],  PathPoint(x: 0, y: 3), "The 10th point should be 0,3")
        XCTAssertEqual(path[10], PathPoint(x: 0, y: 2), "The 11th point should be 0,2")
        XCTAssertEqual(path[11], PathPoint(x: 0, y: 1), "The 12th point should be 0,1")
        XCTAssertEqual(path[12], PathPoint(x: 1, y: 1), "The 13th point should be 1,1")
        XCTAssertEqual(path[13], PathPoint(x: 2, y: 1), "The 14th point should be 2,1")
        XCTAssertEqual(path[14], PathPoint(x: 2, y: 2), "The 15th point should be 2,2")
        XCTAssertEqual(path[15], PathPoint(x: 1, y: 2), "The 16th point should be 1,2")
    }
    
    func testSpiral9x9() {
        let pathFinder = PathFinder(withGridWidth: 9, andGridHeight: 9)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 9 * 9, "There should be a point for each square in the grid.")
    }
    
    func testOneRow() {
        let pathFinder = PathFinder(withGridWidth: 3, andGridHeight: 1)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 3 * 1, "There should be a point for each square in the grid")

        XCTAssertEqual(path[0], PathPoint(x: 0, y: 0), "The 1st point should be 0,0")
        XCTAssertEqual(path[1], PathPoint(x: 1, y: 0), "The 2nd point should be 1,0")
        XCTAssertEqual(path[2], PathPoint(x: 2, y: 0), "The 3rd point should be 2,0")
    }

    func testTwoRows() {
        let pathFinder = PathFinder(withGridWidth: 3, andGridHeight: 2)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 3 * 2, "There should be a point for each square in the grid")
        
        XCTAssertEqual(path[0], PathPoint(x: 0, y: 0), "The 1st point should be 0,0")
        XCTAssertEqual(path[1], PathPoint(x: 1, y: 0), "The 2nd point should be 1,0")
        XCTAssertEqual(path[2], PathPoint(x: 2, y: 0), "The 3rd point should be 2,0")
        XCTAssertEqual(path[3], PathPoint(x: 2, y: 1), "The 3rd point should be 2,1")
        XCTAssertEqual(path[4], PathPoint(x: 1, y: 1), "The 4th point should be 1,1")
        XCTAssertEqual(path[5], PathPoint(x: 0, y: 1), "The 5th point should be 0,1")
    }

    func testOneColumn() {
        let pathFinder = PathFinder(withGridWidth: 1, andGridHeight: 3)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 1 * 3, "There should be a point for each square in the grid")
        
        XCTAssertEqual(path[0], PathPoint(x: 0, y: 0), "The 1st point should be 0,0")
        XCTAssertEqual(path[1], PathPoint(x: 0, y: 1), "The 2nd point should be 1,0")
        XCTAssertEqual(path[2], PathPoint(x: 0, y: 2), "The 3rd point should be 2,0")
    }

    func testTwoColumns() {
        let pathFinder = PathFinder(withGridWidth: 2, andGridHeight: 3)
        let path = pathFinder.pathPoints
        
        XCTAssertEqual(path.count, 2 * 3, "There should be a point for each square in the grid")
        
        XCTAssertEqual(path[0], PathPoint(x: 0, y: 0), "The 1st point should be 0,0")
        XCTAssertEqual(path[1], PathPoint(x: 1, y: 0), "The 2nd point should be 1,0")
        XCTAssertEqual(path[2], PathPoint(x: 1, y: 1), "The 3rd point should be 1,1")
        XCTAssertEqual(path[3], PathPoint(x: 1, y: 2), "The 4th point should be 1,2")
        XCTAssertEqual(path[4], PathPoint(x: 0, y: 2), "The 5th point should be 0,2")
        XCTAssertEqual(path[5], PathPoint(x: 0, y: 1), "The 6th point should be 0,1")
    }
    

}
