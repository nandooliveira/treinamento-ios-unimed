//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

@objc protocol Coisavel {
    var coisa:String { get set }
    
    @objc optional func fazOutraCoisa(coisa: String) -> String
}

class Coisinha: Coisavel {
  

    internal var coisa: String = ""
}

var coisadinha = Coisinha()
print(coisadinha.coisa)