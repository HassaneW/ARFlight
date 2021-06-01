//
//  URLSessionFake.swift
//  ARFlightTests
//
//  Created by Wandianga hassane on 2021-06-01.
//

import Foundation

class URLSessionFake: URLSession {
    var data : Data?
    var response : URLResponse?
    var error: Error?
    init(data: Data?, response: URLResponse?, error: Error?) {
        self.data = data
        self.response = response
        self.error = error
    }
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSessionDataTaskFake(data: data, urlResponse: response, responseError: error, completionHandler: completionHandler)
        return task
    }
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        let task = URLSessionDataTaskFake(data: data, urlResponse: response, responseError: error, completionHandler: completionHandler)
        return task
    }
}
class URLSessionDataTaskFake : URLSessionDataTask {
    var completionHandler: ((Data?, URLResponse?, Error?) -> Void)?
    var data : Data?
    var urlResponse : URLResponse?
    var responseError: Error?
    
    init(data: Data?, urlResponse: URLResponse?, responseError: Error?, completionHandler: ((Data?, URLResponse?, Error?) -> Void)?) {
        self.data = data
        self.urlResponse = urlResponse
        self.responseError = responseError
        self.completionHandler = completionHandler
    }
    
    override func resume() {
        completionHandler?(data, urlResponse, responseError)
    }
    
    override func cancel() { }
}
