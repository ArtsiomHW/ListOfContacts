//
//  Contact.swift
//  ListOfContacts
//
//  Created by Artem H on 11/5/24.
//


struct Contact {
    
    let name: String
    let surname: String
    let phoneNumber: String
    let email: String
    
    static func getUniqueContact(name: [String], surname: [String], phoneNumber: [String], email: [String]) -> [Contact] {
            var usedCombinations: [[String]] = []
            var fullContact: [Contact] = []
            
            while fullContact.count < min(name.count, surname.count, phoneNumber.count, email.count) {
                let randomNameIndex = Int.random(in: 0..<name.count)
                let randomSurnameIndex = Int.random(in: 0..<surname.count)
                let randomPhoneIndex = Int.random(in: 0..<phoneNumber.count)
                let randomEmailIndex = Int.random(in: 0..<email.count)
                
                let newContact = Contact(
                    name: name[randomNameIndex],
                    surname: surname[randomSurnameIndex],
                    phoneNumber: phoneNumber[randomPhoneIndex],
                    email: email[randomEmailIndex]
                )
                
                let combination = [newContact.name, newContact.surname, newContact.phoneNumber, newContact.email]
                
                if !usedCombinations.contains(combination) {
                    usedCombinations.append(combination)
                    fullContact.append(newContact)
                }
            }
        
            return fullContact
        }
    
}

