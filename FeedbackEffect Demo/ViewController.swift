//
//  ViewController.swift
//  FeedbackEffect Demo
//
//  Created by Martin Otyeka on 2017-09-15.
//  Copyright © 2017 Martin Otyeka. All rights reserved.
//

import UIKit
import FeedbackEffect

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var messageTones: [MessageTone] = []
    var soundEffects: [SoundEffect] = []
    var feedbackEffectPicker: UIPickerView!
    
    var titles = ["Message Tones", "Sound Effects"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedbackEffectPicker = UIPickerView(frame:  CGRect(x: 0, y: 64, width: self.view.bounds.width, height: self.view.bounds.height - 64))
        self.feedbackEffectPicker.delegate = self
        self.feedbackEffectPicker.dataSource = self
        self.view.addSubview(self.feedbackEffectPicker)
        
        self.soundEffects = iterateEnum(SoundEffect.self).map { $0 }
        self.messageTones = iterateEnum(MessageTone.self).map { $0 }
        
        self.addComponentLabels()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return self.messageTones.count
        default:
            return self.soundEffects.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return String(self.messageTones[row].rawValue).appending(" \(self.messageTones[row].name)")
        default:
            return String(self.soundEffects[row].rawValue).appending(" \(self.soundEffects[row].name)")
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            FeedbackEffect.play(sound: self.messageTones[row])
        case 1:
            FeedbackEffect.play(sound: self.soundEffects[row])
        default:
            break
        }
    }
    
    private func addComponentLabels() {
        let labelWidth = self.feedbackEffectPicker.frame.width / CGFloat(self.feedbackEffectPicker.numberOfComponents)
        for index in 0..<self.titles.count {
            let label: UILabel = UILabel.init(frame: CGRect(x: self.feedbackEffectPicker.frame.origin.x + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 20))
            label.text = self.titles[index]
            label.textAlignment = .center
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium)
            self.feedbackEffectPicker.addSubview(label)
        }
    }
    
}


/// Outputs an array out of an Enum
private func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
        if next.hashValue != i { return nil }
        i += 1
        return next
    }
}
