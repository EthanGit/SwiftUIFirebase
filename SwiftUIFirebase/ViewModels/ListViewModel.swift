//
//  ListViewModel.swift
//  SwiftUIFirebase
//
//  Created by Ethan Lin on 2025/9/12.
//

import Foundation
import FirebaseFirestore

class ListViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    private var currentIndex: Int = 0
    
    @MainActor
    init() {
        // self.users = getMockUsers()
        Task {
            self.users = await fetchUsers()
        }
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
    
    // Download User Data
    private func fetchUsers() async -> [User] {
        do {
            let snapshot = try await Firestore.firestore().collection("users").getDocuments()
            
            var tempUsers = [User]()
            for document in snapshot.documents {
                let user = try document.data(as: User.self)
                tempUsers.append(user)
            }
            return tempUsers
        } catch {
            print("ユーザーデータ取得に失敗: \(error.localizedDescription)")
            return []
        }
    }
    
    func adjustIndex(isRedo: Bool) {
        if isRedo {
            currentIndex -= 1
        } else {
            currentIndex += 1
        }
    }
        
    func tappedHandler(action: Action) {
        switch action {
        case .nope , .like:
            if currentIndex >= users.count { return }
        case .redo:
            if currentIndex <= 0 { return }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("ACTIONFROMBUTTON"), object: nil, userInfo: [
            "id": action == .redo ? users[currentIndex - 1].id : users[currentIndex].id,
            "action": action
        ])
    }
}
