//
//  SidemenuViewController.swift
//  RH
//
//  Created by Prathap Reddy on 4/21/21.
//

import UIKit

var isSelectedTermsOfuse = 0

class SidemenuViewController: UIViewController {
    
    

    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
       
    @IBOutlet weak var userNameLAbel: UILabel!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    
    var presenter: SideMenuPresenter?

    var settingsList = [String]()

    var settingsImage = [String]()
    
    var selectedIndex = -1
    
    var window: UIWindow?

    override func viewDidLoad() {
        super.viewDidLoad()

        Router.shared.setNavigationController(navigationController: self.navigationController)

        Router.shared.setStoryBoard(storyBoard:self.storyboard)
        
        setCleanArch()
        
        NotificationCenter.default.addObserver(self, selector: #selector(SidemenuViewController.pushnotificationreceiveNotification), name: NSNotification.Name(rawValue: "ForSidemenu"), object: nil)
        
    }
    
    func dropShadow() {
        
        
        profileImageButton.backgroundColor = UIColor(red: 171/255, green: 178/255, blue: 186/255, alpha: 1.0)
        // Shadow Color and Radius
        profileImageButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        profileImageButton.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        profileImageButton.layer.shadowOpacity = 1.0
        profileImageButton.layer.shadowRadius = 10.0
        profileImageButton.layer.masksToBounds = false
        view.clipsToBounds = true
        profileImageButton.layer.cornerRadius = profileImageButton.frame.width / 2
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
              
        tableSettingArr()
        print(settingsList)
        
        //showEmployees(with: settingsList)

    }
    override func viewDidLayoutSubviews() {

    }
        
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
       // profileImageButton.layer.masksToBounds = false

       // profileImageButton.layer.applyCornerRadiusShadow(color: appThemeColor, alpha: 0.38, x: 0, y: 3, blur: 16, spread: 5, cornerRadiusValue: 37.5)
    }
    
    
    
    func setCleanArch() {
        let controller = self
        presenter = SideMenuPresenter()
        let interactor = SideMenuInteractor()
        presenter?.view = controller
        presenter?.interector = interactor
        interactor.presenter = presenter
        presenter?.router = Router.shared
    }
    
    func tableSettingArr(){
        
        if UserDefaults.standard.bool(forKey: "isLogedIn") == true {

            UserDataController.sharedInstance.fetchUsersInfo()

            if UserDataController.sharedInstance.currentUser != nil {

                if UserDataController.sharedInstance.currentUser.profileImage! == "" {
                    self.profileImageButton.setImage(UIImage(named: ""), for: .normal)
                    self.profileImageButton.titleLabel?.font = UIFont(name: "Merriweather-Bold", size: 30)

                    profileImageButton.layer.masksToBounds = true
                    profileImageButton.layer.cornerRadius = profileImageButton.frame.width/2
                    self.profileImageButton.setTitle("\(UserDataController.sharedInstance.currentUser.firstName!.first!.uppercased())\(UserDataController.sharedInstance.currentUser.lastName!.first!.uppercased())", for: .normal)
                    self.profileImageButton.backgroundColor = .white
                    self.profileImageButton.setTitleColor(appThemeColor, for: .normal)
                    
                } else {
                    
                    if UserDataController.sharedInstance.currentUser.profileImage!.contains("https://") {
                        let profilePic = UserDataController.sharedInstance.currentUser.profileImage!
                        
                        let imgUrl = URL(string: profilePic)
                        
                        self.profileImageButton.kf.setImage(with:imgUrl, for: .normal, placeholder: placeH, options: [.cacheOriginalImage])
                    } else {
                        let profilePic = HOME_URL+UserDataController.sharedInstance.currentUser.profileImage!
                        
                        let imgUrl = URL(string: profilePic)
                        
                        profileImageButton.kf.setImage(with:imgUrl, for: .normal, placeholder: placeH,options: [.cacheOriginalImage])
                    }
                    
                    
                   
                }
                    
                profileImageButton.borderColor = appThemeColor

                userNameLAbel.text = UserDataController.sharedInstance.currentUser.firstName! + " " + UserDataController.sharedInstance.currentUser.lastName!
              if UserDefaults.standard.string(forKey: "password")! == "" {
                    settingsList =  ["Profile","Notifications", "Terms of Use","Privacy Policy", "Contact Us", "Tech Support","Sign Out"]

                } else {
                settingsList =  ["Profile","Notifications", "Terms of Use","Privacy Policy", "Contact Us", "Tech Support","Update Password","Sign Out"]
                }
                
                settingsImage =  ["profile","notification_1","terms_1","terms_1", "call", "support", "lock_1","signout_1"]
                
            }
            
            

        } else {
            profileImageButton.setImage(UIImage(named: "user"), for: .normal)
            userNameLAbel.text = "Sign-In/SignUp"
            
            settingsList = ["Terms of Use","Privacy Policy","Contact Us", "Tech Support"]
            settingsImage =  ["terms_1","terms_1", "call", "support"]
        }

        DispatchQueue.main.async {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.reloadData()
        }

    }
    
    @objc func pushnotificationreceiveNotification(){
        tableSettingArr()
    }
    
    @IBAction func profileImageButtonAction(_ sender: Any) {
        
        if UserDefaults.standard.bool(forKey: "isLogedIn") == true {
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            Router.shared.setStoryBoard(storyBoard:storyboard)
            Router.shared.setNavigationController(navigationController: navigationController)
            self.hideLeftViewAnimated(nil)
            presenter?.moveToProfileView()
        }
        else {
            
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            Router.shared.setStoryBoard(storyBoard:storyboard)
            Router.shared.setNavigationController(navigationController: navigationController)
            self.hideLeftViewAnimated(nil)
            presenter?.moveToLogin()
        }
    }
    
    @IBAction func onTapProfileNameBtn(_ sender: UIButton) {
        
        if UserDefaults.standard.bool(forKey: "isLogedIn") == true {
            
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            Router.shared.setStoryBoard(storyBoard:storyboard)
            Router.shared.setNavigationController(navigationController: navigationController)
            self.hideLeftViewAnimated(nil)
            presenter?.moveToProfileView()
        }
        else {
            
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            Router.shared.setStoryBoard(storyBoard:storyboard)
            Router.shared.setNavigationController(navigationController: navigationController)
            self.hideLeftViewAnimated(nil)
            presenter?.moveToLogin()
        }

    }
    
    @IBAction func onClickCanelbtn(_ sender: UIButton) {
        self.hideLeftViewAnimated(nil)
    }
    
}

extension SidemenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "sideMenuCell", for: indexPath) as?
        SideMenuTableViewCell
        let settings = settingsList[indexPath.row]
        cell?.settingsLabel?.text = settings
        cell?.settingsImage?.image = UIImage(named: (settingsImage[indexPath.row]))
        cell?.sideLabel.isHidden = true
        cell?.contentView.backgroundColor = .clear

        if selectedIndex == indexPath.row {
            cell?.sideLabel.isHidden = false
            cell?.contentView.backgroundColor = UIColor(red: 254 / 255, green: 191 / 255, blue: 58 / 255, alpha: 0.10)
        
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        
        if UserDefaults.standard.bool(forKey: "isLogedIn") == true {
            
            switch selectedIndex {
            case 0:
                                
                let storyboard = UIStoryboard(name: "Login", bundle: nil)
                
                Router.shared.setStoryBoard(storyBoard:storyboard)
                
                Router.shared.setNavigationController(navigationController: navigationController)
                                
                presenter?.moveToProfileView()
                
                self.hideLeftViewAnimated(nil)
                break

            case 1:
                                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                Router.shared.setStoryBoard(storyBoard:storyboard)
                
                Router.shared.setNavigationController(navigationController: navigationController)
                                
                presenter?.moveToNotificationsView()

                self.hideLeftViewAnimated(nil)

                break
                
            case 2:
                
                Router.shared.setNavigationController(navigationController: navigationController)

                isSelectedTermsOfuse = 0

                presenter?.moveToTermsAndConditionsView()
                
                self.hideLeftViewAnimated(nil)

                break
            case 3:
                                
                Router.shared.setNavigationController(navigationController: navigationController)

                isSelectedTermsOfuse = 1
                
                presenter?.moveToTermsAndConditionsView()
                
                self.hideLeftViewAnimated(nil)

                break
                
            case 4:
                                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                Router.shared.setStoryBoard(storyBoard:storyboard)
                
                Router.shared.setNavigationController(navigationController: navigationController)
                            
                presenter?.moveToContactView()

                self.hideLeftViewAnimated(nil)

                break
                
            case 5:
                   
                if tabbarSelected == 0 {
                    
//                    isForTechSupportForVC = true
//                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "techSupport"), object: nil)

                    isForTechSupportForHomeView = true
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "home_techSupport"), object: nil)
                    
                }
                else if tabbarSelected == 1 {

                    isForTechSupportForSecondTab = true
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "techSupportSecondTab"), object: nil)
                }
                else if tabbarSelected == 2 {
                    
                    isForTechSupportForLastTab = true
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "techSupportLastTab"), object: nil)
                }
                
                if newTabbarSelected == 0 {
                    isForTechSupportForVC = true
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "techSupport"), object: nil)
                }
                else if newTabbarSelected == 1 {
                    isForTechSupportForMyCases = true
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "techSupportNewLastTab"), object: nil)

                }
                
                self.hideLeftViewAnimated(nil)

                break

            case 6:
                          
                if UserDefaults.standard.string(forKey: "password")! == "" {
                    forLogout()
                } else {
                let storyboard = UIStoryboard(name: "Login", bundle: nil)
                
                Router.shared.setStoryBoard(storyBoard:storyboard)
                
                Router.shared.setNavigationController(navigationController: navigationController)
                                
                presenter?.moveToUpdatePAsswordView()
                
                self.hideLeftViewAnimated(nil)
                }

                break
            case 7:
                       
                forLogout()
                break
            default:
                break
            }
            
        } else {
            switch selectedIndex {
            case 0:
                
                Router.shared.setNavigationController(navigationController: navigationController)

                isSelectedTermsOfuse = 0
                
                presenter?.moveToTermsAndConditionsView()
                
                self.hideLeftViewAnimated(nil)

                break
            case 1:
                                
                Router.shared.setNavigationController(navigationController: navigationController)

                isSelectedTermsOfuse = 1
                
                presenter?.moveToTermsAndConditionsView()
                
                self.hideLeftViewAnimated(nil)

                break
                
            case 2:
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                Router.shared.setStoryBoard(storyBoard:storyboard)
                
                Router.shared.setNavigationController(navigationController: navigationController)
                                
                presenter?.moveToContactView()
                
                self.hideLeftViewAnimated(nil)


                break

            case 3:
                
                isForTechSupportForVC = true

                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "techSupport"), object: nil)
                
                self.hideLeftViewAnimated(nil)

                break
                
            default:
                break
            }
        }
        tableView.reloadData()
    }
    
    func forLogout(){
        if tabbarSelected == 0 {
            
            getLogoutStatus = true

            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ForLogout"), object: nil)
        }
        else if tabbarSelected == 1 {
            
            getLogoutCalenderStatus = true
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ForLogoutForCalender"), object: nil)
        }
        else if tabbarSelected == 2 {
            
            getLogoutMyOpenCaseStatus = true
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ForLogoutForMyOpenCases"), object: nil)
        }
        
        if newTabbarSelected == 0 {
            getLogoutStatus = true

            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ForLogout"), object: nil)
        }
        else if newTabbarSelected == 1 {
            getLogoutNewTabCasesStatus = true
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ForLogoutForNewMyOpenCases"), object: nil)
        }
        //presenter?.moveToPopToRootView()
        
        self.hideLeftViewAnimated(nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}

extension SidemenuViewController: SideMenuPresenterToViewProtocol{
    
}

extension CALayer {
    func applyCornerRadiusShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0,
        cornerRadiusValue: CGFloat = 0)
    {
        cornerRadius = cornerRadiusValue
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
}
