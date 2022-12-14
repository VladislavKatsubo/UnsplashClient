//
//  InfoVC.swift
//  UnsplashClient
//
//  Created by Vlad Katsubo on 15.10.22.
//

import UIKit
import RealmSwift

class InfoVC: UIViewController {
    
    lazy var layout: InfoVCLayout = .init()
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?

    var photoObject: PhotoModel? = nil
    
    override func loadView() {
        super.loadView()
        view = layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        layoutAllElements()
    }
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        //Not allowing the user to drag the view upward
        guard translation.y > 0 else { return }
        
        //x = 0 to not let drag sideways
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true)
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
    
    func layoutAllElements() {
        if let photo = photoObject {
            layout.dateCreated.attributedText = addSymbolPrefix(with: Symbols.calendar.rawValue, for: photo.dateCreated.formatToDate!)
            
            if let downloads = photo.downloads {
                layout.downloadsAmount.attributedText = addSymbolPrefix(with: Symbols.downloadArrow.rawValue, for: String(downloads))
            }
            

            if let city = photo.location?.locationCity, let country = photo.location?.locationCountry {
                layout.location.attributedText = addSymbolPrefix(with: Symbols.location.rawValue, for: "\(String(describing: city)), \(String(describing: country))")
            } else {
                layout.location.attributedText = addSymbolPrefix(with: Symbols.location.rawValue, for: "Earth")
            }
            
        }
    }

}
