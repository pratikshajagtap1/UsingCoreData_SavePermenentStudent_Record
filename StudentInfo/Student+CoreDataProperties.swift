//
//  Student+CoreDataProperties.swift
//  StudentInfo
//
//  Created by Mac on 02/02/1945 Saka.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var mobileNumber: String?

}

extension Student : Identifiable {

}
