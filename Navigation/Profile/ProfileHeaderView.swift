import UIKit

class ProfileHeaderView: UIView {
    
    internal lazy var avatar : UIImageView = {
       let avatar = UIImageView()
        avatar.image = UIImage(named: "bogdanphoto")
        avatar.layer.cornerRadius = 60
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.isUserInteractionEnabled = true
        avatar.toLayout()
        return avatar
    }()
    
    internal lazy var avatarContainer : UIView = {
        let view = UIView()
        view.toLayout()
        return view
    }()
    
    
    private lazy var bluePixel: UIImageView = {
         let image = UIImageView()
         image.image = UIImage(named: "blue_pixel")
         image.alpha = 1
         return image
      }()
    
    private lazy var currentStatus : UILabel = {
       let label = UILabel()
        label.text = "Please add status"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14)
        label.sizeToFit()
        label.toLayout()
        return label
    }()
    
    private lazy var statusField : UITextField = {
       let text = UITextField()
        text.placeholder = statusText
        text.font = .systemFont(ofSize: 15)
        text.backgroundColor = .white
        text.layer.cornerRadius = 10
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 1
        text.textAlignment = .center
        text.toLayout()
        text.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        return text
    }()
    
    private lazy var button : UIButton = {
      
        let button = UIButton()
        button.clipsToBounds = true
        button.setTitle("Set Status", for: .normal)
        button.setBackgroundImage(bluePixel.image, for: .normal)
        button.layer.shadowPath = UIBezierPath(rect: button.bounds).cgPath
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.layer.masksToBounds = true
        button.toLayout()
        button.addTarget(self, action: #selector(heldDown), for: .touchDown)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var name : UILabel = {
        let name = UILabel()
        name.text = "Bogdan Kiselev"
        name.textAlignment = .right
        name.font = .boldSystemFont(ofSize: 18)
        name.sizeToFit()
        name.textColor = .black
        name.toLayout()
        return name
    }()
    
    private var statusText = "Type status here"
    
    override init(frame: CGRect){
        super.init(frame: frame)

        backgroundColor = .systemGray
        addHeaderConstraints()
      }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func statusTextChanged(_ textField: UITextField) {

            statusText = textField.text ?? ""
        
    }
    
    @objc private func buttonPressed() {
        
        button.setBackgroundImage(bluePixel.image, for: .normal)
        button.setTitle(button.title(for: .normal), for: .normal)
        button.setTitleColor(.white, for: .normal)
        currentStatus.text = statusText
        currentStatus.sizeToFit()
        self.endEditing(true)
        
    }
    @objc func heldDown() {
        
        button.setBackgroundImage(bluePixel.image?.alpha(0.8), for: .normal)
        button.setTitle(button.title(for: .normal), for: .normal)
        button.setTitleColor(.white, for: .normal)
    }
    
    func addHeaderConstraints(){
        
        
        
        self.addSubview(avatarContainer)
        self.addSubview(button)
        self.addSubview(currentStatus)
        self.addSubview(statusField)
        self.addSubview(name)
        avatarContainer.addSubview(avatar)
        
        let constraints = [
           
            avatar.topAnchor.constraint(equalTo: avatarContainer.topAnchor),
            avatar.leadingAnchor.constraint(equalTo: avatarContainer.leadingAnchor),
            avatar.widthAnchor.constraint(equalTo: avatarContainer.widthAnchor),
            avatar.heightAnchor.constraint(equalTo: avatarContainer.heightAnchor),
            avatarContainer.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarContainer.widthAnchor.constraint(equalToConstant: 120),
            avatarContainer.heightAnchor.constraint(equalToConstant: 120),
            button.topAnchor.constraint(equalTo: avatarContainer.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            name.topAnchor.constraint(equalTo: avatarContainer.topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: avatarContainer.trailingAnchor, constant: 32),
            currentStatus.centerYAnchor.constraint(equalTo: avatarContainer.centerYAnchor),
            currentStatus.leadingAnchor.constraint(equalTo: avatarContainer.trailingAnchor, constant: 32),
            currentStatus.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            currentStatus.widthAnchor.constraint(equalTo: statusField.widthAnchor),
            statusField.bottomAnchor.constraint(equalTo: avatarContainer.bottomAnchor, constant: -10),
            statusField.leadingAnchor.constraint(equalTo: avatarContainer.trailingAnchor, constant: 32),
            statusField.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusField.heightAnchor.constraint(equalToConstant: 25),
            statusField.widthAnchor.constraint(equalTo: button.widthAnchor, constant: -152)

        ]

            NSLayoutConstraint.activate(constraints)

    }
}

