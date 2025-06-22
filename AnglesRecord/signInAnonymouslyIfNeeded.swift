//
//  signInAnonymouslyIfNeeded.swift
//  AnglesRecord
//
//  Created by 성현 on 6/20/25.
//

import FirebaseAuth

func signInAnonymouslyIfNeeded() {
    if Auth.auth().currentUser == nil {
        Auth.auth().signInAnonymously { result, error in
            if let error = error {
                print("❌ 로그인 실패: \(error)")
            } else {
                print("✅ 로그인 성공: \(result?.user.uid ?? "")")
            }
        }
    }
}
