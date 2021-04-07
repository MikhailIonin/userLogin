//
//  Model.swift
//  userLogin
//
//  Created by Ионин Михаил Викторович on 05.04.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "User",
            password: "123",
            person: Person.getPersonData()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let birthDate: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPersonData() -> Person {
        Person(
            name: "Михаил",
            surname: "Ионин",
            birthDate: "14.03.1982",
            image: "" 
        )
    }
}

 

