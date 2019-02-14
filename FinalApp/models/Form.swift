//
//  Form.swift
//  FinalApp
//
//  Created by Jean-Charles Moussé on 14/02/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

protocol Form {
    func resetFields()
    func validateFields() -> Bool
}