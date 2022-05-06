//
//  HiHomeModule.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/4/29.
//

import Foundation
import Hi_Router_Module

//MARK: - 模块A
public class HiHomeModule: HiRouterModuleProtocol {
    public var module: String { "Hi_Home_Module" }
    public var scheme: String { "home" }
    public var pathDic: [String: String] {
        ["home":"HiHomeViewController","place":"HiPlaceViewController","present":"HiPresentViewController"]
    }
    
    public class func registerPages() {
        HiHomeModule().registerPages()
    }
}
