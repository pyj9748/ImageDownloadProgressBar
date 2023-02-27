//
//  ImageDownLoadView.swift
//  ImageProgressBar
//
//  Created by young june Park on 2023/02/22.
//
import SnapKit
import UIKit

final class ImageDownloadView: UIView {
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
        downLoadButton.backgroundColor = .systemBlue
        downLoadButton.setTitle("Load", for: .normal)
        downLoadButton.clipsToBounds = true
        downLoadButton.layer.cornerRadius = 12
        imageView.image = UIImage(systemName: "photo.fill")
        imageView.contentMode = .scaleAspectFit
        progressBar.progressViewStyle = .default
        progressBar.progressTintColor = .green
        progressBar.trackTintColor = .lightGray
    }
    
    func addSubviews() {
        [imageView, progressBar, downLoadButton].forEach {
            self.addSubview($0)
        }
        
    }
    
    func makeConstraints() {
        
        self.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(100)
        }
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(120)
            make.centerY.equalToSuperview()
            make.height.equalTo(90)
            
        }
        downLoadButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        progressBar.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing)
            make.trailing.equalTo(downLoadButton.snp.leading).offset(-10)
            make.centerY.equalToSuperview()
            ///make.height.equalTo(20)
        }
    }
}
