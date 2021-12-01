import UIKit
import SafariServices


class ViewController: UIViewController
{
    @IBAction func loadWithinApp()
    {
        guard let url = URL(string: "https://www.hackingwithswift.com") else {return}
        
        let sfVc = SFSafariViewController(url: url)
        
        self.present(sfVc, animated: true, completion: nil)
        
    }
    
    
    @IBAction func loadExternally()
    {
        guard let url = URL(string: "https://www.hackingwithswift.com") else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    
}

