//
//  Snake.swift
//  MDSnake
//
//  Created by Phil Schwartz on 10/7/16.
//  Copyright © 2016 Phil Schwartz. All rights reserved.
//
import UIKit
import Foundation


class Snake{
    var name: String?
    var description: String?
   // var yLocation: String?
    var color: String?
    var endangered: Bool?
    var pattern: String?
    var venomous: Bool?
    
    init(name: String, color:String, endangered:Bool, pattern:String, description:String, venomous:Bool){
        self.name = name
        self.color=color
        self.endangered=endangered
        self.pattern=pattern
        self.description=description
        self.venomous=venomous
        
    }
    
    func getName()
        ->String{
            return (self.name)!
    }
    
    func getColor()
        ->String{
            return (self.color)!
    }
    
    func getPattern()
        ->String{
            return (self.pattern)!
    }
    
    func getDescription()->String{
    return (self.description)!
    }
    
    func getEndangered()->String{
        
        if (self.endangered == true){
            return ("Endangered")
        }
        else{
            return("Not Endangered")
        }
    }
    
}//end snake class


//make a list of snakes
class SnakeList {
    var list = [Snake]()
    
    func returnList()->[Snake]{
        return list
    }
    
func search(){//search for a snake w/ no parameters
        
        for S in list{
            if (S.getColor()=="brown"){
                print( S.getName())
            }
            
        }//end search
        
        
        
        
    }
}


