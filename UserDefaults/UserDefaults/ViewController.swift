//
//  ViewController.swift
//  UserDefaults
//
//  Created by Настя Сарамуд on 08.03.2024.
//

import UIKit


class ViewController: UIViewController  {

    let defaults = UserDefaults.standard
    var key = "color"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedColor = UserDefaults.standard.color(forKey: key) {
            view.backgroundColor = savedColor
        }

    }

    @IBAction func pressButton(_ sender: Any) {
   
        
        let colorRandom = UIColor(red: .random(in: 0...1),
                                  green: .random(in: 0...1),
                                  blue: .random(in: 0...1),
                                  alpha: 1)
        
        view.backgroundColor = colorRandom
        
        UserDefaults.standard.setColor(colorRandom, forKey: key)

    }

}


extension UserDefaults {
    
    func setColor(_ color: UIColor?, forKey key: String) {
            guard let color = color else { return }
            let data = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
            set(data, forKey: key)
        }
    
        
        func color(forKey key: String) -> UIColor? {
            guard let data = UserDefaults.standard.object(forKey: key) as? Data else {return nil}
            let decodedModel = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
            return decodedModel
            
        }
    
    }
            
    

