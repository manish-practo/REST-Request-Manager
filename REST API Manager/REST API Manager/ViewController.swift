//
//  ViewController.swift
//  REST API Manager
//
//  Created by Manish Pandey on 19/04/21.
//

import UIKit

class ViewController: UIViewController {

    let opQueueu = TaskOperationQueue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.opQueueu.maxConcurrentOperationCount = 1
        
        self.opQueueu.addOperation(DownloadTaskOperation(url: "https://image.flaticon.com/icons/png/128/4474/4474187.png"))
        self.opQueueu.addOperation(DownloadTaskOperation(url: "https://image.flaticon.com/icons/png/128/4474/4474188.png"))
        self.opQueueu.addOperation(DownloadTaskOperation(url: "https://image.flaticon.com/icons/png/128/4474/4474189.png"))
        self.opQueueu.addOperation(DownloadTaskOperation(url: "https://image.flaticon.com/icons/png/128/4474/4474190.png"))
        self.opQueueu.addOperation(DownloadTaskOperation(url: "https://image.flaticon.com/icons/png/128/4474/4474191.png"))
        self.opQueueu.addOperation(DownloadTaskOperation(url: "https://image.flaticon.com/icons/png/128/4474/4474192.png"))
    }


}

class DownloadTaskOperation: TaskOperation<URLSessionDownloadTask> {
    
    init(url: String) {
        print("Started task: \(url)")
        super.init()
        
        let request = try! FileDownloadRequestBuilder().set(url).set(.get).getRequest()
        let session = URLSession.shared
        
        super.set(task: session.downloadTask(with: request) { _, _, _ in
            print("Task finished: \(url)")
            super.setTaskFinishedExecuting()
        })
        
        
    }
    
    
    
}
