//
//  ImageDownLoadView.swift
//  ImageProgressBar
//
//  Created by young june Park on 2023/02/22.
//
import SnapKit
import UIKit

final class ImageDownloadView: UIView {
    let hStackView = UIStackView(frame: .zero)
    let imageView = UIImageView(frame: .zero)
    let progressBar = UIProgressView(frame: .zero)
    let downLoadButton = UIButton(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        addSubviews()
        makeConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration() {
        hStackView.axis = .horizontal
        hStackView.distribution = .fill
        hStackView.spacing = 10
        hStackView.alignment = .center
        imageView.backgroundColor = .red
        progressBar.backgroundColor = .blue
        downLoadButton.backgroundColor = .systemBlue
        downLoadButton.setTitle("Load", for: .normal)
        downLoadButton.clipsToBounds = true
        downLoadButton.layer.cornerRadius = 12
        
    }
    
    func addSubviews() {
        [imageView, progressBar, downLoadButton].forEach {
            hStackView.addArrangedSubview($0)
        }
        addSubview(hStackView)
    }
    
    func makeConstraints() {
        
        hStackView.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).offset(-10)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(10)
            make.height.equalTo(100)
        }
        imageView.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(120)
        }
        progressBar.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(120)
        }
        downLoadButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(80)
        }
    }
}
