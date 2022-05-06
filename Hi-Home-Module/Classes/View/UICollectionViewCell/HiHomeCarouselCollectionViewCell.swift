//
//  HiHomeCarouselCollectionViewCell.swift
//  Hi-Home-Module
//
//  Created by stone on 2022/5/6.
//

import UIKit
import Hi_Kit_Module

class HiHomeCarouselCollectionViewCell:UICollectionViewCell {
    
    var model = HiHomeSonModel(){
        didSet {
            var autoModels:[HiAutoModel] = [HiAutoModel]();
            let autoImages:[String] = ["https://p0.meituan.net/moviemachine/855eba69586a2272838b0904107596df71498.jpg","https://p0.meituan.net/movie/1266d74b35daf438c04506f0f9f90a3e976963.jpg"];
            for i in 0..<autoImages.count {
                let autoModel = HiAutoModel();
                autoModel.image = autoImages[i];
                autoModels.append(autoModel);
            }
            DispatchQueue.main.async{
                self.carouselView.autoModels = autoModels;
                self.carouselView.autoDidSelectItemHandle = {(index) in
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUI()
    }
    
    func setUI() {
        self.contentView.addSubview(self.carouselView);
    }
    
    func setMas() {
    }
    
    fileprivate lazy var carouselView: HiCarouselView = {
        let carouselView = HiCarouselView.init(frame: self.bounds);
        carouselView.hi_timeInterval = 5.0;
        carouselView.layer.cornerRadius = 10.0;
        carouselView.layer.masksToBounds = true;
        carouselView.isAutoScroll = true;
        carouselView.dotDirection = .right
        carouselView.hiPageControlHeight = 25
        carouselView.adjustValue = 16.0;
        let layout = HiDotLayout(dotColor: UIColor.darkGray, dotSelectColor: UIColor.white, dotType: .default)
        /*设置dot的间距*/
        layout.dotMargin = 8
        /* 如果需要改变dot的大小，设置dotWidth的宽度即可 */
        layout.dotWidth = 8
        /*如需和系统一致，dot放大效果需手动关闭 */
        layout.isScale = false
        carouselView.dotLayout = layout;
        return carouselView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
