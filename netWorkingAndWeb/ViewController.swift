import UIKit
import WebKit

class ViewController: UIViewController
{
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var myProgressView: UIProgressView!
    
    var estimatedProgress: String = "estimatedProgress"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myWebView.addObserver(self, forKeyPath: estimatedProgress, options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?)
    {
        if keyPath == estimatedProgress
        {
            let curProgres = self.myWebView.estimatedProgress
            self.myProgressView.progress = Float(curProgres)
        }
    }
    
    deinit{
        removeObserver(self, forKeyPath: estimatedProgress)
    }
    
    
    
    
    @IBAction func loadMyWebsite()
    {
        guard let url = URL(string: "https://www.hackingwithswift.com") else { return }
        
        let request = URLRequest(url: url)
        
        myWebView.load(request)
                
    }
}

