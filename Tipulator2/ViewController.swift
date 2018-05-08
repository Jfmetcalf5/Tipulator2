//
//  ViewController.swift
//  Tipulator2
//
//  Created by Jacob Metcalf on 3/14/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let wholeViewButon = UIButton()
    let woodImage = UIImage(named: "Wood")
    var pinkTotalNote = UIImage(named: "Pink")
    var dollarSign = UILabel()
    var totalLabel = UILabel()
    var totalAmountTextField = UITextField()
    var blueTipNote = UIImage(named: "Blue")
    var tipAmountLabel = UILabel()
    var tipPriceLabel = UILabel()
    var greenGrandTotalNote = UIImage(named: "Green")
    var grandTotalLabel = UILabel()
    var grandAmountLabel = UILabel()
    var tapToAddLabel = UILabel()
    var tipNote = UIImage(named: "TipNote")
    var percentSign = UILabel()
    var addPercentButton = UIButton()
    var clearButton = UIButton()
    
    var woodBackground: UIImageView!
    var pinkNoteView: UIImageView!
    var blueNoteView: UIImageView!
    var greenNoteView: UIImageView!
    var tipNoteView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNotes()
        setUpNoteConstraints()
    }
    
    func setUpNotes() {
        
        woodBackground = UIImageView(image: woodImage)
        pinkNoteView = UIImageView(image: pinkTotalNote)
        blueNoteView = UIImageView(image: blueTipNote)
        greenNoteView = UIImageView(image: greenGrandTotalNote)
        tipNoteView = UIImageView(image: tipNote)
        addPercentButton.imageView?.image = UIImage(named: "PercentSign")

        view.addSubview(woodBackground)
        view.addSubview(pinkNoteView)
        view.addSubview(blueNoteView)
        view.addSubview(greenNoteView)
        view.addSubview(tipNoteView)
        view.addSubview(wholeViewButon)
        view.addSubview(addPercentButton)
        
        // Adding target
        addPercentButton.addTarget(self, action: #selector(addAmountAlert), for: .touchUpInside)
        wholeViewButon.addTarget(self, action: #selector(dismissKeyboardNow), for: .touchDown)
        clearButton.addTarget(self, action: #selector(resetAllText), for: .touchUpInside)
        
        // Setting up the text and whatnot
        totalLabel.text = "Total:"
        totalLabel.textColor = .black
        totalLabel.font = UIFont(name: "Marker Felt", size: 30)
        dollarSign.text = "$"
        dollarSign.textColor = .black
        dollarSign.font = UIFont(name: "Marker Felt", size: 30)
        totalAmountTextField.placeholder = "Tap here..."
        totalAmountTextField.font = UIFont(name: "Marker Felt", size: 35)
        totalAmountTextField.keyboardType = .decimalPad
        tipAmountLabel.text = "Tip Amount:"
        tipAmountLabel.textColor = .black
        tipAmountLabel.font = UIFont(name: "Marker Felt", size: 30)
        tipPriceLabel.text = "$ 0.00"
        tipPriceLabel.textColor = .black
        tipPriceLabel.font = UIFont(name: "Marker Felt", size: 30)
        grandTotalLabel.text = "Grand Total:"
        grandTotalLabel.textColor = .black
        grandTotalLabel.font = UIFont(name: "Marker Felt", size: 30)
        grandAmountLabel.text = "$ 0.00"
        grandAmountLabel.textColor = .black
        grandAmountLabel.font = UIFont(name: "Marker Felt", size: 30)
        tapToAddLabel.text = "Tap below to add %"
        tapToAddLabel.textColor = .white
        tapToAddLabel.font = UIFont(name: "Marker Felt", size: 18)
        percentSign.text = "% 0"
        percentSign.textColor = .white
        percentSign.font = UIFont(name: "Marker Felt", size: 40)
        
        clearButton.setTitle("Clear", for: .normal)
        clearButton.setTitleColor(UIColor.white, for: .normal)
        clearButton.titleLabel?.font = UIFont(name: "Marker Felt", size: 40)
        
        // Adding the lables and textx as subviews
        view.addSubview(totalLabel)
        view.addSubview(dollarSign)
        view.addSubview(totalAmountTextField)
        view.addSubview(tipAmountLabel)
        view.addSubview(tipPriceLabel)
        view.addSubview(grandTotalLabel)
        view.addSubview(grandAmountLabel)
        view.addSubview(tapToAddLabel)
        view.addSubview(percentSign)
        view.addSubview(clearButton)
    }
    
    func setUpNoteConstraints() {
        
        wholeViewButon.translatesAutoresizingMaskIntoConstraints = false
        woodBackground.translatesAutoresizingMaskIntoConstraints = false
        pinkNoteView.translatesAutoresizingMaskIntoConstraints = false
        blueNoteView.translatesAutoresizingMaskIntoConstraints = false
        greenNoteView.translatesAutoresizingMaskIntoConstraints = false
        tipNoteView.translatesAutoresizingMaskIntoConstraints = false
        addPercentButton.translatesAutoresizingMaskIntoConstraints = false
        
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        dollarSign.translatesAutoresizingMaskIntoConstraints = false
        totalAmountTextField.translatesAutoresizingMaskIntoConstraints = false
        tipAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        tipPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        grandTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        grandAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        tapToAddLabel.translatesAutoresizingMaskIntoConstraints = false
        percentSign.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Set up background
        let woodHeight = NSLayoutConstraint(item: woodBackground, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0)
        let woodWidth = NSLayoutConstraint(item: woodBackground, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
        
        let wholeViewHeight = NSLayoutConstraint(item: wholeViewButon, attribute: .height, relatedBy: .equal, toItem: view, attribute: .height, multiplier: 1, constant: 0)
        let wholeViewWidth = NSLayoutConstraint(item: wholeViewButon, attribute: .width, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
        
        view.addConstraints([woodHeight, woodWidth, wholeViewHeight, wholeViewWidth])
        
        // Set up note heights
        let pinkHeight = NSLayoutConstraint(item: pinkNoteView, attribute: .height, relatedBy: .equal, toItem: blueNoteView, attribute: .height, multiplier: 1, constant: 0)
        let blueHeight = NSLayoutConstraint(item: blueNoteView, attribute: .height, relatedBy: .equal, toItem: greenNoteView, attribute: .height, multiplier: 1, constant: 0)
        let greenHeight = NSLayoutConstraint(item: greenNoteView, attribute: .height, relatedBy: .equal, toItem: blueNoteView, attribute: .height, multiplier: 1, constant: 0)
        
        view.addConstraints([pinkHeight, blueHeight, greenHeight])
        
        // Set up spacing
        let pinkTop = NSLayoutConstraint(item: pinkNoteView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 35)
        let pinkLeading = NSLayoutConstraint(item: pinkNoteView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 30)
        let pinkTrailing = NSLayoutConstraint(item: pinkNoteView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -30)
        
        let blueTop = NSLayoutConstraint(item: blueNoteView, attribute: .top, relatedBy: .equal, toItem: pinkNoteView, attribute: .bottom, multiplier: 1, constant: 20)
        let blueLeading = NSLayoutConstraint(item: blueNoteView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 30)
        let blueWidth = NSLayoutConstraint(item: blueNoteView, attribute: .width, relatedBy: .equal, toItem: pinkNoteView, attribute: .width, multiplier: 1, constant: 0)
        
        let greenTop = NSLayoutConstraint(item: greenNoteView, attribute: .top, relatedBy: .equal, toItem: blueNoteView, attribute: .bottom, multiplier: 1, constant: 20)
        let greenLeading = NSLayoutConstraint(item: greenNoteView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 30)
        let greenWidth = NSLayoutConstraint(item: greenNoteView, attribute: .width, relatedBy: .equal, toItem: blueNoteView, attribute: .width, multiplier: 1, constant: 0)
        
        let tipTop = NSLayoutConstraint(item: tipNoteView, attribute: .top, relatedBy: .equal, toItem: greenNoteView, attribute: .bottom, multiplier: 1, constant: 90)
        let tipBottom = NSLayoutConstraint(item: tipNoteView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -30)
        let tipLeading = NSLayoutConstraint(item: tipNoteView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 150)
        let tipTrailing = NSLayoutConstraint(item: tipNoteView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50)
        
        let percentButtonTop = NSLayoutConstraint(item: addPercentButton, attribute: .top, relatedBy: .equal, toItem: tipNoteView, attribute: .top, multiplier: 1, constant: 8)
        let percentButtonLeading = NSLayoutConstraint(item: addPercentButton, attribute: .leading, relatedBy: .equal, toItem: tipNoteView, attribute: .leading, multiplier: 1, constant: 0)
        let percentButtonTrailing = NSLayoutConstraint(item: addPercentButton, attribute: .trailing, relatedBy: .equal, toItem: tipNoteView, attribute: .trailing, multiplier: 1, constant: -15)
        let percentButtonBottom = NSLayoutConstraint(item: addPercentButton, attribute: .bottom, relatedBy: .equal, toItem: tipNoteView, attribute: .bottom, multiplier: 1, constant: -15)
        
        let clearLeading = NSLayoutConstraint(item: clearButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: -15)
        let clearTop = NSLayoutConstraint(item: clearButton, attribute: .top, relatedBy: .equal, toItem: greenNoteView, attribute: .bottom, multiplier: 1, constant: 20)
        let clearTrailing = NSLayoutConstraint(item: clearButton, attribute: .trailing, relatedBy: .equal, toItem: tipNoteView, attribute: .leading, multiplier: 1, constant: 8)
        let clearHeight = NSLayoutConstraint(item: clearButton, attribute: .height, relatedBy: .equal, toItem: clearButton, attribute: .width, multiplier: 1, constant: 40)
        
        view.addConstraints([pinkTop, pinkLeading, pinkTrailing, blueTop, blueLeading, blueWidth, greenTop, greenLeading, greenWidth, tipTop,tipBottom, tipLeading, tipTrailing, percentButtonTop, percentButtonLeading, percentButtonTrailing, percentButtonBottom, clearLeading, clearTop, clearTrailing, clearHeight])
        
        // Set up Lable's constraints
        let totalLabelTop = NSLayoutConstraint(item: totalLabel, attribute: .top, relatedBy: .equal, toItem: pinkNoteView, attribute: .top, multiplier: 1, constant: 12)
        let totalLabelLeading = NSLayoutConstraint(item: totalLabel, attribute: .leading, relatedBy: .equal, toItem: pinkNoteView, attribute: .leading, multiplier: 1, constant: 8)
        let dollarSigntop = NSLayoutConstraint(item: dollarSign, attribute: .top, relatedBy: .equal, toItem: totalAmountTextField, attribute: .top, multiplier: 1, constant: 0)
        let dollarSignTrailing = NSLayoutConstraint(item: dollarSign, attribute: .trailing, relatedBy: .equal, toItem: totalAmountTextField, attribute: .leading, multiplier: 1, constant: -5)
        let totalAmountTop = NSLayoutConstraint(item: totalAmountTextField, attribute: .top, relatedBy: .equal, toItem: totalLabel, attribute: .bottom, multiplier: 1, constant: 2)
        let totalAmountLeading = NSLayoutConstraint(item: totalAmountTextField, attribute: .leading, relatedBy: .equal, toItem: pinkNoteView, attribute: .leading, multiplier: 1, constant: 90)
        
        let tipAmountTop = NSLayoutConstraint(item: tipAmountLabel, attribute: .top, relatedBy: .equal, toItem: blueNoteView, attribute: .top, multiplier: 1, constant: 12)
        let tipAmountLeading = NSLayoutConstraint(item: tipAmountLabel, attribute: .leading, relatedBy: .equal, toItem: blueNoteView, attribute: .leading, multiplier: 1, constant: 8)
        let tipPriceTop = NSLayoutConstraint(item: tipPriceLabel, attribute: .top, relatedBy: .equal, toItem: tipAmountLabel, attribute: .bottom, multiplier: 1, constant: 2)
        let tipPriceLeading = NSLayoutConstraint(item: tipPriceLabel, attribute: .leading, relatedBy: .equal, toItem: blueNoteView, attribute: .leading, multiplier: 1, constant: 200)
        
        let grandTotalTop = NSLayoutConstraint(item: grandTotalLabel, attribute: .top, relatedBy: .equal, toItem: greenNoteView, attribute: .top, multiplier: 1, constant: 12)
        let grandTotalLeading = NSLayoutConstraint(item: grandTotalLabel, attribute: .leading, relatedBy: .equal, toItem: greenNoteView, attribute: .leading, multiplier: 1, constant: 8)
        let grandAmountTop = NSLayoutConstraint(item: grandAmountLabel, attribute: .top, relatedBy: .equal, toItem: grandTotalLabel, attribute: .bottom, multiplier: 1, constant: 2)
        let grandAmountLeading = NSLayoutConstraint(item: grandAmountLabel, attribute: .leading, relatedBy: .equal, toItem: greenNoteView, attribute: .leading, multiplier: 1, constant: 200)
        
        let tapLabelbottom = NSLayoutConstraint(item: tapToAddLabel, attribute: .bottom, relatedBy: .equal, toItem: tipNoteView, attribute: .top, multiplier: 1, constant: 0)
        let tapLabelLeading = NSLayoutConstraint(item: tapToAddLabel, attribute: .leading, relatedBy: .equal, toItem: tipNoteView, attribute: .leading, multiplier: 1, constant: 20)
        
        let percentSignHeight = NSLayoutConstraint(item: percentSign, attribute: .height, relatedBy: .equal, toItem: tipNoteView, attribute: .height, multiplier: 0.9, constant: 0)
        let percentSignTop = NSLayoutConstraint(item: percentSign, attribute: .top, relatedBy: .equal, toItem: tipNoteView, attribute: .top, multiplier: 1, constant: -5)
        let percentSignLeading = NSLayoutConstraint(item: percentSign, attribute: .leading, relatedBy: .equal, toItem: tipNoteView, attribute: .leading, multiplier: 1, constant: 40)
        
        view.addConstraints([totalLabelTop, totalLabelLeading, dollarSigntop, dollarSignTrailing, totalAmountTop, totalAmountLeading, tipAmountTop, tipAmountLeading, tipPriceTop, tipPriceLeading, grandTotalTop, grandTotalLeading, grandAmountTop, grandAmountLeading, tapLabelbottom, tapLabelLeading, percentSignHeight, percentSignTop, percentSignLeading])
    }
    
    @objc func calculateThe(total: Double, with percent: Int) -> Double {
        let total = total
        let tipPercent: Double = Double(percent) / 100
        
        let tipAmount = total * tipPercent
        let totalAmount = tipAmount + total
        return totalAmount.rounded(toPlaces: 2)
    }
    
    @objc func calculateTipWith(total: Double, with percent: Int) -> Double {
        let total = total
        let tipPercent: Double = Double(percent) / 100
        let tipAmount = total * tipPercent
        return tipAmount.rounded(toPlaces: 2)
    }
    
    @objc func addAmountAlert() {
        let amountAlert = UIAlertController(title: "Tip Percent", message: "Type the percent you would like to tip", preferredStyle: .alert)
        
        var percentTextField: UITextField?
        amountAlert.addTextField { (percentField) in
            percentTextField = percentField
            percentTextField?.keyboardType = .decimalPad
        }
        
        let okAction = UIAlertAction(title: "Done", style: .default) { (_) in
            guard let totalString = self.totalAmountTextField.text, totalString != "" else {
                self.forgotTotal()
                return }
                guard let total = Double(totalString),
                let percentString = percentTextField?.text, percentString != "",
                let percent = Int(percentString),
            let wholePercent = percentTextField?.text, wholePercent != "" else { return }
            
            let calcTotal = self.calculateThe(total: total, with: percent)
            self.grandAmountLabel.text = "$ \(calcTotal)"
            
            let calcTip = self.calculateTipWith(total: total, with: percent)
            self.tipPriceLabel.text = "$ \(calcTip)"
            
            self.percentSign.text = "%" + " " + wholePercent
        }
        
        amountAlert.addAction(okAction)
        
        present(amountAlert, animated: true, completion: nil)
    }
    
    @objc func forgotTotal() {
        let alert = UIAlertController(title: "Unknown Total", message: "Please enter a total at the top", preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(OKAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func dismissKeyboardNow() {
        view.endEditing(true)
    }
    
    @objc func resetAllText() {
        totalAmountTextField.text = ""
        tipPriceLabel.text = "$ 0.00"
        grandAmountLabel.text = "$ 0.00"
        percentSign.text = "% 0"
        
        
        //////////// NEED TO EDIT THIS
    }
}
