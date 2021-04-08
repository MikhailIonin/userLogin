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
    let information: String
    let hobby: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPersonData() -> Person {
        Person(
            name: "Михаил",
            surname: "Ионин",
            birthDate: "14.03.1982",
            image: "GZImUI8O8UM",
            information: "Закончил Новосибирский Государсвенный Технический Университет, специализация - радиоэлектроника. Всю жизнь занимался музыкой и звукорежиссурой. Потом перешел в сферу продаж музыкального оборудования, но решил перейти в IT.",
            hobby: "Обожаю горные лыжи! Беговые тоже люблю, учусь ходить коньковым ходом. Бегаю, пока только полумарафоны, но хочу пробежать марафон, и бегать горные trail маршруты. После рождения второй дочери немного подзабросил. Надо возвращаться к тренировкам!"
        )
    }
}

 

