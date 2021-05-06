//
//  Logging.swift
//  BasicChatApp
//
//  Created by Prabin Kumar Datta on 18/04/21.
//

import Foundation

fileprivate extension String {
    var sourceFileName: String {
        let fileName = self.components(separatedBy: "/").last?.split(separator: ".").first ?? ""
        return String(fileName)
    }
}

fileprivate extension Date {
    func string(with dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}

class Logger {
    var dateFormat: String = "hh:mm:ssSSS"

    var loggingSymbols: [String] = [
        "📖 VERBOSE",
        "🐝 DEBUG",
        "ℹ️ INFO",
        "⚠️ WARNING",
        "‼️ ERROR"
    ]

    private(set) var isLoggingEnabled: Bool
    private(set) var maxLoggingPriority: Int

    init(isEnabled: Bool = true, maxLoggingPriority: Int = .max) {
        isLoggingEnabled = isEnabled
        self.maxLoggingPriority = maxLoggingPriority
    }
}

private extension Logger {
    private func log(_ objects: Any, priority: Int, filename: String, line: Int, funcName: String) {
#if DEBUG
        if isLoggingEnabled && priority < maxLoggingPriority {
            print("\(Date().string(with: dateFormat)) \(loggingSymbols[priority]) \(filename.sourceFileName).\(funcName):\(line) - \(objects)")
        }
#endif
    }
}

extension Logger {
    func error(_ message: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        log(message, priority: 4, filename: filename, line: line, funcName: funcName)
    }

    func warning(_ message: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        log(message, priority: 3, filename: filename, line: line, funcName: funcName)
    }

    func info(_ message: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        log(message, priority: 2, filename: filename, line: line, funcName: funcName)
    }

    func debug(_ message: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        log(message, priority: 1, filename: filename, line: line, funcName: funcName)
    }

    func verbose(_ message: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        log(message, priority: 0, filename: filename, line: line, funcName: funcName)
    }
}
