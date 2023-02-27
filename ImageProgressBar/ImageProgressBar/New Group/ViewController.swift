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
        "https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202207/13/108542da-366f-485e-96bb-b6e9d6e8aad4.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ75hqTrkhUJujN632tpG2wzI1dxsL2-nA2y0ZaZkGwh4VCDcWR-HHFiIvgyATq5F1azgQ&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4jsNd7JPYVvndgf-8ahJZuSi1nAPYX0fhSulQiN0HvIdtqUzvb4FHQ7TTpBkprHZXRz4&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd2bKfCUlIKw-Pm7clqX4MUjKhjChttB8xyL-r5-zGtrOtwxkzlCiPOjsjuJuBV9QBx88&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2XGVbI7MlG0ylCM2PZYMXlTZF-nC2W02QTAEab8QMp-i51kvKadBtZ_5hmxqed_9qucs&usqp=CAU",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        addTarget()
    }

    override func loadView() {
        view = mainView
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
            mainView.imageDownloadView5,
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
            mainView.imageDownloadView5,
        ].forEach {
            $0.initailze()
        }
    }
}
