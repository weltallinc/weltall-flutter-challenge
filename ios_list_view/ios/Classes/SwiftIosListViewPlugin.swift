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
        self.listView = CustomViewWithTableView(frame: frame)

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
        self.listView = ReorderView(frame: CGRect(x: 0, y: 0, width: 500, height: 800), params: self.params)
        return self.listView
    }

    func onMethodCall(call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = call.method
        if method == "start" {
            // self.indicator.startAnimating()
        } else if method == "stop" {
            // self.indicator.stopAnimating()
        }
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
        cell.textLabel?.text = "menuID: " + self.menuId![indexPath.row] + ", menuName: " + self.menuName[indexPath.row] + ", menuImageUrl: " + self.menuImageUrl[indexPath.row]
        return cell
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

/*
class ReorderView: UIView, UITableViewDataSource, UITableViewDelegate {

    var tableView = UITableView()

    fileprivate var menuId : [String]!
    fileprivate var menuName : [String]!
    fileprivate var menuImageUrl : [String]!



    override init(frame: CGRect){
        super.init(frame: frame)

        setup()
        tableView.delegate = self
        tableView.dataSource = self
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
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath) as UITableViewCell
        cell.textLabel?.text = "my name is neko."
        return cell
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
*/

/* UITable View Class */

class CustomViewWithTableView: UIView {

    var tableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        let table: ViewController = ViewController()
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 400, height: 800), style: .plain)
        tableView.dataSource = table
        // tableView.delegate = table
        self.addSubview(tableView)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView : UITableView?
    var items = [
        "Ginger",
        "larry",
        "Moe",
        "Fred",
        "Terry"]

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 400, height: 800), style: UITableViewStyle.plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        // tableView!.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view .addSubview(tableView!)
    }
    override func loadView() {
        let stuf = UIView()
        stuf.frame = CGRect(x: 0, y: 0, width: 400, height: 800)
        stuf.backgroundColor = UIColor .red
        self.view = stuf
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    private func tableView(tableView:UITableView, heightForRowAtIndexPath indexPath:NSIndexPath)->CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        cell.textLabel?.textColor = UIColor.brown
        cell.textLabel?.text = items[indexPath.row] as String
        return cell
    }

    func dismiss() {
        self.navigationController?.dismiss(animated: true, completion: { () -> Void in})
    }
}
