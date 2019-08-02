import Flutter
import UIKit
import Foundation

public class IosListVIewFactory : NSObject, FlutterPlatformViewFactory {

    var messenger: FlutterBinaryMessenger!

    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return IosListVIewController(withFrame: frame, viewIdentifier: viewId, arguments: args, binaryMessenger: messenger)
    }

    @objc public init(messenger: (NSObject & FlutterBinaryMessenger)?) {
        super.init()
        self.messenger = messenger
    }

    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}

public class IosListVIewController: NSObject, FlutterPlatformView {

    fileprivate var viewId: Int64!;
    // fileprivate var indicator: UIActivityIndicatorView!
    fileprivate var params : NSDictionary!
    fileprivate var channel: FlutterMethodChannel!
    fileprivate var items : [String]!
    fileprivate var listView: UIView!

    public init(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger: FlutterBinaryMessenger) {
        super.init()

        self.params = args as! NSDictionary
        self.listView = ReorderView(frame: CGRect(x: 0, y: 0, width: 500, height: 800), params: self.params)
        
        self.viewId = viewId
        self.channel = FlutterMethodChannel(name: "plugins/ios_list_view_\(viewId)", binaryMessenger: binaryMessenger)

        self.channel.setMethodCallHandler({
            [weak self]
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if let this = self {
                this.onMethodCall(call: call, result: result)
            }
        })
    }

    public func view() -> UIView {
        return self.listView
    }

    func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
    }
}

// youwakaranu

class ReorderView: UIView, UITableViewDataSource, UITableViewDelegate {

    var tableView = UITableView()

    fileprivate var menuId : [String]!
    fileprivate var menuName : [String]!
    fileprivate var menuImageUrl : [String]!



    init(frame: CGRect, params: NSDictionary){
        super.init(frame: frame)
        self.menuId = params["menu_id"] as! [String]
        self.menuName = params["menu_name"] as! [String]
        self.menuImageUrl = params["menu_image_url"] as! [String]
        setup()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


    func setup() {

        self.backgroundColor = UIColor.black

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 500, height: 800))
        // tableView.layer.backgroundColor = UIColor.black as! CGColor
        self.addSubview(tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuId.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        cell.textLabel?.text = "menuID: " + self.menuId![indexPath.row] + ", menuName: " + self.menuName[indexPath.row]
        cell.imageView?.image = UIImage(url: self.menuImageUrl[indexPath.row])
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
