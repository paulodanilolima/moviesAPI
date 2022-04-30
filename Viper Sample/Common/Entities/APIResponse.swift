//
//  APIResponse.swift
//  Madeinweb
//
//  Created by Alberto Lourenço on 03/01/19.
//  Copyright © 2019 Madeinweb. All rights reserved.
//

import Foundation

struct APIResponseNone: Codable {}

struct APIResponseException: Codable {
    
    var code: Int = 0
    var message: String?
    var exceptionMessage: String?
    
    enum CodingKeys: String, CodingKey {
        
        case code               = "statusCode"
        case message            = "message"
        case exceptionMessage   = "exceptionMessage"
    }
}


struct APIResponseToken: Codable {
    
    var token: String?
    var type: String = ""
    var expires: Int = 0
    
    enum CodingKeys: String, CodingKey {
        
        case token      = "access_token"
        case type       = "token_type"
        case expires    = "expires_in"
    }
}

struct APIResponseOffer : Codable {
    
    let objectId: Int?
    
    let amount: Int?
    let weight: Float?
    let price: Float?
    let suggestedPrice: Float?
    
    let ranchName: String?
    let ranchCode: Int?
    
    let enablingName: String?
    let enablingCode : Int?
    
    let classificationCode: Int?
    let classificationName: String?
    
    let unitName: String?
    let unitCode: Int?
    
    let rancherName: String?
    let rancherCode: Int?
    
    let observation: String?
    
    enum CodingKeys: String, CodingKey {
        
        case objectId           = "ofertaCodigo"
        
        case amount             = "quantidade"
        case weight             = "ofertaPeso"
        case price              = "precoOfertado"
        case suggestedPrice     = "precoSugerido"
        
        case unitName           = "empresa"
        case unitCode           = "empresaCodigo"
        
        case ranchName          = "fazenda"
        case ranchCode          = "fazendaCodigo"
        
        case enablingName       = "habilitacao"
        case enablingCode       = "produtoCodigo"
        
        case classificationCode = "classificacaoCodigo"
        case classificationName = "classificacaoNome"
        
        case rancherName        = "pecuarista"
        case rancherCode        = "pecuaristaCodigo"
        
        case observation        = "ofertaObservacao"
    }
}

struct APIResponse: Codable {
    
    var characters: [Character]
    
    enum CodingKeys: String, CodingKey {
        case characters = "results"
    }
}
