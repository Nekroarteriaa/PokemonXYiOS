//
//  PokemonIDCardTableViewCell.swift
//  PokemonXYiOS
//
//  Created by Olaf Gomez on 21/09/2020.
//  Copyright © 2020 Olaf Gomez. All rights reserved.
//

import UIKit
import CCGradient
import Alamofire
import AlamofireImage

class PokemonIDCardTableViewCell: UITableViewCell {
    
    var gradientView = CCGradientView()
    
    //@IBOutlet weak var tryImage: UIImageView!
    @IBOutlet weak var PokemonImage: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var MainTypeLabel: UILabel!
    @IBOutlet weak var SecondTypeLabel: UILabel!
    
    @IBOutlet weak var MainTypeImage: UIImageView!
    @IBOutlet weak var SecondTypeImage: UIImageView!
    
    /*@IBOutlet weak var backgroundType: UIImageView!*/
    
    var backgroundGradient: [UIColor]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        setLabelCharacteristics()
    }
    
    
    func setIDCardBackground()
    {
        
        contentView.addSubview(gradientView)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        gradientView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        gradientView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        contentView.sendSubviewToBack(gradientView)
        gradientView.configuration = self
        
        
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabelCharacteristics()
    {
        NameLabel.setCharacterSpacing(2.5)
        IDLabel.setCharacterSpacing(2.5)
        MainTypeLabel.setCharacterSpacing(2.5)
        SecondTypeLabel.setCharacterSpacing(2.5)
        
        
        
        
    }
    
    func hideContentbyTypes(types: [String])
    {
        MainTypeLabel.text = types[0]
        MainTypeImage.image = PokeBank.shared.getPokemonTypeImage(type: types[0])
        
        MainTypeLabel.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
       /* MainTypeLabel.layer.cornerRadius = MainTypeImage.frame.size.height / 2*/
        
       /*
        backgroundType.layer.position.y = MainTypeLabel.layer.position.y
        backgroundType.backgroundColor = UIColor.red
        backgroundType.frame.size.height = MainTypeLabel.frame.size.height
         */
        
        if types.count > 1
        {
            SecondTypeLabel.isHidden = false
            SecondTypeLabel.text = types[1]
            SecondTypeImage.isHidden = false
            SecondTypeImage.image = PokeBank.shared.getPokemonTypeImage(type: types[1])
        }
        
        else
        {
            SecondTypeLabel.isHidden = true
            SecondTypeImage.isHidden = true
        }
        
        backgroundGradient = PokeBank.shared.getPokemonIDCardBackgroundColor(types: types)
        
        setIDCardBackground()
    }
    

}

extension UILabel{
func setCharacterSpacing(_ spacing: CGFloat){
    let attributedStr = NSMutableAttributedString(string: self.text ?? "")
    attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, attributedStr.length))
    self.attributedText = attributedStr
 }
}

extension UILabel {
  func addCharacterSpacing(kernValue: Double = 1.15) {
    if let labelText = text, labelText.count > 0 {
      let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
      attributedText = attributedString
    }
  }
}

extension PokemonIDCardTableViewCell: CCGradientViewConfiguration {
    public func configurationForGradientView(_ gradientView: CCGradientView) -> CCGradientConfiguration {
        
        /*let color4 = UIColor(red: 247, green: 122, blue: 38)
        let color5 = UIColor(red: 251, green: 106, blue: 61)
        let color6 = UIColor(red: 197, green: 66, blue: 22)*/
        return CCGradientConfiguration(colors: self.backgroundGradient!,
                                       type: CCGradientType.axial,
                                       points: [CGPoint(x: 0.0, y: 0.8),
                                                CGPoint(x: 1, y: 1)]
                                       /*,
                                       locations: [0.25, 0.75],
                                       points: [CGPoint(x: 0.5, y: 0.55),
                                                CGPoint(x: 1.5, y: 1)]*/
                                       
                                       
                                       /*,
                                       locations: [0.25,0.95,0.25],
                                        points: [CGPoint(x: 0.5, y: 0.5),
                                        CGPoint(x: 1, y: 1)]*/)
    }
}




/*public extension Int {

    /// Returns a random Int point number between 0 and Int.max.
    static var random: Int {
        return Int.random(n: Int.max)
    }

    /// Random integer between 0 and n-1.
    ///
    /// - Parameter n:  Interval max
    /// - Returns:      Returns a random Int point number between 0 and n max
    static func random(n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }

    ///  Random integer between min and max
    ///
    /// - Parameters:
    ///   - min:    Interval minimun
    ///   - max:    Interval max
    /// - Returns:  Returns a random Int point number between 0 and n max
    static func random(min: Int, max: Int) -> Int {
        return Int.random(n: max - min + 1) + min

    }
}

// MARK: Double Extension

public extension Double {

    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    static var random: Double {
        return Double(arc4random()) / 0xFFFFFFFF
    }

    /// Random double between 0 and n-1.
    ///
    /// - Parameter n:  Interval max
    /// - Returns:      Returns a random double point number between 0 and n max
    static func random(min: Double, max: Double) -> Double {
        return Double.random * (max - min) + min
    }
}

// MARK: Float Extension

public extension Float {

    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    static var random: Float {
        return Float(arc4random()) / 0xFFFFFFFF
    }

    /// Random float between 0 and n-1.
    ///
    /// - Parameter n:  Interval max
    /// - Returns:      Returns a random float point number between 0 and n max
    static func random(min: Float, max: Float) -> Float {
        return Float.random * (max - min) + min
    }
}

// MARK: CGFloat Extension

public extension CGFloat {

    /// Randomly returns either 1.0 or -1.0.
    static var randomSign: CGFloat {
        return (arc4random_uniform(2) == 0) ? 1.0 : -1.0
    }

    /// Returns a random floating point number between 0.0 and 1.0, inclusive.
    static var random: CGFloat {
        return CGFloat(Float.random)
    }

    /// Random CGFloat between 0 and n-1.
    ///
    /// - Parameter n:  Interval max
    /// - Returns:      Returns a random CGFloat point number between 0 and n max
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random * (max - min) + min
    }
}*/
