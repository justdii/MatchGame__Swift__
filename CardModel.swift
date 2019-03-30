//
//  CardModel.swift
//  Match  App
//
//  Created by Diana on 3/12/19.
//  Copyright © 2019 Diana. All rights reserved.
//

import Foundation

class CardModel{
    
    func getCards() -> [Card]{
        
        var generatedNumbersArray = [Int]()
        
        var generetedCardsArray = [Card]()
        
        while generatedNumbersArray.count < 8 {
            
            let randomNumber = arc4random_uniform(13)+1
            
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                
                print(randomNumber)
                
                generatedNumbersArray.append(Int(randomNumber))
            
            let cardOne = Card()
            cardOne.imageName = "card\(randomNumber)"
            generetedCardsArray.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imageName = "card\(randomNumber)"
            generetedCardsArray.append(cardTwo)
            }
        }
        
        for i in 0...generetedCardsArray.count-1{
            let randomNumber = Int(arc4random_uniform(UInt32(generetedCardsArray.count)))
            
            let temporaryStorage = generetedCardsArray[i]
            generetedCardsArray[i] = generetedCardsArray[randomNumber]
            generetedCardsArray[randomNumber] = temporaryStorage
        }
        return generetedCardsArray
    }
}
