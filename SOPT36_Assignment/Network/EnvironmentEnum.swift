//
//  EnvironmentEnum.swift
//  SOPT36_Assignment
//
//  Created by OneTen on 5/11/25.
//

import UIKit

enum EnvironmentEnum {
  static let API_KEY: String = Bundle.main.infoDictionary?["API_KEY"] as! String
  static let BASE_URL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
