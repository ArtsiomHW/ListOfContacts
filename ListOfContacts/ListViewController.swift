//
//  ViewController.swift
//  ListOfContacts
//
//  Created by Artem H on 11/5/24.
//

import UIKit

class ListViewController: UITableViewController {

    private let data = DataStore()
    lazy private var uniqueContact = Contact.getUniqueContact(
        name: data.names,
        surname: data.surnames,
        phoneNumber: data.phoneNumbers,
        email: data.emails
    )

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}


extension ListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        uniqueContact.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "fullNameCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "\(uniqueContact[indexPath.row].name) \(uniqueContact[indexPath.row].surname)"
        cell.contentConfiguration = content
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cellRowIndex = tableView.indexPathForSelectedRow else {return}
        let contactVC = segue.destination as? ContactDetailsViewController
        contactVC?.contact = uniqueContact[cellRowIndex.row]
    }
    
}
