//
//  DetailsViewController.swift
//  StudentInfo
//
//  Created by Mac on 02/02/1945 Saka.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsTableView: UITableView!
    var allStudentData = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        let nibName = UINib(nibName: "DetailTableViewCell", bundle: nil)
        self.detailsTableView.register(nibName, forCellReuseIdentifier: "DetailTableViewCell")
        }
    override func viewWillAppear(_ animated: Bool) {
        self.getAlldata()
        detailsTableView.reloadData()
    

}
   func getAlldata(){
        allStudentData = DataBaseHandler().fetchData()
        detailsTableView.reloadData()
    }
    
}

extension DetailsViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allStudentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailsTableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        cell.firstNameLabel.text = allStudentData[indexPath.row].firstName
        cell.lastNameLabel.text = allStudentData[indexPath.row].lastName
        cell.emailLabel.text = allStudentData[indexPath.row].email
        cell.mobileNumberLabel.text = allStudentData[indexPath.row].mobileNumber
        return cell
    }
}


extension DetailsViewController:UITableViewDelegate{
    //for delete butoon add and perform using below two method
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            self.allStudentData = DataBaseHandler().deleteRecord(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
