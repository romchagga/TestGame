//
//  SelectionNumber.swift
//  TestGame
//
//  Created by macbook on 04.02.2023.
//

import Foundation
import UIKit

class SelectionNumber: UIViewController {
    
    let selectNumberButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter the number", for: .normal)
        button.backgroundColor = .purple
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        return button
    }()
    
    let textField: UITextField = {
        let textFIeld = UITextField()
        textFIeld.translatesAutoresizingMaskIntoConstraints = false
        textFIeld.textAlignment = .center
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        let attributedPlaceholder = NSAttributedString(string: "Guess the number", attributes: [NSAttributedString.Key.paragraphStyle: centeredParagraphStyle])
        textFIeld.layer.masksToBounds = true
        textFIeld.layer.cornerRadius = 20
        textFIeld.layer.borderColor = UIColor.lightGray.cgColor
        textFIeld.layer.borderWidth = 1
        textFIeld.attributedPlaceholder = attributedPlaceholder
        textFIeld.keyboardType = .numberPad
        return textFIeld
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViews()
        
        selectNumberButton.addTarget(self, action: #selector(selectNumberButtonTapped), for: .touchUpInside)
    }
    
    @objc func selectNumberButtonTapped() {
        if let text = textField.text, !text.isEmpty {
            if (0...100).contains(Int(text)!) {
                navigationController?.pushViewController(BotAttempt(), animated: true)
            } else {
                customAlert(text: "Загадайте число от 0 до 100!")
            }
        } else {
            customAlert(text: "Вы не загадали число")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        textField.resignFirstResponder()
    }
    
    func customAlert(text: String) {
        let alertController = UIAlertController(title: "Ошибка", message: text, preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(actionOK)
        
        present(alertController, animated: true)
    }
    
    func configViews() {
        view.backgroundColor = .white
        view.addSubview(selectNumberButton)
        view.addSubview(textField)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            selectNumberButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectNumberButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            selectNumberButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3)
        ])
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textField.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
}
