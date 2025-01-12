//
//  UserService.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 12/29/21.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    @Published var user: User?
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let snapshot = snapshot else { return }
            self.user = try? snapshot.data(as: User.self)            
        }
    }
}
