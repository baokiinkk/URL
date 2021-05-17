//
//  File.swift
//  URL
//
//  Created by Quoc Bao on 7/24/20.
//  Copyright © 2020 Quoc Bao. All rights reserved.
//

import Foundation
class info:Codable{
    internal init(__EVENTTARGET:String,__EVENTARGUMENT:String,_TaiKhoan:String,_MatKhau:String){
        self.__EVENTARGUMENT = __EVENTARGUMENT
        self.__EVENTTARGET = __EVENTTARGET
        self.ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$btnDangNhap = "Đăng Nhập"
        self.ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtMatKhau = _MatKhau
        self.ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtTaiKhoa = _TaiKhoan
        self.__VIEWSTATEGENERATOR = "CA0B0334"
    }
    var __EVENTTARGET:String?
    var __EVENTARGUMENT:String?
    var ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtTaiKhoa:String?
    var ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$txtMatKhau:String?
    var ctl00$ContentPlaceHolder1$ctl00$ucDangNhap$btnDangNhap:String?
    var __VIEWSTATEGENERATOR:String?
}

