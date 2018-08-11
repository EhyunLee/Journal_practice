//
//  Journal.swift
//  Journal
//
//  Created by JinSeo Yoon on 2018. 8. 3..
//  Copyright © 2018년 Jinseo Yoon. All rights reserved.
//

import Foundation

protocol Journal {
    var numberOfEntries: Int { get }
    
    func add(_ entry: Entry)
    func update(_ entry: Entry)
    func remove(_ entry: Entry)
    func entry(with id: UUID) -> Entry?
    func recentEntries(max: Int) -> [Entry]
}

// 메모리에 없는 Journal도 있을것, 데이터베이스나 서버... 인터페이스에서 약속한대로 데이터를 주고받는지를 확인하는 작업
class InMemoryJournal: Journal {
    
    private var entries: [UUID: Entry] // 빈 딕셔너리로 구현
    var numberOfEntries: Int { return entries.count } // 저장 횟수 담기
    
    init(entries: [Entry] = []) {
        var result: [UUID: Entry] = [:]
        entries.forEach { entry in
            result[entry.id] = entry
        }
        self.entries = result
    }
    
    func add(_ entry: Entry) {
        entries[entry.id] = entry
    }
    func update(_ entry: Entry) {
        
    }
    func remove(_ entry: Entry) {
        entries[entry.id] = nil
    }
    
    func entry(with id: UUID) -> Entry? {
        return entries[id]
    }
    
    func recentEntries(max: Int) -> [Entry] {
        return entries
            .values
            .sorted { $0.createdAt > $1.createdAt }
    }
}
