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
    
    
    
    let converters = [Converter(label: "Fahrenheit to Celsius", inputUnit: "°F", outputUnit:                   "°C"),
                      Converter(label: "Celsius to Fahrenheit", inputUnit: "°C", outputUnit: "°F" ),
                      Converter(label: "Miles to Kilometers", inputUnit: "mi", outputUnit: "km"),
                      Converter(label: "Kilometers to Miles", inputUnit: "km", outputUnit: "mi")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.outputDisplay.text = "" + self.converters[0].outputUnit
        self.inputDisplay.text = "" + self.converters[0].inputUnit
        // Do any additional setup after loading the view.
    }
    
    @IBAction func converterButton(_ sender: Any) {
        let conversion = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        conversion.addAction(UIAlertAction(title: converters[0].label, style: UIAlertAction.Style.default, handler: {(conversion: UIAlertAction) -> Void in
            self.outputDisplay.text = self.converters[0].outputUnit
            self.inputDisplay.text = self.converters[0].inputUnit
            self.currentConv = 0
            
        }))
        
        conversion.addAction(UIAlertAction(title: converters[1].label, style: UIAlertAction.Style.default, handler: {(conversion: UIAlertAction) -> Void in
            self.outputDisplay.text = self.converters[1].outputUnit
            self.inputDisplay.text = self.converters[1].inputUnit
            self.currentConv = 1
            
        }))
        
        conversion.addAction(UIAlertAction(title: converters[2].label, style: UIAlertAction.Style.default, handler: {(conversion: UIAlertAction) -> Void in
            self.outputDisplay.text = self.converters[2].outputUnit
            self.inputDisplay.text = self.converters[2].inputUnit
            self.currentConv = 2
        }))
        
        conversion.addAction(UIAlertAction(title: converters[3].label, style: UIAlertAction.Style.default, handler: {(conversion: UIAlertAction) -> Void in
            self.outputDisplay.text = self.converters[3].outputUnit
            self.inputDisplay.text = self.converters[3].inputUnit
            self.currentConv = 3
        }))
        
        self.present(conversion, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func clearButton(_ sender: Any) {
        self.inputDisplay.text = self.converters[0].inputUnit
        self.outputDisplay.text = self.converters[0].outputUnit
    }
    
    
    @IBAction func numberClick(_ sender: UIButton) {
        if sender.titleLabel!.text != "."{
            inputDisplay.text = inputDisplay.text! + sender.titleLabel!.text!
        } else{
            inputDisplay.text = inputDisplay.text! + "."
        }
        
        
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
