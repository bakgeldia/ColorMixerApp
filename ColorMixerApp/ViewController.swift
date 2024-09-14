//
//  ViewController.swift
//  ColorMixerApp
//
//  Created by Bakgeldi Alkhabay on 15.09.2024.
//

import UIKit

class ViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    private let titleLabel = UILabel()
    private let firstColorLabel = UILabel()
    private let secondColorLabel = UILabel()
    private let resultColorLabel = UILabel()
    private let plusLabel = UILabel()
    private let equalLabel = UILabel()
    
    private let firstColorView = UIView()
    private let secondColorView = UIView()
    private let resultColorView = UIView()

    private var color1 = UIColor()
    private var color2 = UIColor()
    
    private var selectedColorView: UIView?
    private var selectedColorLabel: UILabel?
    
    private let languageSwitch = UISwitch()
    private let languageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        addTapRecognizer()
        setupLanguageSwitcher()
        
        let isEnglish = UserDefaults.standard.bool(forKey: "isEnglish")
        languageSwitch.isOn = isEnglish
        updateLanguage(isEnglish: isEnglish)
    }
    
    private func setupView() {
        titleLabel.text = "MixColors"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        firstColorLabel.text = "Color 1"
        firstColorLabel.textColor = .black
        firstColorLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        firstColorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstColorLabel)
        
        firstColorView.layer.borderColor = UIColor.black.cgColor
        firstColorView.layer.borderWidth = 1
        firstColorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(firstColorView)
        
        plusLabel.text = "+"
        plusLabel.textColor = .black
        plusLabel.font = UIFont.systemFont(ofSize: 50, weight: .regular)
        plusLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusLabel)
        
        secondColorLabel.text = "Color 2"
        secondColorLabel.textColor = .black
        secondColorLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        secondColorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondColorLabel)
        
        secondColorView.layer.borderColor = UIColor.black.cgColor
        secondColorView.layer.borderWidth = 1
        secondColorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondColorView)
        
        equalLabel.text = "="
        equalLabel.textColor = .black
        equalLabel.font = UIFont.systemFont(ofSize: 50, weight: .regular)
        equalLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(equalLabel)
        
        resultColorView.layer.borderColor = UIColor.black.cgColor
        resultColorView.layer.borderWidth = 1
        resultColorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultColorView)
        
        resultColorLabel.text = "Mixed Color"
        resultColorLabel.textColor = .black
        resultColorLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        resultColorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultColorLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            firstColorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            firstColorLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            firstColorView.topAnchor.constraint(equalTo: firstColorLabel.bottomAnchor, constant: 5),
            firstColorView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            firstColorView.heightAnchor.constraint(equalToConstant: 100),
            firstColorView.widthAnchor.constraint(equalToConstant: 100),
            
            plusLabel.topAnchor.constraint(equalTo: firstColorView.bottomAnchor, constant: 20),
            plusLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            secondColorLabel.topAnchor.constraint(equalTo: plusLabel.bottomAnchor, constant: 20),
            secondColorLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            secondColorView.topAnchor.constraint(equalTo: secondColorLabel.bottomAnchor, constant: 5),
            secondColorView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            secondColorView.heightAnchor.constraint(equalToConstant: 100),
            secondColorView.widthAnchor.constraint(equalToConstant: 100),
            
            equalLabel.topAnchor.constraint(equalTo: secondColorView.bottomAnchor, constant: 20),
            equalLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            resultColorLabel.topAnchor.constraint(equalTo: equalLabel.bottomAnchor, constant: 20),
            resultColorLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            resultColorView.topAnchor.constraint(equalTo: resultColorLabel.bottomAnchor, constant: 5),
            resultColorView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            resultColorView.heightAnchor.constraint(equalToConstant: 100),
            resultColorView.widthAnchor.constraint(equalToConstant: 100),
        ])
        
    }
    
    private func setupLanguageSwitcher() {
        languageSwitch.addTarget(self, action: #selector(languageSwitchChanged(_:)), for: .valueChanged)
        languageSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(languageSwitch)
        
        languageLabel.text = "RU | EN"
        languageLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        languageLabel.textColor = .black
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(languageLabel)
        
        NSLayoutConstraint.activate([
            languageSwitch.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            languageSwitch.topAnchor.constraint(equalTo: resultColorView.bottomAnchor, constant: 10),
            
            languageLabel.topAnchor.constraint(equalTo: languageSwitch.bottomAnchor, constant: 5),
            languageLabel.centerXAnchor.constraint(equalTo: languageSwitch.centerXAnchor)
        ])
    }
    
    @objc private func languageSwitchChanged(_ sender: UISwitch) {
        let isEnglish = sender.isOn
        UserDefaults.standard.set(isEnglish, forKey: "isEnglish")
        updateLanguage(isEnglish: isEnglish)
    }
    
    private func updateLanguage(isEnglish: Bool) {
        firstColorLabel.text = isEnglish ? "Color 1" : "Цвет 1"
        secondColorLabel.text = isEnglish ? "Color 2" : "Цвет 2"
        resultColorLabel.text = isEnglish ? "Mixed Color" : "Смешанный цвет"
    }
    
    private func addTapRecognizer() {
        let tapGestureFirst = UITapGestureRecognizer(target: self, action: #selector(openColorPicker(_:)))
        firstColorView.addGestureRecognizer(tapGestureFirst)
        
        let tapGestureSecond = UITapGestureRecognizer(target: self, action: #selector(openColorPicker(_:)))
        secondColorView.addGestureRecognizer(tapGestureSecond)
    }
    
    @objc private func openColorPicker(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }
        
        selectedColorView = tappedView
        selectedColorLabel = (tappedView == firstColorView) ? firstColorLabel : secondColorLabel
        
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        colorPicker.selectedColor = tappedView.backgroundColor ?? .white
        present(colorPicker, animated: true, completion: nil)
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        selectedColorView?.backgroundColor = viewController.selectedColor
        
        let colorName = hexStringFromColor(viewController.selectedColor)
        selectedColorLabel?.text = colorName
        updateMixedColor()
    }
    
    private func hexStringFromColor(_ color: UIColor) -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let r = Int(red * 255)
        let g = Int(green * 255)
        let b = Int(blue * 255)
        
        return String(format: "#%02X%02X%02X", r, g, b)
    }
    
    private func mixColors(_ color1: UIColor, _ color2: UIColor) -> UIColor {
        var red1: CGFloat = 0
        var green1: CGFloat = 0
        var blue1: CGFloat = 0
        var alpha1: CGFloat = 0
        
        var red2: CGFloat = 0
        var green2: CGFloat = 0
        var blue2: CGFloat = 0
        var alpha2: CGFloat = 0
        
        color1.getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
        color2.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        
        let mixedRed = (red1 + red2) / 2
        let mixedGreen = (green1 + green2) / 2
        let mixedBlue = (blue1 + blue2) / 2
        
        return UIColor(red: mixedRed, green: mixedGreen, blue: mixedBlue, alpha: 1.0)
    }
    
    private func updateMixedColor() {
        let color1 = firstColorView.backgroundColor ?? .white
        let color2 = secondColorView.backgroundColor ?? .white
        
        let mixedColor = mixColors(color1, color2)
        resultColorView.backgroundColor = mixedColor
        
        resultColorLabel.text = hexStringFromColor(mixedColor)
    }
}

#Preview {
    ViewController()
}
