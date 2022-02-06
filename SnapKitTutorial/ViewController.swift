//
//  ViewController.swift
//  SnapKitTutorial
//
//  Created by Ruslan Sharshenov on 06.02.2022.
//

import UIKit
import SnapKit

struct Contact{
    let name: String
    let number: String
    let color: UIColor
}

class ViewController: UIViewController {

    var contacts: [Contact] = []
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter Name"
        return view
    }()
    
    private lazy var textField2: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter Number"
        return view
    }()
    
    private lazy var button1: UIButton = {
        let view = UIButton()
        view.setTitle("Add", for: .normal)
        view.setTitleColor(UIColor.blue, for: .normal)
        view.addTarget(nil, action: #selector(addContact), for: .touchUpInside)
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContacts()
        setupView()
        setupConstraint()
    }
    
    private func setupContacts(){
        self.contacts.append(Contact(name: "Adina", number: "0700909090", color: .black))
        self.contacts.append(Contact(name: "Amina", number: "0700909090", color: .orange))
        self.contacts.append(Contact(name: "Kalya", number: "0700908090", color: .yellow))
        self.contacts.append(Contact(name: "Kolya", number: "0700909090", color: .purple))
        self.contacts.append(Contact(name: "Vanya", number: "0700909090", color: .green))
        self.contacts.append(Contact(name: "Eliza", number: "0500909090", color: .gray))
        self.contacts.append(Contact(name: "Dastan", number: "0700009090", color: .darkGray))
        self.contacts.append(Contact(name: "Kulibek", number: "0700902090", color: .systemPink))
        self.contacts.append(Contact(name: "Layla", number: "0700709090", color: .red))
    }
    
    private func setupView(){
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.register(SecondCustomCell.self, forCellReuseIdentifier: "SecondCustomCell")
    }
    
    private func setupConstraint(){
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.height / 20)
            make.left.equalToSuperview()
        }
        
        view.addSubview(textField2)
        textField2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.height / 20)
            make.left.equalTo(textField.snp.right).offset(view.frame.width / 5)
        }
        
        view.addSubview(button1)
        button1.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(view.frame.height / 20)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(15)
            make.width.equalToSuperview().dividedBy(3)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(button1.snp.bottom).offset(view.frame.height / 20)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func addContact(){
        contacts.insert(Contact(name: textField.text!, number: textField2.text!, color: .blue), at: 0)
        self.tableView.reloadData()
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        
        if index % 2 == 0{
            return 100
        }else{
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rootVC = SecondViewController()
        rootVC.label1.text = contacts[indexPath.row].name
        rootVC.label2.text = contacts[indexPath.row].number
        rootVC.view.backgroundColor = contacts[indexPath.row].color
        present(rootVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        if index % 2 == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
            cell.title1.text = contacts[indexPath.row].name
            cell.title2.text = contacts[indexPath.row].number
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.accessoryType = cell.isSelected ? .checkmark : .none
                cell.selectionStyle = .none
            
            cell.backgroundColor = UIColor(red: Double.random(in: 0...255) / 255, green: Double.random(in: 0...255) / 255, blue: Double.random(in: 0...255) / 255, alpha: 1)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCustomCell") as! SecondCustomCell
            cell.title1.text = "Контакт №\(index + 1)"
            cell.title2.text = contacts[index].name
            
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
                cell.accessoryType = cell.isSelected ? .checkmark : .none
                cell.selectionStyle = .none
            
            cell.backgroundColor = UIColor(red: Double.random(in: 0...255) / 255, green: Double.random(in: 0...255) / 255, blue: Double.random(in: 0...255) / 255, alpha: 1)
            return cell
        }
    }
    
    
    
    
}

