//
//  Timestamp.swift
//  InstagramTutorial
//
//  Created by Mia on 12/7/2024.
//

import Firebase

// extension on the firebase Timestamp

extension Timestamp {
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1 // eg d, (for day) s (for seconds), w (for weeks) etc
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
}
