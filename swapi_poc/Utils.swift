//
//  Utils.swift
//  swapi_poc
//
//  Created by MARTIN ZUNIGA on 4/5/16.
//  Copyright © 2016 hattrick. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    // MARK: Alert messages
    
    static func presentAlertMessage(title: String, message: String, cancelActionText: String, presentingViewContoller: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: cancelActionText, style: .Cancel, handler: nil)
        alert.addAction(cancelAction)
        presentingViewContoller.presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: Error Creation
    
    static func createBasicErrorMessage(message: String) -> NSError {
        return NSError(domain: "API_ERROR", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
    
}