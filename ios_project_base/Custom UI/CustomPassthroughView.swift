//
//  CustomPassthroughView.swift
//  ios_project_base
//
//  Created by Abdmin on 04/10/2021.
//

import UIKit

class CustomPassthroughView: UIView {
    
    var passthroughFrames: [CGRect] = []
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        NotificationCenter.default.post(name: Notification.Name.didTapOverlayCut, object: nil)
        print("CustomPassthroughView point passthroughFrames.count: \(passthroughFrames.count), point: \(point)")
        var pointInside = false
        for passthroughFrame in passthroughFrames {
            print("CustomPassthroughView point passthroughFrame: \(passthroughFrame)")
            if passthroughFrame.contains(point) {
                print("pointInside")
                pointInside = true
            }
        }
        print("pointInside: \(pointInside)")
        return !pointInside
    }
}
