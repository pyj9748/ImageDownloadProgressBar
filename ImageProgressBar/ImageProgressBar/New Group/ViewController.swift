//
//  ViewController.swift
//  ImageProgressBar
//
//  Created by young june Park on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {

    let mainView = MainView(frame: .zero)
    
    let imageUrls: [String] = [
        "https://mblogthumb-phinf.pstatic.net/20141214_240/kimmisung08_1418494292237TxKI1_JPEG/IRON_MAN_POSTER%2C%BE%C6%C0%CC%BE%F0%B8%C73_%BE%C6%C0%CC%B8%C6%BD%BA_%C6%F7%BD%BA%C5%CD%2C%BE%C6%C0%CC%BE%F0%B8%C7_%C6%F7%BD%BA%C5%CD%2C%BF%B5%C8%AD_%C6%F7%BD%BA%C5%CDdslfjop3jsdklfjlsd_26.jpg?type=w2",
        "https://dimg.donga.com/wps/NEWS/IMAGE/2022/06/15/113945374.2.jpg",
        "https://an2-img.amz.wtchn.net/image/v2/lLagrqkxUMbqB7kGWFfTWg.jpg?jwt=ZXlKaGJHY2lPaUpJVXpJMU5pSjkuZXlKdmNIUnpJanBiSW1SZk56STVlREV3T0RCeE9EQWlYU3dpY0NJNklpOTJNaTl6ZEc5eVpTOXBiV0ZuWlM4eE5qTXhOekF4T1RreU9EWXpNelF3TURnMkluMC5xVVdvYzNhWGxZWkJMVHA1bGdibFd2TmNkUFNERkttSnB0UjJOUHNUcFpZ",
        "https://cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/GUXM36UYTCDRNKBWOXRI53PRAI.jpg",
        "https://extmovie.com/files/attach/images/135/692/185/015/ad588362506b78a5ca390d7a71eb6ed3.jpg"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }
    
    override func loadView() {
        self.view = mainView
    }

    private func addTarget() {
        mainView.imageDownloadView1.downLoadButton.addTarget(self, action: #selector(loadButton1Tapped(_:)), for: .touchUpInside)
        mainView.imageDownloadView2.downLoadButton.addTarget(self, action: #selector(loadButton2Tapped(_:)), for: .touchUpInside)
        mainView.imageDownloadView3.downLoadButton.addTarget(self, action: #selector(loadButton3Tapped(_:)), for: .touchUpInside)
        mainView.imageDownloadView4.downLoadButton.addTarget(self, action: #selector(loadButton4Tapped(_:)), for: .touchUpInside)
        mainView.imageDownloadView5.downLoadButton.addTarget(self, action: #selector(loadButton5Tapped(_:)), for: .touchUpInside)
        mainView.allImageDownloadButton.addTarget(self, action: #selector(loadAllButtonTapped(_:)), for: .touchUpInside)
        mainView.allImageInitailizeButton.addTarget(self, action: #selector(removeAllButtonTapped(_:)), for: .touchUpInside)
    }
    @objc private func loadButton1Tapped(_ sender: UIButton) {
        mainView.imageDownloadView1.initailze()
        mainView.imageDownloadView1.fetchImage(urlString: imageUrls[0])
    }
    @objc private func loadButton2Tapped(_ sender: UIButton) {
        mainView.imageDownloadView2.initailze()
        mainView.imageDownloadView2.fetchImage(urlString: imageUrls[1])
    }
    @objc private func loadButton3Tapped(_ sender: UIButton) {
        mainView.imageDownloadView3.initailze()
        mainView.imageDownloadView3.fetchImage(urlString: imageUrls[2])
    }
    @objc private func loadButton4Tapped(_ sender: UIButton) {
        mainView.imageDownloadView4.initailze()
        mainView.imageDownloadView4.fetchImage(urlString: imageUrls[3])
    }
    @objc private func loadButton5Tapped(_ sender: UIButton) {
        mainView.imageDownloadView5.initailze()
        mainView.imageDownloadView5.fetchImage(urlString: imageUrls[4])
    }
    @objc private func loadAllButtonTapped(_ sender: UIButton) {
        [
            mainView.imageDownloadView1,
            mainView.imageDownloadView2,
            mainView.imageDownloadView3,
            mainView.imageDownloadView4,
            mainView.imageDownloadView5
        ].forEach {
            $0.initailze()
        }
        mainView.imageDownloadView1.fetchImage(urlString: imageUrls[0])
        mainView.imageDownloadView2.fetchImage(urlString: imageUrls[1])
        mainView.imageDownloadView3.fetchImage(urlString: imageUrls[2])
        mainView.imageDownloadView4.fetchImage(urlString: imageUrls[3])
        mainView.imageDownloadView5.fetchImage(urlString: imageUrls[4])
    
    }
        
    
    @objc private func removeAllButtonTapped(_ sender: UIButton) {
        [
            mainView.imageDownloadView1,
            mainView.imageDownloadView2,
            mainView.imageDownloadView3,
            mainView.imageDownloadView4,
            mainView.imageDownloadView5
        ].forEach {
            $0.initailze()
        }
        
    }

}


