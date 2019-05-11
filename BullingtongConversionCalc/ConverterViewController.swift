//
//  ConverterViewController.swift
//  BullingtongConversionCalc
//
//  Created by Graeson Bullington on 4/8/19.
//  Copyright © 2019 Graeson Bullington. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    @IBOutlet weak var outputDisplay: UITextField!
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    var currentConv: Int = 0
    
    var inputNumber = 0.0
    var sign = false
    
   
    
    
    
    
    
    
    let converters = [Converter(label: "Fahrenheit to Celsius", inputUnit: "°F", outputUnit:                   "°C"),
                      Converter(label: "Celsius to Fahrenheit", inputUnit: "°C", outputUnit: "°F" ),
                      Converter(label: "Miles to Kilometers", inputUnit: "mi", outputUnit: "km"),
                      Converter(label: "Kilometers to Miles", inputUnit: "km", outputUnit: "mi")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputDisplay.text = converters[currentConv].outputUnit
        inputDisplay.text = converters[currentConv].inputUnit
        // Do any additional setup after loading the view.
    }
    
    @IBAction func converterButton(_ sender: Any) {
        let conversion = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        conversion.addAction(UIAlertAction(title: converters[0].label, style: UIAlertAction.Style.default, handler: {(conversion: UIAlertAction) -> Void in
            self.currentConv = 0
            self.outputDisplay.text = self.converters[self.currentConv].outputUnit
            self.inputDisplay.text = self.converters[self.currentConv].inputUnit
            
            
        }))
        
        conversion.addAction(UIAlertAction(title: converters[1].label, style: UIAlertAction.Style.default, handler: {(conversion: UIAlertAction) -> Void in
            self.currentConv = 1
            self.outputDisplay.text = self.converters[self.currentConv].outputUnit
            self.inputDisplay.text = self.converters[self.currentConv].inputUnit
            
            
        }))
        
        conversion.addAction(UIAlertAction(title: converters[self.currentConv].label, style: UIAlertAction.Style.default, handler: {(conversion: UIAlertAction) -> Void in
            self.currentConv = 2
            self.outputDisplay.text = self.converters[self.currentConv].outputUnit
            self.inputDisplay.text = self.converters[self.currentConv].inputUnit
            
        }))
        
        conversion.addAction(UIAlertAction(title: converters[3].label, style: UIAlertAction.Style.default, handler: {(conversion: UIAlertAction) -> Void in
            self.currentConv = 3
            self.outputDisplay.text = self.converters[self.currentConv].outputUnit
            self.inputDisplay.text = self.converters[self.currentConv].inputUnit
            
        }))
        
        self.present(conversion, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func clearButton(_ sender: Any) {
        inputDisplay.text = "" + converters[currentConv].inputUnit
        outputDisplay.text = "" + converters[currentConv].outputUnit
        inputNumber = 0
    }
    
    
    @IBAction func numberClick(_ sender: UIButton) {
        if sender.currentTitle! != "." {
            if let text = inputDisplay.text{
                //index += index
                inputDisplay.text?.insert(contentsOf: sender.currentTitle!, at: text.index(text.endIndex, offsetBy: -2))
                let dubNum = Double(sender.currentTitle!)!
                inputNumber = dubNum + inputNumber
                conversions()
            }
            
        }else{
            if let text = inputDisplay.text{
                
                inputDisplay.text?.insert(".", at: text.index(text.endIndex, offsetBy: -2))
                //index += index
                //inputNumber = Double(text)
                conversions()
            }
            
        }

    }
    
    
    @IBAction func signChange(_ sender: UIButton) {
        if let text = inputDisplay.text{
            inputNumber = inputNumber * -1
            inputDisplay.text?.insert("-", at: text.startIndex)
            conversions()
        }else{
            inputDisplay.text = "-" + converters[currentConv].inputUnit
        }
       
        
    }
    func f2C(_ fahrenheit: Double) -> Double {
        return ((fahrenheit - 32) * (5/9))
    }
    func c2F(_ celcius: Double) -> Double {
        return celcius * (9/5) + 32
    }
    func km2Mi(_ kilometers: Double) -> Double {
        return 0.62 * kilometers
    }
    func mi2Km(_ miles: Double) -> Double {
        return miles * 1.61
    }
    
    func conversions() {
       
            
            var outNum: Double
            
            switch currentConv{
            case 0:
                outNum = f2C(inputNumber)
            case 1:
                outNum = c2F(inputNumber)
            case 2:
                outNum = mi2Km(inputNumber)
            case 3:
                outNum = km2Mi(inputNumber)
            default:
                return
            }
            
            
            outputDisplay.text = "\(outNum)"
        
    }
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
