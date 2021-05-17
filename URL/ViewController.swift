//
//  ViewController.swift
//  URL
//
//  Created by Quoc Bao on 7/24/20.
//  Copyright © 2020 Quoc Bao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       login()
        //getDiem()
    }
    func convertFormField(named name: String, value: String, using boundary: String) -> String {
      var fieldString = "--\(boundary)\n"
      fieldString += "Content-Disposition: form-data; name=\"\(name)\"\n"
      fieldString += "\n"
      fieldString += "\(value)\n"
            
      return fieldString
    }
    func getDiem(){
        let header = [
                          "Cache-Control": "max-age=0",
                          "Upgrade-Insecure-Requests": "1",
                          "DNT": "1",
                          "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36",
                          "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
                          "Accept-Language": "en-US,en;q=0.9",
                          "Content-Type": "multipart/form-data",
                          "Connection": "keep-alive",
                          ]
                      let url = URL(string:"http://uis.ptithcm.edu.vn/Default.aspx?page=xemdiemthi")!
                      var postRequest = URLRequest(url: url)
                      postRequest.httpMethod = "GET"
                      postRequest.allHTTPHeaderFields = header
                      let session = URLSession.shared
                      let task = session.dataTask(with: url){
                          data,response,error in
                          if(error != nil){
                              print("error")
                              return
                              
                          }
                          guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode)
                              else{return}
                        print(httpResponse.url)
                          
                      }
                      task.resume()
    }
    func login(){
        let encode = JSONEncoder()
               let header = [
                   "Cache-Control": "max-age=0",
                   "Upgrade-Insecure-Requests": "1",
                   "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.26 Safari/537.36 Edg/85.0.564.13",
                   "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
                   "Accept-Language": "en-US,en;q=0.9",
                   "Content-Type": "multipart/form-data",
                   "Connection": "keep-alive",
                   "Content-Length" : "23979"
                ]
        let boundary = "----WebKitFormBoundaryEEfFEr2h1c7vlw58"
        let url = URL(string:"http://uis.ptithcm.edu.vn/default.aspx")!
        var postRequest = URLRequest(url: url)
        postRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
               postRequest.httpMethod = "POST"
               postRequest.allHTTPHeaderFields = header
               let newPH = info(__EVENTTARGET: "", __EVENTARGUMENT: "", _TaiKhoan: "N17DCCN010", _MatKhau: "Quocbao1997")
               //postRequest.httpBody = try? encode.encode(newPH)
        let form = [
            "__EVENTTARGET": "",
            "__EVENTARGUMENT": "",
            "ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtTaiKhoa": "n17dccn010",
            "ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtMatKhau": "Quocbao1997",
            "ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$btnDangNhap": "Đăng Nhập",
        ]
        var httpBody = Data()
        for(key,value) in form{
            httpBody.append(Data(convertFormField(named: key, value: value, using: boundary).utf8))
        }
        httpBody.append(Data("--\(boundary)--".utf8))
        postRequest.httpBody = httpBody as Data
        //print(String(data: httpBody as Data, encoding: .utf8)!)
               let session = URLSession.shared
               let task = session.dataTask(with: postRequest){
                   data,response,error in
                   if(error != nil){
                       print("error")
                       return
                       
                   }
               
                //print(String(decoding: data!, as: UTF8.self))
                print(response)
               }
               task.resume()
    }
}

