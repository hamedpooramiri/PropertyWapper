//
//  PropertyWapper.swift
//  Quera
//
//  Created by hamedpouramiri on 10/24/23.
//

import Foundation

@propertyWrapper
public struct LowerCased {

    private var value: String
    
    public var wrappedValue: String {
        get { value }
        set { value = newValue.lowercased() }
    }

    public init(wrappedValue: String) {
        self.value = wrappedValue.lowercased()
    }
}


@propertyWrapper
public struct PasswordValidation {

    private var value: String
    
    public var wrappedValue: String {
        get { value }
        set { value = PasswordValidation.isValid(newValue) ? newValue : "" }
    }

    public init(wrappedValue: String) {
        self.value = PasswordValidation.isValid(wrappedValue) ? wrappedValue : ""
    }
    
    static func isValid(_ password: String) -> Bool {
        // least one uppercase,
        // least one digit
        // least one lowercase
        // least one symbol
        //  min 8 characters total
        let password = password.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)
        
    }
}

public struct Person {
    @LowerCased public var name: String
    @PasswordValidation public var password: String
    
    public init(name: String, password: String) {
        self.name = name
        self.password = password
    }
}
