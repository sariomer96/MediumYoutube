//
//  ViewController.swift
//  MediumYoutube
//
//  Created by Omer on 22.01.2024.
//

import UIKit
import YouTubeiOSPlayerHelper


class ViewController: UIViewController {
    
    @IBOutlet weak var urlTextField: UITextField!
    
    @IBOutlet weak var youtubeView: YTPlayerView!
    let viewModel = YoutubeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewModel.callbackAlert = { [weak self] errorTitle in
            guard let self = self else {return}
            alert(title: errorTitle.0, message: errorTitle.1)
        }
        
        viewModel.callbackLoadVideo  = { [weak self] id in
            guard let self = self else {return}
            youtubeView.load(withVideoId: id)
                 
           
        }
        
    }
    @IBAction func setVideoClick(_ sender: Any) {
        
        let url = urlTextField.text
        guard let url = url else {return}
        
        viewModel.loadVideo(url: url)
        
        urlTextField.text = ""
    }
    
    
    func alert(title:String,message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
              
        alert.addAction(ok)
        self.present(alert,animated: true)
    }
    

}

