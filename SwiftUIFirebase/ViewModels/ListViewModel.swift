//
//  ListViewModel.swift
//  SwiftUIFirebase
//
//  Created by Ethan Lin on 2025/9/12.
//

import Foundation

class ListViewModel {
    
    var users: [User] = []
    
    private var currentIndex: Int = 0
    
    init() {
        self.users = getMockUsers()
    }
    
    private func getMockUsers() -> [User] {
        return [
            .MOCK_USER1,
            .MOCK_USER2,
            .MOCK_USER3,
            .MOCK_USER4,
            .MOCK_USER5,
            .MOCK_USER6,
            .MOCK_USER7
        ]
    }
    
    func adjustIndex(isRedo: Bool) {
        if isRedo {
            currentIndex -= 1
        } else {
            currentIndex += 1
        }
    }
    
    func nopeButtonTapped() {
        if currentIndex >= users.count { return }
        
        NotificationCenter.default.post(name: NSNotification.Name("NOPEACTION"), object: nil, userInfo: [
            "id": users[currentIndex].id
        ])
    }
    
    func likeButtonTapped() {
        if currentIndex >= users.count { return }
        
        NotificationCenter.default.post(name: NSNotification.Name("LIKEACTION"), object: nil, userInfo: [
            "id": users[currentIndex].id
        ])
    }
    
    func redoButtonTapped() {
        if currentIndex <= 0 { return }
        
        NotificationCenter.default.post(name: NSNotification.Name("REDOACTION"), object: nil, userInfo: [
            "id": users[currentIndex - 1].id
        ])
    }
}
