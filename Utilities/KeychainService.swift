//
//  KeychainService.swift
//  Starbucks
//
//  Created by 김도연 on 5/11/25.
//

import Foundation
import Security

final class KeychainService {
    static let shared = KeychainService()
    
    private init() {}
    
    private let account = "authToken"
    private let service = "com.myKeychain.tokenInfo"
    
    func save(_ value: String, service: String, account: String) {
        let data = Data(value.utf8)
        // 기존 항목 삭제
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        SecItemDelete(query)
        
        // 새로 저장
        let attributes = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecValueData: data
        ] as CFDictionary
        SecItemAdd(attributes, nil)
    }
    
    func read(service: String, account: String) -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query, &result)
        guard status == errSecSuccess,
              let data = result as? Data,
              let str = String(data: data, encoding: .utf8)
        else { return nil }
        
        return str
    }
    
    func delete(service: String, account: String) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account
        ] as CFDictionary
        SecItemDelete(query)
    }
}
