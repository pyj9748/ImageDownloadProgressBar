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

    private func configuration() {
        downLoadButton.backgroundColor = .systemBlue
        downLoadButton.setTitle("Load", for: .normal)
        downLoadButton.clipsToBounds = true
        downLoadButton.layer.cornerRadius = 12
        imageView.image = UIImage(systemName: "photo.fill")
        imageView.contentMode = .scaleAspectFit
        progressBar.progressViewStyle = .default
        progressBar.progressTintColor = .green
        progressBar.trackTintColor = .lightGray
        progressBar.setProgress(0.0, animated: false)
    }

    private func addSubviews() {
        [imageView, progressBar, downLoadButton].forEach {
            self.addSubview($0)
        }
    }

    private func makeConstraints() {
        snp.makeConstraints { make in
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
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.trailing.equalTo(downLoadButton.snp.leading).offset(-10)
            make.centerY.equalToSuperview()
        }
    }

    func initailze() {
        imageView.image = UIImage(systemName: "photo.fill")
        progressBar.setProgress(0.0, animated: false)
    }

    func fetchImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Bad Image URL")
            return
        }
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        session.downloadTask(with: url).resume()
    }
}

extension ImageDownloadView: URLSessionDelegate, URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        DispatchQueue.main.async {
            // 애니메이션 효과가 있으면 이미지 로드가 완료되는 것보다 프로그레스 바가 늦게 작용한다.
            self.progressBar.setProgress(Float(totalBytesWritten) / Float(totalBytesExpectedToWrite), animated: true)
            // self.progressBar.setProgress(Float(totalBytesWritten) / Float(totalBytesExpectedToWrite), animated: false)
        }
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        if let data = try? Data(contentsOf: location), let image = UIImage(data: data) {
            DispatchQueue.main.async {
                self.imageView.contentMode = .scaleAspectFit
                self.imageView.clipsToBounds = true
                self.imageView.image = image
            }
        } else {
            fatalError("Cannot load the image")
        }
    }
}
