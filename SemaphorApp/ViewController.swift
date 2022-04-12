//
//  ViewController.swift
//  SemaphorApp
//
//  Created by Cheremisin Andrey on 12.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let redView = UIView()
    let yellowView = UIView()
    let greenView = UIView()
    let startButton = UIButton()
    let clearButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        setupSemaphoreSignal()
        startButtonTapped()
        clearButtonTapped()
        setupConstraints()
    }
    
    func setupSemaphoreSignal() {
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.layer.cornerRadius = 50
        redView.clipsToBounds = true
        redView.alpha = 0.1
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        yellowView.backgroundColor = .yellow
        view.addSubview(yellowView)
        yellowView.layer.cornerRadius = 50
        yellowView.clipsToBounds = true
        yellowView.alpha = 0.1
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        
        greenView.backgroundColor = .green
        view.addSubview(greenView)
        greenView.layer.cornerRadius = 50
        greenView.clipsToBounds = true
        greenView.alpha = 0.1
        greenView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        redView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        redView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        yellowView.topAnchor.constraint(equalTo: redView.topAnchor, constant: 150).isActive = true
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        greenView.topAnchor.constraint(equalTo: yellowView.topAnchor, constant: 150).isActive = true
        greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150).isActive = true
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        clearButton.topAnchor.constraint(equalTo: startButton.topAnchor, constant: 70).isActive = true
        clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
    func startButtonTapped() {
        startButton.setTitle("Start!", for: .normal)
        startButton.backgroundColor = .white
        startButton.setTitleColor(.black, for: .normal)
        startButton.isSelected = true
        view.addSubview(startButton)
        startButton.layer.cornerRadius = 15
        startButton.clipsToBounds = true
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        startButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    func clearButtonTapped() {
        clearButton.setTitle("Clear", for: .normal)
        clearButton.backgroundColor = .systemGray2
        view.addSubview(clearButton)
        clearButton.layer.cornerRadius = 7
        clearButton.clipsToBounds = true
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        clearButton.addTarget(self, action: #selector(pressClear), for: .touchUpInside)
                
    }
    @objc func pressClear() {
        greenView.alpha = 0.1
        startButton.setTitle("Start!", for: .normal)
    }
    
    @objc func pressed() {
        self.clearButton.alpha = 0.1
        self.clearButton.isEnabled = false
        
        self.startButton.isEnabled = false
        greenView.alpha = 0.1
        
        startButton.setTitle("Let's GO!!!", for: .normal)
        redView.alpha = 1
        
        delay(second: 1) {
            self.redView.alpha = 0.1
            self.yellowView.alpha = 1
        }
        delay(second: 3) {
            self.yellowView.alpha = 0.1
            self.greenView.alpha = 1
            self.startButton.setTitle("Start!", for: .normal)
            self.startButton.isEnabled = true
            
            self.clearButton.alpha = 1
            self.clearButton.isEnabled = true
        }
    }
    
    func delay( second: Int, queue: DispatchQueue = DispatchQueue.main, complition: @escaping () -> ()) {
        queue.asyncAfter(deadline: .now() + .seconds(second)) {
            complition()
        }
    }
}
