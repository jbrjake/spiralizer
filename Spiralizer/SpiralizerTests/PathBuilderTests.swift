//
//  PathBuilderTests.swift
//  Spiralizer
//
//  Created by Jonathon Rubin on 3/27/16.
//  Copyright © 2016 Jonathon Rubin. All rights reserved.
//

import XCTest
@testable import Spiralizer

class PathBuilderTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testPointPadding3x3_5() {
        
        var builder :PathBuilder
        var paddedPoint :CGPoint
        
        /*
        
        Once we have a grid drawn, a 3x3 with 5x5 boxes will look like this:
        
         0123456789012345678
        0-------------------
        1|     |	 |     |
        2|     |	 |     |
        3|  *  |  *  |  *  |
        4|     |     |     |
        5|     |     |     |
        6-------------------
        7|     |     |     |
        8|     |     |     |
        9|  *  |  *  |  *  |
        0|     |     |     |
        1|     |     |     |
        2-------------------
        3|     |     |     |
        4|     |     |     |
        5|  *  |  *  |  *  |
        6|     |     |     |
        7|     |     |     |
        8-------------------
        
        */
        
        builder = PathBuilder(withGridWidth: 3, andGridHeight: 3, andBoxSize: 5)
        
        
        paddedPoint = builder.padPoint(PathPoint(x: 0, y: 0))
        XCTAssertEqual(paddedPoint.x, 3)
        XCTAssertEqual(paddedPoint.y, 3)
        
        paddedPoint = builder.padPoint(PathPoint(x: 1, y: 0))
        XCTAssertEqual(paddedPoint.x, 9)
        XCTAssertEqual(paddedPoint.y, 3)

        paddedPoint = builder.padPoint(PathPoint(x: 2, y: 0))
        XCTAssertEqual(paddedPoint.x, 15)
        XCTAssertEqual(paddedPoint.y, 3)

        paddedPoint = builder.padPoint(PathPoint(x: 0, y: 1))
        XCTAssertEqual(paddedPoint.x, 3)
        XCTAssertEqual(paddedPoint.y, 9)

        paddedPoint = builder.padPoint(PathPoint(x: 1, y: 1))
        XCTAssertEqual(paddedPoint.x, 9)
        XCTAssertEqual(paddedPoint.y, 9)
        
        paddedPoint = builder.padPoint(PathPoint(x: 2, y: 1))
        XCTAssertEqual(paddedPoint.x, 15)
        XCTAssertEqual(paddedPoint.y, 9)

        paddedPoint = builder.padPoint(PathPoint(x: 0, y: 2))
        XCTAssertEqual(paddedPoint.x, 3)
        XCTAssertEqual(paddedPoint.y, 15)

        paddedPoint = builder.padPoint(PathPoint(x: 1, y: 2))
        XCTAssertEqual(paddedPoint.x, 9)
        XCTAssertEqual(paddedPoint.y, 15)

        paddedPoint = builder.padPoint(PathPoint(x: 2, y: 2))
        XCTAssertEqual(paddedPoint.x, 15)
        XCTAssertEqual(paddedPoint.y, 15)
    }
    
    func test2x3_5() {
        var builder :PathBuilder
        var paddedPoint :CGPoint

        /*
        
        2x3 grid with 5x5 boxes
        
        0123456789012
        0-------------
        1|     |	 |
        2|     |	 |
        3|  1  |  2  |
        4|     |     |
        5|     |     |
        6-------------
        7|     |     |
        8|     |     |
        9|  8  |  9  |
        0|     |     |
        1|     |     |
        2-------------
        3|     |     |
        4|     |     |
        5|  7  |  6  |
        6|     |     |
        7|     |     |
        8-------------
        */
        
        builder = PathBuilder(withGridWidth: 2, andGridHeight: 3, andBoxSize: 5)
        
        paddedPoint = builder.padPoint(PathPoint(x: 0, y: 0))
        XCTAssertEqual(paddedPoint.x, 3)
        XCTAssertEqual(paddedPoint.y, 3)
        
        paddedPoint = builder.padPoint(PathPoint(x: 1, y: 0))
        XCTAssertEqual(paddedPoint.x, 9)
        XCTAssertEqual(paddedPoint.y, 3)
        
        paddedPoint = builder.padPoint(PathPoint(x: 0, y: 1))
        XCTAssertEqual(paddedPoint.x, 3)
        XCTAssertEqual(paddedPoint.y, 9)
        
        paddedPoint = builder.padPoint(PathPoint(x: 1, y: 1))
        XCTAssertEqual(paddedPoint.x, 9)
        XCTAssertEqual(paddedPoint.y, 9)
        
        paddedPoint = builder.padPoint(PathPoint(x: 0, y: 2))
        XCTAssertEqual(paddedPoint.x, 3)
        XCTAssertEqual(paddedPoint.y, 15)
        
        paddedPoint = builder.padPoint(PathPoint(x: 1, y: 2))
        XCTAssertEqual(paddedPoint.x, 9)
        XCTAssertEqual(paddedPoint.y, 15)
    }

    func test3x2_5() {
        var builder :PathBuilder
        var paddedPoint :CGPoint
        
        /*
        
        3x2 grid with 5x5 boxes
        
         0123456789012345678
        0-------------------
        1|     |	 |     |
        2|     |	 |     |
        3|  *  |  *  |  *  |
        4|     |     |     |
        5|     |     |     |
        6-------------------
        7|     |     |     |
        8|     |     |     |
        9|  *  |  *  |  *  |
        0|     |     |     |
        1|     |     |     |
        2-------------------
        */
        
        builder = PathBuilder(withGridWidth: 3, andGridHeight: 2, andBoxSize: 5)
        
        paddedPoint = builder.padPoint(PathPoint(x: 0, y: 0))
        XCTAssertEqual(paddedPoint.x, 3)
        XCTAssertEqual(paddedPoint.y, 3)
        
        paddedPoint = builder.padPoint(PathPoint(x: 1, y: 0))
        XCTAssertEqual(paddedPoint.x, 9)
        XCTAssertEqual(paddedPoint.y, 3)
        
        paddedPoint = builder.padPoint(PathPoint(x: 2, y: 0))
        XCTAssertEqual(paddedPoint.x, 15)
        XCTAssertEqual(paddedPoint.y, 3)
        
        paddedPoint = builder.padPoint(PathPoint(x: 0, y: 1))
        XCTAssertEqual(paddedPoint.x, 3)
        XCTAssertEqual(paddedPoint.y, 9)
        
        paddedPoint = builder.padPoint(PathPoint(x: 1, y: 1))
        XCTAssertEqual(paddedPoint.x, 9)
        XCTAssertEqual(paddedPoint.y, 9)
        
        paddedPoint = builder.padPoint(PathPoint(x: 2, y: 1))
        XCTAssertEqual(paddedPoint.x, 15)
        XCTAssertEqual(paddedPoint.y, 9)
    }

    func test3x2_3() {
        
        var builder :PathBuilder
        var paddedPoint :CGPoint

        /*
             0123456789012 
            0-------------
            1|   |   |   |
            2| * | * | * |
            3|   |   |   |
            4-------------
            5|   |   |   |
            6| * | * | * |
            7|   |   |   |
            8-------------

        */
        
        builder = PathBuilder(withGridWidth: 3, andGridHeight: 2, andBoxSize: 3)
        
        paddedPoint = builder.padPoint(PathPoint(x: 0, y: 0))
        XCTAssertEqual(paddedPoint.x, 2)
        XCTAssertEqual(paddedPoint.y, 2)
        
        paddedPoint = builder.padPoint(PathPoint(x: 1, y: 0))
        XCTAssertEqual(paddedPoint.x, 6)
        XCTAssertEqual(paddedPoint.y, 2)
        
        paddedPoint = builder.padPoint(PathPoint(x: 2, y: 0))
        XCTAssertEqual(paddedPoint.x, 10)
        XCTAssertEqual(paddedPoint.y, 2)
        
        paddedPoint = builder.padPoint(PathPoint(x: 0, y: 1))
        XCTAssertEqual(paddedPoint.x, 2)
        XCTAssertEqual(paddedPoint.y, 6)
        
        paddedPoint = builder.padPoint(PathPoint(x: 1, y: 1))
        XCTAssertEqual(paddedPoint.x, 6)
        XCTAssertEqual(paddedPoint.y, 6)
        
        paddedPoint = builder.padPoint(PathPoint(x: 2, y: 1))
        XCTAssertEqual(paddedPoint.x, 10)
        XCTAssertEqual(paddedPoint.y, 6)

    }
}
