//
//  TestTask20230612.swift
//  YandexTraining
//
//  Created by Yerlan Omarov on 12.06.2023.
//

import Foundation

func testTask() {
    let rawString = "0KPQutCw0LbQuNGC0LUg0LTQsNGC0YMg0YDQvtC20LTQtdC90LjRjyDQodGC0LjQstCwINCS0L7Qt9C90Y/QutCwICjQsiDRhNC+0YDQvNCw0YLQtSBkZC5NTS5ZWVlZKQ=="
    if let decodedData = Data(base64Encoded: rawString),
       let decodedString = String(data: decodedData, encoding: .utf8) {
        guard decodedString.isEmpty else {
            print(decodedString)
            return
        }
        print("Oops, invalid input format!")
    }
}
