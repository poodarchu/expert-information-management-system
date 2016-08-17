//
//  User.swift
//  ExpertRecruitSystem
//
//  Created by P. Chu on 8/17/16.
//  Copyright © 2016 PDC. All rights reserved.
//
import UIKit

enum User: Int, RawRepresentable {
    
    case Admin = 0
    case Expert = 1
    
    static var total: Int {
        var count = 0
        while let _ = User(rawValue: count) {
            count += 1
        }
        return count
    }
    
    var labels: (title: String, subtitle: String) {
        switch self {
        case .Admin:
            return (
                title: "Administrator",
                subtitle: "Manage information of the Experts."
            )
        case .Expert:
            return (
                title: "Expert",
                subtitle: "Add related information into the system."
            )
        }
    }
    
    func controller() -> UIViewController {
        switch self {
        case .Admin:
            return AdminViewController.fromStoryboard()
        case .Expert:
            return AuthViewController.fromStoryboard()
        }
    }
}