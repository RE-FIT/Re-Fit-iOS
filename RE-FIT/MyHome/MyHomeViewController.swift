//
//  MyHomeViewController.swift
//  RE-FIT
//
//  Created by jaegu park on 2023/06/30.
//

import UIKit

class MyHomeViewController: UIViewController {
    
    @IBOutlet weak var DayView: UIView!
    @IBOutlet weak var Day1: UIView!
    @IBOutlet weak var Day2: UIView!
    @IBOutlet weak var Day3: UIView!
    @IBOutlet weak var Day4: UIView!
    @IBOutlet weak var InfoView: UIView!
    @IBOutlet weak var FeedView: UIView!
    @IBOutlet weak var LikeView: UIView!
    @IBOutlet weak var SettingView: UIView!
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var Nickname: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ProfileImage.layer.cornerRadius = self.ProfileImage.frame.size.height / 2
        ProfileImage.layer.masksToBounds = true
        ProfileImage.clipsToBounds = true
        
        DayView.layer.cornerRadius = 10
        DayView.clipsToBounds = true
        
        Day1.layer.cornerRadius = 5
        Day1.clipsToBounds = true
        Day2.layer.cornerRadius = 5
        Day2.clipsToBounds = true
        Day3.layer.cornerRadius = 5
        Day3.clipsToBounds = true
        Day4.layer.cornerRadius = 5
        Day4.clipsToBounds = true
        
        InfoView.layer.cornerRadius = 5
        InfoView.clipsToBounds = true
        FeedView.layer.cornerRadius = 5
        FeedView.clipsToBounds = true
        LikeView.layer.cornerRadius = 5
        LikeView.clipsToBounds = true
        SettingView.layer.cornerRadius = 5
        SettingView.clipsToBounds = true
    }
    
    func UserInfoResult() {
        
        let url = APIURL.mypageURL + "/info"
        let encodedStr = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: encodedStr) else { print("err"); return }
        
//        let postString = "keyword=정렬"
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
//        request.httpBody = postString.data(using: String.Encoding.utf8)
        request.addValue(" ", forHTTPHeaderField: "X-ACCESS-TOKEN")
        
        URLSession.shared.dataTask(with: request) { [self] data, response, error in
            if error != nil {
                print("err")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 299) ~=
            response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            
            if let safeData = data {
                print(String(decoding: safeData, as: UTF8.self))
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let decodedData = try decoder.decode(UserInfoModel.self, from: safeData)
                    DispatchQueue.main.async {
                        self.Nickname.text = "\(decodedData.name) 님의 환경지키기"
                        let url = URL(string: decodedData.imageUrl ?? "https://rebornbucket.s3.ap-northeast-2.amazonaws.com/6f9043df-c35f-4f57-9212-cccaa0091315.png")
                        self.ProfileImage.load(url: url!)
                    }
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            }
        }.resume()
    }
    
    @IBAction func InfoTapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "MyInfoVC") as? MyInfoViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func FeedTapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "MyFeedVC") as? MyFeedViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func LikeTapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "MyLikeVC") as? MyLikeViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func SettingTapped(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as? SettingsViewController else {return}
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

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
