struct MyProperty {
    let createdAt:Int
    let updatedAt:Int
    let id: Int
    let property_title : String
    let image_URL:String
    let estate: String
    let bedrooms: Int
    let gross_area:Int
    let expected_tenants : Int
    let rent:Int
    let h_Property:String
}

extension MyProperty {
    guard let networkController = NetworkController()
    static var sampleData: [MyProperty]
    networkController.fetchNews(completionHandler:{ (property) in
            DispatchQueue.main.async {
                self.sampleData = property
                self.tableView.reloadData()
            }
    }) { (error) in
        DispatchQueue.main.async {
            self.property = []
            self.tableView.reloadData()
        }
    }
}
