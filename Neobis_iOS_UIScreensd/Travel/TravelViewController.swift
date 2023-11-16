

import UIKit
class TravelViewController : UIViewController,UISearchResultsUpdating,UISearchBarDelegate{
 
    let searchController = UISearchController()
    private let searchBarContainerView: UIView = {
            let view = UIView()
            view.backgroundColor = .gray
            return view
        }()

        private let searchBar: UISearchBar = {
            let searchBar = UISearchBar()
            searchBar.placeholder = "Куда хотите поехать?"
           
            return searchBar
        }()
    let titleLabel1: UILabel = {
        let label1 = UILabel()
        label1.textColor = .black
        label1.textAlignment = .left
        label1.text = "Путешествуйте"
        label1.font = .systemFont(ofSize: 24, weight: .medium)
        return label1
    }()

    let titleLabel2: UILabel = {
        let label3 = UILabel()
        label3.textColor = .black
        label3.textAlignment = .left
        label3.text = "Почувствуйте прилив энергии"
        label3.font = .systemFont(ofSize: 24, weight: .medium)
        return label3
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Мы поможем вам исследовать, сравнить и забронировать впечатления - все в одном месте."
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private let buttonLabels = ["ABU DHABI", "SAN ANTONIO", "ABU DHABI"]
    private let tableImageView: [UIImage] = [
         UIImage(named: "TravelViewTableImage1")!,
         UIImage(named: "TravelViewTableImage2")!,
         UIImage(named: "TravelViewTableImage1")!
     ]
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.allowsSelection = true
        tableView.register(TravelTableViewCell.self, forCellReuseIdentifier: TravelTableViewCell.identifier)
        return tableView
    }()

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()
    private lazy var topNavigationBar: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 50)
        view.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.9)
        return view
    }()
    
    

    override func viewDidLoad(){
        super.viewDidLoad()
        self.addBackgroundView()
        self.setUI()
       
     
        self.setupSearchBar()
        searchBarContainerView.backgroundColor = UIColor.red
        searchController.searchResultsUpdater = self
            navigationItem.searchController = searchController
            definesPresentationContext = true
        self.setUpUITableView()
        self.tableView.delegate = self
         self.tableView.dataSource = self
    }
    private  func setUI(){
        addTopNavigationBar()
        addBackgroundView()
       
        view.addSubview(backgroundView)

       
        backgroundView.addSubview(titleLabel1)
        backgroundView.addSubview(titleLabel2)
        backgroundView.addSubview(descriptionLabel)
        backgroundView.addSubview(searchBarContainerView)
        searchBarContainerView.addSubview(searchBar)
        
        titleLabel1.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        searchBarContainerView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false

       
        NSLayoutConstraint.activate([
            titleLabel1.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            titleLabel1.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 80),

            titleLabel2.topAnchor.constraint(equalTo: titleLabel1.bottomAnchor, constant: 5),
            titleLabel2.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor,constant:40),
        
                    descriptionLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -40),
           // descriptionLabel.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 10),
           
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel2.bottomAnchor, constant: 10),

            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: searchBarContainerView.topAnchor, constant: -8),

                    searchBarContainerView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
                    searchBarContainerView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 300),
                    searchBarContainerView.heightAnchor.constraint(equalToConstant: 35),
                    searchBar.centerXAnchor.constraint(equalTo: searchBarContainerView.centerXAnchor),
                    searchBar.topAnchor.constraint(equalTo: searchBarContainerView.topAnchor),
                    searchBar.bottomAnchor.constraint(equalTo: searchBarContainerView.bottomAnchor),
                    searchBar.leadingAnchor.constraint(equalTo: searchBarContainerView.leadingAnchor),
                    searchBar.trailingAnchor.constraint(equalTo: searchBarContainerView.trailingAnchor),
            
        ])
      
    }
   private func setupSearchBar() {
      
        searchBarContainerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 35)
        searchBar.frame = CGRect(x: 0, y: 0, width: searchBarContainerView.frame.width, height: searchBarContainerView.frame.height)
        searchBar.barTintColor = .gray
        searchBar.tintColor = .white

       
       searchBarContainerView.backgroundColor = UIColor.red
           NSLayoutConstraint.activate([
               searchBarContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               searchBarContainerView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
           ])

         
           NSLayoutConstraint.activate([
               searchBar.centerXAnchor.constraint(equalTo: searchBarContainerView.centerXAnchor),
               searchBar.topAnchor.constraint(equalTo: searchBarContainerView.topAnchor),
           
           ])
        
       }
    private func addBackgroundView() {
        let parent = self.view!
        parent.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: parent.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: parent.bottomAnchor)
        ])
    }
    func updateSearchResults(for searchController: UISearchController) {
        guard searchController.searchBar.text != nil else {
                    return
        }
       
    }
   
            


        private func addTopNavigationBar() {
            self.view.addSubview(topNavigationBar)
                   topNavigationBar.translatesAutoresizingMaskIntoConstraints = false

                   NSLayoutConstraint.activate([
                       topNavigationBar.topAnchor.constraint(equalTo: self.view.topAnchor),
                       topNavigationBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                       topNavigationBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                       topNavigationBar.heightAnchor.constraint(equalToConstant: 60)
                ])
            
    }
    

 
    private func setUpUITableView() {
        view.backgroundColor = .systemRed
                view.addSubview(tableView)

                tableView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    tableView.topAnchor.constraint(equalTo:self.view.topAnchor, constant: 350),
                    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                ])
            
    }


  
    
}
extension TravelViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableImageView.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as? TravelTableViewCell else {
                fatalError("The TableView could not dequeue a TravelTableViewCell.")
            }

            let image = self.tableImageView[indexPath.row]
            let buttonLabel = buttonLabels[indexPath.row] 


            cell.configure(with: image,  labelText: buttonLabel)
            // delete черту
        tableView.separatorStyle = .none
       
                return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
}
