//
//  JournalTests.swift
//  JournalTests
//
//  Created by JinSeo Yoon on 2018. 7. 28..
//  Copyright © 2018년 Jinseo Yoon. All rights reserved.
//

import XCTest
import Nimble
@testable import Journal

class JournalTests: XCTestCase {
    /* 중복되는 테스트 케이스를 한 곳에서 관리
    var newEntry: Entry!
    
    override func setUp() {
        newEntry = Entry(id: 1, createdAt: Date(), text: "일기")
    }
 */
    
    func testEditEntryText() {
        // Setup
        let entry = Entry(id: UUID(), createdAt: Date(), text: "첫 번째 일기")
        
        // Run
        entry.text = "첫 번째 테스트"
        
        // Verify
        
        XCTAssertEqual(entry.text, "첫 번째 테스트")
        //expect(entry.text).to(equal("첫 번째 테스트"))
    }
    
    func testAddEntryToJournal() {
        // Setup
        let journal = InMemoryJournal()
        let newEntry = Entry(id: UUID(), createdAt: Date(), text: "일기")
        
        // Run
        journal.add(newEntry)
        
        // Verify
        let entryInJournal: Entry? = journal.entry(with: UUID())
        
        expect(entryInJournal).to(equal(newEntry))
        expect(entryInJournal) === newEntry
        expect(entryInJournal).to(beIdenticalTo(newEntry))
        
        XCTAssertEqual(entryInJournal, .some(newEntry))
        XCTAssertTrue(entryInJournal === newEntry) // ===는 클래스만 사용할 수 있는 
        XCTAssertTrue(entryInJournal?.isIdentical(to: newEntry) == true)
    }
    
    // 일기장에서 일기 가져오기 테스트
    func testGetEntrywithId() {
        // Setup
        let oldEntry = Entry(id: UUID(), createdAt: Date(), text: "일기")
        let journal = InMemoryJournal(entries: [oldEntry])
        
        // Run
        let entry = journal.entry(with: UUID())
        
        // Verify
        XCTAssertEqual(entry, .some(oldEntry))
        XCTAssertTrue(entry?.isIdentical(to: oldEntry) == true)
    }
    
    // 일기장에 일기 업데이트 하기
    func testUpdateEntry() {
        //Setup
        let oldEntry = Entry(id: UUID(), createdAt: Date(), text: "일기")
        let journal = InMemoryJournal(entries: [oldEntry])
        
        //Run
        oldEntry.text = "수정된 일기 내용"
        journal.update(oldEntry)
        
        //verify
        let entry = journal.entry(with: UUID())
        XCTAssertEqual(entry, .some(oldEntry))
        XCTAssertTrue(entry?.isIdentical(to: oldEntry) == true)
        XCTAssertEqual(entry?.text, .some("수정된 일기 내용"))
    }
    
    // 일기장에서 일기 지우기
    func testRemoveEntryFromJournal() {
        let oldEntry = Entry(id: UUID(), createdAt: Date(), text: "일기")
        let journal = InMemoryJournal(entries: [oldEntry])
        
        journal.remove(oldEntry)
        
        let entry = journal.entry(with: UUID())
        XCTAssertEqual(entry, nil)
    }
    
    // 일기장에서 최근 작성된 순으로 일기 가져오기
    func testRecentEntryOrder() {
        let bYesterday = Entry(id: UUID(), createdAt: Date.distantPast, text: "1")
        let yesterday = Entry(id: UUID(), createdAt: Date(), text: "2")
        let today = Entry(id: UUID(), createdAt: Date.distantFuture, text: "3")
        let journal = InMemoryJournal(entries: [bYesterday, yesterday, today])
        
        let entries = journal.recentEntries(max: 3)
        
        XCTAssertEqual(entries.count, 3)
        XCTAssertEqual(entries, [today, yesterday, bYesterday])
    }
    
    
    func test_최근_순으로_엔트리를_불러올_수_있다() {
        // Setup
        let dayBeforeYesterday = Entry(id: UUID(), createdAt: Date.distantPast, text: "그저께 일기")
        let yesterDay = Entry(id: UUID(), createdAt: Date(), text: "어제 일기")
        let today = Entry(id: UUID(), createdAt: Date.distantFuture, text: "오늘 일기")
        let journal = InMemoryJournal(entries: [dayBeforeYesterday, yesterDay, today])
        // Run
        let entries = journal.recentEntries(max: 3)
        // Verify
        XCTAssertEqual(entries.count, 3)
        XCTAssertEqual(entries, [today, yesterDay, dayBeforeYesterday])
    }
    
    func test_엔트리의_개수를_반환한다() { // Setup
        let dayBeforeYesterday = Entry(id: UUID(), createdAt: Date.distantPast, text: "그저께 일기")
        let yesterDay = Entry(id: UUID(), createdAt: Date(), text: "어제 일기")
        let today = Entry(id: UUID(), createdAt: Date.distantFuture, text: "오늘 일기")
        let journal = InMemoryJournal(entries: [dayBeforeYesterday, yesterDay, today])
        
        // Verify
        expect(journal.numberOfEntries).to(equal(0))
        journal.add(dayBeforeYesterday)
        expect(journal.numberOfEntries).to(equal(1))
        journal.add(yesterDay)
        expect(journal.numberOfEntries).to(equal(2))
        journal.add(today)
        expect(journal.numberOfEntries).to(equal(3))
    }

}


