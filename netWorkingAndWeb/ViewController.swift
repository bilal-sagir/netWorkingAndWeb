import UIKit


// http://android-kotlin-fun-mars-server.appspot.com/realestate

struct Property : Codable
{
    var price: Int
    var id: String
    var type: String
    var img_src: String
    
}

class ViewController: UIViewController
{
    
    func connectBackEnd(){
        let urlStr = "https://android-kotlin-fun-mars-server.appspot.com/realestate"
        let url = URL(string: urlStr)
        let urlReq = URLRequest(url: url!)
        let session = URLSession (configuration: .default)
        let task = session.dataTask(with: urlReq) { data, res, err in
            
            if err != nil {return}
            
            let decoder = JSONDecoder()
            do {
                let properties : Array<Property> = try decoder.decode([Property].self, from: data!)
                print("we found \(properties.count)")
                var cheapProperties : Array<Property> = []
                for any in properties{
                    if any.price <= 500_000 {
                        cheapProperties.append(any)
                    }
                }
                print("we found \(cheapProperties.count)")
                
            }catch{
                
            }
            
            //let jsonStr = String(data: data!, encoding: .utf8)
            //print(jsonStr)
        }
        task.resume()
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        connectBackEnd()
    }
}


