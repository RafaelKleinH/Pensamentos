//
//  quote.swift
//  Pensamentos
//
//  Created by Rafael Hartmann on 10/03/21.
//

import Foundation

struct Quote: Codable {
    let quote: String
    let author: String
    let image: String
    
    var quoteFormated: String{
        return "“" + quote + "”"
    }
    var authorFormated:String{
        return "- " + author + " -"
    }
}
