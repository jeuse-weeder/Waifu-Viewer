
import UIKit
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        waifuName.text = "makise_kurisu"
        waifuView.load(url: URL(string: "https://cdn.discordapp.com/icons/780540354868019241/b755ca320314a13d6968786c7d5ab6c3.png?size=512")!)
    }

    func getWaifu(waifuName: String) -> String {
        let url = "https://safebooru.donmai.us/posts.json?random=true&tags=\(waifuName)&rating=safe&limit=1"
        var res:String = String()
        if let url = URL(string: url) {
            if let data = try? Data(contentsOf: url) {
                    let img: [Danbooru] = try! JSONDecoder().decode([Danbooru].self, from: data)
                        res = String(img.first?.url ?? "https://cdn.discordapp.com/icons/780540354868019241/b755ca320314a13d6968786c7d5ab6c3.png?size=512")
                    }
            
                }
        return res
    }
    
    @IBAction func waifuButton(_ sender: Any) {
        var waifuUrl:String = String()
        if waifuName.text == nil || waifuName.text == "" {
            waifuUrl = getWaifu(waifuName: "makise_kurisu")
        }
        else {
            waifuUrl = getWaifu(waifuName: waifuName.text!)
        }
        
        waifuView.load(url: URL(string: waifuUrl)!)
    }
    
   @IBOutlet weak var waifuView: UIImageView!
   @IBOutlet weak var waifuName: UITextField!
}

