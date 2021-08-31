//
//  NetworkError.swift
//  BJHomework
//
//  Created by Binal on 31/08/2021.
//

import Foundation

enum NetworkError: Error {
    case url
    case other(Error)
}

