//
//  AreaCalculator.swift
//  AreaCalculator
//
//  Created by Swapnali Patil on 03/04/25.
//

import Foundation

public class AreaCalculator {
    public static func calculateSquareArea(_ side: Double) -> Double {
        return side * side
    }
    
    public static func calculateSquareArea(_ lenghth: Double, _ breath: Double) -> Double {
        return lenghth * breath
    }
    
    public static func calculateCircleArea(_ radius: Double) -> Double {
        return .pi * radius * radius
    }
}
