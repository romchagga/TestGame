//
//  ViewController.swift
//  TestGame
//
//  Created by macbook on 02.02.2023.
//

import UIKit

class StartScreen: UIViewController {
    
    let startLabel: UILabel = {
        let label = UILabel()
        label.text = "My awesome Game"
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start New Game", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
            configViews()
       
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc func startButtonTapped() {
        navigationController?.pushViewController(SelectionNumber(), animated: true)
    }

    func configViews() {
        view.backgroundColor = .white
        view.addSubview(startLabel)
        view.addSubview(startButton)
        setConstraints()
        
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            startLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            startLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            startLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/3)
        ])
    }

}

