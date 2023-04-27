//
//  DatabaseHelper.swift
//  StudentInfo
//
//  Created by Mac on 02/02/1945 Saka.
//

import Foundation
import UIKit
import CoreData

class DataBaseHandler{
    var context = ((UIApplication.shared.delegate) as! AppDelegate).persistentContainer.viewContext
    
    
    func saveData(firstName:String, lastName:String, email:String,mobileNumber:String){
        let studentDataObject = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        
        studentDataObject.firstName = firstName
        studentDataObject.lastName = lastName
        studentDataObject.email = email
        studentDataObject.mobileNumber = mobileNumber
        do{
             try context.save()
            print("student Data Sucessfully saved")
        }
        catch{
            print("student Data Saving Error")
        }
    }
    
    func fetchData()->[Student]{
        var data=[Student]()
        
        do{
            data = try context.fetch(Student.fetchRequest()) as! [Student]
            print("Data sucessfully fetched")
        }
        catch{
            print("error occured during Fetching data")
        }
        return data
    }
    
    func updateStudentRecord(oldObject:Student,firstName:String, lastName:String, email:String,mobileNumber:String){
        oldObject.firstName = firstName
        oldObject.lastName = lastName
        oldObject.email = email
        oldObject.mobileNumber = mobileNumber
        do{
            try context.save()
        }catch{}
    }
    
    func deleteRecord(index:Int)->[Student]{
        var allStudentData = self.fetchData()

        context.delete(allStudentData[index])
        allStudentData.remove(at: index)
        do{
            try context.save()
            print("data deleted")
        }
        catch{
            print("Data Not deleted")
        }
        return allStudentData
    }
    
}
