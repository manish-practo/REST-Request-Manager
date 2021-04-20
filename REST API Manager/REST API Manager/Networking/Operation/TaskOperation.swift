//
//  TaskOperation.swift
//  REST API Manager
//
//  Created by Manish Pandey on 19/04/21.
//

import Foundation

class TaskOperation<TaskType: URLSessionTask>: Operation {
    
    // MARK: - Properties
    /// Current state of task
    private(set) var state = TaskOperationState.ready {
        willSet {
            self.willChangeValue(forKey: TaskOperationState.executing.key)
            self.willChangeValue(forKey: TaskOperationState.finished.key)
        }
        
        didSet {
            self.didChangeValue(forKey: TaskOperationState.executing.key)
            self.didChangeValue(forKey: TaskOperationState.finished.key)
        }
    }
    
    override var isReady: Bool { return state == .ready }
    override var isExecuting: Bool { return state == .executing }
    override var isFinished: Bool { return state == .finished }
    
    private var task: TaskType?
    
    // MARK: - Operation life cycle
    override func start() {
        // if the operation or queue got cancelled even
        // before the operation has started, set the
        // operation state to finished and return
        if isCancelled {
            self.state = .finished
            return
        }
        
        // start task execution
        self.state = .executing
        self.task?.resume()
    }
    
    override func cancel() {
        super.cancel()
        
        self.task?.cancel()
    }
    
    func set(task: TaskType) {
        self.task = task
    }
    
    func setTaskFinishedExecuting() {
        self.state = .finished
    }
}
