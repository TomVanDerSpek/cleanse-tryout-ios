//
//  InteractorProtocol.swift
//  CleanseTryout
//
//  Created by Tom van der Spek on 13/03/2019.
//

import Foundation

protocol InteractorProtocol {
    
    func attach(_ presenter: PresenterProtocol)
    func detachPresenter()
    
}
