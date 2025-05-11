//
//  EnvironmentEnum.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 5/11/25.
//

import UIKit

enum Environment {
  static let API_KEY: String = Bundle.main.infoDictionary?["API_KEY"] as! String
}
