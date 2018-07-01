//
//  ViewController.swift
//  CustomizableBlurEffectDemo
//
//  Created by Tung Fam on 7/1/18.
//  Copyright © 2018 Tung Fam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Private Properties

    @IBOutlet private weak var pictureImageView: UIImageView!
    @IBOutlet private weak var pictureImageView2: UIImageView!
    @IBOutlet private weak var alphaSlider: UISlider!
    @IBOutlet private weak var alphaLabel: UILabel!

    private var backView: UIView!
    private var backView2: UIView!

    private struct Constants {
        static let alphaStartValue: Float = 1.0
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        alphaSlider.value = Constants.alphaStartValue

        backView = UIView(frame: pictureImageView.bounds)
        backView.backgroundColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: CGFloat(Constants.alphaStartValue))
        pictureImageView.addSubview(backView)

        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = pictureImageView.bounds
        pictureImageView.addSubview(blurEffectView)

        alphaLabel.text = "alpha: \(Double(round(1000*Double(alphaSlider.value))/1000))"

        backView2 = UIView(frame: pictureImageView2.bounds)
        backView2.backgroundColor = UIColor(red: 200/255, green: 0, blue: 0, alpha: CGFloat(Constants.alphaStartValue))
        pictureImageView2.addSubview(backView2)

        let blurEffect2 = UIBlurEffect(style: .light)
        let blurEffectView2 = UIVisualEffectView(effect: blurEffect2)
        blurEffectView2.frame = pictureImageView2.bounds
        pictureImageView2.addSubview(blurEffectView2)
    }

    // MARK: - Actions

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        backView.alpha = CGFloat(sender.value)
        backView2.alpha = CGFloat(sender.value)
        alphaLabel.text = "alpha: \(Double(round(100*Double(sender.value))/100))"
    }

}

