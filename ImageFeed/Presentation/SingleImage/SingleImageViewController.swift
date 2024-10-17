//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Даниил Азевич on 17/10/2024.
//

import Foundation
import UIKit

class SingleImageViewController : UIViewController {
    var image: UIImage! {
        didSet {
            guard isViewLoaded else { return }
            imageView.image = image
            rescaleAndCenterImageInScrollView(image: image)
        }
    }
    
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var shareButton: UIButton!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    
    @IBAction func didTapBackButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapShareButton(_ sender: Any) {
        guard let image else { return }
       
        let shareActivity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        setShareButtonLoading(isLoading: true)
        DispatchQueue.main.async {
            self.present(shareActivity, animated: true) {
                self.setShareButtonLoading(isLoading: false)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setShareButtonLoading(isLoading: false)
        activityIndicator.isHidden = true
        imageView.image = image
        imageView.frame.size = image.size
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 3.25
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        rescaleAndCenterImageInScrollView(image: image)
    }
    
    func setShareButtonLoading(isLoading: Bool) {
        shareButton.isHidden = isLoading
        activityIndicator.startAnimating()
        activityIndicator.isHidden = !isLoading
    }
    
}

extension SingleImageViewController: UIScrollViewDelegate {
    static let ZeroInset = CGFloat(0)
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        rescaleAndCenterImageInScrollView(image: image)
    }
    
    private func rescaleAndCenterImageInScrollView(image: UIImage) {
        let minZoomScale = scrollView.minimumZoomScale
        let maxZoomScale = scrollView.maximumZoomScale
        view.layoutIfNeeded()
        let visibleRectSize = scrollView.bounds.size
        let imageSize = image.size
        let hScale = visibleRectSize.width / imageSize.width
        let vScale = visibleRectSize.height / imageSize.height
        let scale = min(maxZoomScale, max(minZoomScale, min(hScale, vScale)))
        scrollView.setZoomScale(scale, animated: true)
        let newContentSize = scrollView.contentSize
        let verticalInset = (visibleRectSize.height - newContentSize.height) / 2
        scrollView.contentInset = UIEdgeInsets(
            top: verticalInset,
            left: Self.ZeroInset,
            bottom: verticalInset,
            right: Self.ZeroInset
        )
        scrollView.layoutIfNeeded()
        
        
    }
}
