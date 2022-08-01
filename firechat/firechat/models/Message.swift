//
//  Message.swift
//  firechat
//
//  Created by rt on 01/08/2022.
//

import Foundation


struct Message: Identifiable,Codable{
    var id:String
    var text: String
    var received:Bool
    var timestamp: Date
}
