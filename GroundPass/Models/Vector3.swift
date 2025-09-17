//
//  Vector3.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 16/9/25.
//

import Foundation

struct Vector3 {
    var x: Double
    var y: Double
    var z: Double
    
    /// Sum
    static func + (lhs: Vector3, rhs: Vector3) -> Vector3 {
        return Vector3(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z)
    }
    
    /// Substract
    static func - (lhs: Vector3, rhs: Vector3) -> Vector3 {
        return Vector3(x: lhs.x - rhs.x, y: lhs.y - rhs.y, z: lhs.z - rhs.z)
    }
    
    /// Scalar multiplication
    static func * (lhs: Double, rhs: Vector3) -> Vector3 {
        return Vector3(x: lhs * rhs.x, y: lhs * rhs.y, z: lhs * rhs.z)
    }
    
    /// Dot product
    func dot(_ v: Vector3) -> Double {
        return x * v.x + y * v.y + z * v.z
    }
    
    /// Vector length
    func norm() -> Double {
        return sqrt(x*x + y*y + z*z)
    }
}
