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
 
        var usedIndex: Set<Int> = []
        var fullContact: [Contact] = []
        
        while fullContact.count < name.count {
            let randomIndex = Int.random(in: 0..<name.count)
            
            if !usedIndex.contains(randomIndex) {
                usedIndex.insert(randomIndex)
                fullContact.append(
                    Contact(
                        name: name[randomIndex],
                        surname: surname[randomIndex],
                        phoneNumber: phoneNumber[randomIndex],
                        email: email[randomIndex]
                    )
                )
            }
        }
        
        return fullContact
    }
}

