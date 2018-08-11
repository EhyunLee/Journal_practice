//
//  ViewController.swift
//  Journal
//
//  Created by JinSeo Yoon on 2018. 7. 21..
//  Copyright © 2018년 Jinseo Yoon. All rights reserved.
//

import UIKit
import SnapKit

extension DateFormatter {
    static var entryDateFormatter: DateFormatter = {
        let df = DateFormatter.init()
        df.dateFormat = "yyyy. MM. dd. EEE"
        return df
    }()
}

class EntryViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    private let journal: Journal = InMemoryJournal()
    private var editingEntry: Entry?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       textView.text = "첫 번째 일기"
       dateLabel.text = DateFormatter.entryDateFormatter.string(from: Date())
        
        // 질문? 왜 IBACtion을 쓰지 않고 코드로 구현하는지?
        button.addTarget(self,
                         action: #selector(saveEntry(_:)),
                         for: .touchUpInside)
        // IBAction 대신 코드로 버튼 동작 구현
    }
    
    // 시작시 키보드 띄우기
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textView.becomeFirstResponder()
    }
    
    /* override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } */
    
    @objc private func saveEntry(_ sender: Any) {
        if let oldEntry = self.editingEntry {
            oldEntry.text = textView.text
            journal.update(oldEntry)
        } else {
            let newEntry: Entry = Entry(id: UUID(), createdAt: Date(), text: textView.text)
            journal.add(newEntry)
            editingEntry = newEntry
        }
        
        updateSubViews(for: false) // update SubViews
    }

    /*
    @IBAction func saveEntry(_ sender: Any) {
        let entry: Entry = Entry(id: UUID(), createdAt: Date(), text: textView.text)
        journal.add(entry)
        
        print("Entry Saved(\(journal.numberOfEntries))") // 저장횟수 담기
        textView.resignFirstResponder() // 저장시 키보드 내리기
        textView.isEditable = false // 저장 후에는 TextView 비활성화
        button.setTitle("수정하기", for: .normal) // 버튼 타이틀을 변경
    }*/
    
    // 수정하기 함수 추가
    @objc private func editEntry() {
        updateSubViews(for: true)
    }
    

    private func updateSubViews(for isEditing: Bool) {
        if isEditing {
            textView.isEditable = true
            textView.becomeFirstResponder()
            
            button.setTitle("저장하기", for: .normal)
            button.addTarget(self, action: #selector(saveEntry(_:)), for: .touchUpInside)
        } else {
            textView.isEditable = false
            textView.resignFirstResponder()
            
            button.setTitle("수정하기", for: .normal)
            button.addTarget(self, action: #selector(editEntry), for: .touchUpInside)
        }
    }
}

