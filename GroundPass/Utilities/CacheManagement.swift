//
//  CacheManagement.swift
//  GroundPass
//
//  Created by Alejandro Gonzalez2 on 14/1/26.
//

import Foundation

enum CacheManagement {
    static func localURL(for key: String) -> URL {
        let cacheDir = FileManager.default
            .urls(for: .cachesDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("models", isDirectory: true)
        
        try? FileManager.default.createDirectory(
            at: cacheDir,
            withIntermediateDirectories: true
        )
        
        return cacheDir.appendingPathComponent("\(key)")
    }
    
    static func save(data: Data?, key: String) throws -> URL {
        let localURL = localURL(for: key)

        if FileManager.default.fileExists(atPath: localURL.path) {
            return localURL
        }

        try data?.write(to: localURL, options: .atomic)

        return localURL
    }
    
    static func clear(key: String) {
        let url = localURL(for: key)
        try? FileManager.default.removeItem(at: url)
    }
}
