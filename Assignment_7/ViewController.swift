//
//  ViewController.swift
//  Assignment_7
//
//  Created by E5000861 on 29/05/24.
//
//Label, Button, TextField, Slider, Switch, ImageView, Segmented Control etc.
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var label = UILabel()
    var textfield = UITextField()
    var button = UIButton()
    var imageView = UIImageView()
    var sliderDemo = UISlider()
    var switchDemo = UISwitch()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        textfield.delegate = self
    }
    
    func setupUI() {
        showLabel()
        showTextField()
        showButton()
        showImage()
        showSlider()
        showSwitch()
    }


    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        for character in string {
            if !allowedCharacterSet.contains(UnicodeScalar(String(character))!) {
                return false
            }
        }
        return true
    }

    // MARK: - UI Creation Methods

    func showLabel() {
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        view.addSubview(label)
        
        // Constraints
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            label.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func showTextField() {
        textfield.placeholder = "Enter your name"
        textfield.textColor = .black
        textfield.borderStyle = .roundedRect
        textfield.keyboardType = .default
        textfield.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textfield)
        
        // Constraints
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            textfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            textfield.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func showButton() {
        button.setTitle("Click", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        // Constraints
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

    func showImage() {
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        // Constraints
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    func showSlider() {
        sliderDemo.minimumValue = 0.0
        sliderDemo.maximumValue = 100.0
        sliderDemo.isContinuous = true
        sliderDemo.tintColor = .black
        sliderDemo.value = 50.0
        sliderDemo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sliderDemo)
        
        // Constraints
        NSLayoutConstraint.activate([
            sliderDemo.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            sliderDemo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sliderDemo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        sliderDemo.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }

    func showSwitch() {
        switchDemo.isOn = true
        switchDemo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(switchDemo)
        
        // Constraints
        NSLayoutConstraint.activate([
            switchDemo.topAnchor.constraint(equalTo: sliderDemo.bottomAnchor, constant: 20),
            switchDemo.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        switchDemo.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
    }
    
    @objc func buttonPressed() {
        if let text = textfield.text {
            label.text = "Hello, \(text)"
        }
    }

    @objc func sliderValueChanged(sender: UISlider) {
        let sliderValue = min(max(sender.value, 0), 100)
        let normalizedValue = CGFloat(sliderValue) / 100.0
        let colorValue = normalizedValue * 0.5
        imageView.backgroundColor = UIColor(red: colorValue, green: colorValue, blue: colorValue, alpha: 1.0)
    }

    @objc func switchValueChanged(sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0) // Dark blue
        } else {
            view.backgroundColor = .lightGray
        }
    }
}
