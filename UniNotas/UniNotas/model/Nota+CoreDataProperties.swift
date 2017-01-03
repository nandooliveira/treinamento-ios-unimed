//
//  Nota+CoreDataProperties.swift
//  UniNotas
//
//  Created by Fernando Oliveira on 27/12/16.
//  Copyright © 2016 Unimed. All rights reserved.
//

import Foundation
import CoreData


extension Nota {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Nota> {
        return NSFetchRequest<Nota>(entityName: "Nota");
    }

    @NSManaged public var texto: String?
    @NSManaged public var ultimaAlteracao: NSDate?

}
