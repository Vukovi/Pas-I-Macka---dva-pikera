//
//  ViewController.swift
//  vladinaAplikacija
//
//  Created by Vuk on 5/28/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var psi = ["Žuća","Mališa","Bleki","Džeki","Cuki"]
    var macke = ["Simonida","Persida","Gerta"]
    
    @IBOutlet weak var pikerPasa: UIPickerView!
    @IBOutlet weak var pikerMacaka: UIPickerView!
    
    @IBOutlet weak var dodajPsa: UITextField!
    @IBOutlet weak var dodajMacku: UITextField!
    
    var izabraniPas: Int?
    var izabranaMacka: Int?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pikerPasa {
            return psi.count
        }
        else if pickerView == pikerMacaka{
            return macke.count
        }
        else{
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pikerPasa {
            return psi[row]
        }
        else if pickerView == pikerMacaka {
            return macke[row]
        }
        else{
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pikerPasa {
            izabraniPas = row
            pikerPasa.reloadAllComponents()
        }
        if pickerView == pikerMacaka {
            izabranaMacka = row
            pikerMacaka.reloadAllComponents()
        }
    }
    
    @IBAction func izbrisi(_ sender: AnyObject) {
        //if let brisatiPsa = izabraniPas {
        if izabraniPas != nil {
            izabranaMacka = nil
            psi.remove(at: izabraniPas!)
            pikerPasa.reloadAllComponents()
            izabraniPas = nil
        }
        //if let brisatiMacku = izabranaMacka {
        if izabranaMacka != nil {
            izabraniPas = nil
            macke.remove(at: izabranaMacka!)
            pikerMacaka.reloadAllComponents()
            izabranaMacka = nil
        }
        
    }
    
    @IBAction func sacuvaj(_ sender: AnyObject) {
        if dodajPsa.text != "" {
            psi.append(dodajPsa.text!)
            pikerPasa.reloadAllComponents()
            dodajPsa.text = ""
        }
        if dodajMacku.text != "" {
            macke.append(dodajMacku.text!)
            pikerMacaka.reloadAllComponents()
            dodajMacku.text = ""
        }
    }
    


}

