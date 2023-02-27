//
//  View.swift
//  ImageProgressBar
//
//  Created by young june Park on 2023/02/22.
//

import UIKit
import SnapKit

final class MainView: UIView {
    private let vStackView = UIStackView(frame: .zero)
    let imageDownloadView1 = ImageDownloadView(frame: .zero)
    let imageDownloadView2 = ImageDownloadView(frame: .zero)
    let imageDownloadView3 = ImageDownloadView(frame: .zero)
    let imageDownloadView4 = ImageDownloadView(frame: .zero)
    let imageDownloadView5 = ImageDownloadView(frame: .zero)
    let allImageDownloadButton = UIButton(frame: .zero)
    let allImageInitailizeButton = UIButton(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        addSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration() {
        backgroundColor = .white
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        vStackView.spacing = 3
        vStackView.backgroundColor = .white
        allImageDownloadButton.backgroundColor = .systemBlue
        allImageDownloadButton.layer.cornerRadius = 12
        allImageDownloadButton.clipsToBounds = true
        allImageDownloadButton.setTitle("Load All Images", for: .normal)
        allImageInitailizeButton.backgroundColor = .systemBlue
        allImageInitailizeButton.layer.cornerRadius = 12
        allImageInitailizeButton.clipsToBounds = true
        allImageInitailizeButton.setTitle("remove All Images", for: .normal)
    }
    
    func addSubviews() {
        [imageDownloadView1, imageDownloadView2, imageDownloadView3, imageDownloadView4, imageDownloadView5,
        ].forEach {
            vStackView.addArrangedSubview($0)
        }
        [vStackView, allImageDownloadButton, allImageInitailizeButton].forEach {
            addSubview($0)
        }

    }
    
    func makeConstraints() {
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalTo(safeAreaLayoutGuide.snp.left)
            make.right.equalTo(safeAreaLayoutGuide.snp.right)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.75)
        }
        allImageDownloadButton.snp.makeConstraints { make in
            make.top.equalTo(vStackView.snp.bottom).offset(20)
            make.centerX.equalTo(vStackView.snp.centerX)
            make.height.equalTo(60)
            make.width.equalTo(150)
        }
        allImageInitailizeButton.snp.makeConstraints { make in
            make.top.equalTo(allImageDownloadButton.snp.bottom).offset(20)
            make.centerX.equalTo(vStackView.snp.centerX)
            make.height.equalTo(60)
            make.width.equalTo(150)
        }
    }
    
}
