//
//  HiSiteHandyJSONModel.swift
//
//
//  Created by JSONConverter on 2024/04/02.
//  Copyright © 2024年 JSONConverter. All rights reserved.
//

import Foundation
import HandyJSON

class HiSiteHandyJSONModel: HandyJSON {
	var allList = [HiSiteHandyJSONModelAllList]()
	var openList = [HiSiteHandyJSONModelOpenList]()
	var unOpenList = [String]()

	required init() {}
}

class HiSiteHandyJSONModelOpenList: HandyJSON {
	var appId: String?
	var applicationId: String?
	var applicationName: String?
	var area: String?
	var areaName: String?
	var createTime: Int = 0
	var description: String?
	var highLightIconUrl: String?
	var iconUrl: String?
	var id: String?
	var openFlag: String?
	var packageUploadUrl: String?
	var testUploadUrl: String?
	var version: String?
	var versionCreateTime: Int = 0
	var versionStatus: String?
    var indexTag:Int = 0;

	required init() {}
}

class HiSiteHandyJSONModelAllList: HandyJSON {
	var appId: String?
	var applicationId: String?
	var applicationName: String?
	var area: String?
	var areaName: String?
	var createTime: Int = 0
	var description: String?
	var highLightIconUrl: String?
	var iconUrl: String?
	var id: String?
	var openFlag: String?
	var packageUploadUrl: String?
	var testUploadUrl: String?
	var version: String?
	var versionCreateTime: Int = 0
	var versionStatus: String?

	required init() {}
}
