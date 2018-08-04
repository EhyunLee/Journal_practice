//
//  ViewController.swift
//  Journal
//
//  Created by JinSeo Yoon on 2018. 7. 21..
//  Copyright © 2018년 Jinseo Yoon. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      /*
        view.backgroundColor = UIColor.orange
        
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellow
        view.addSubview(yellowView)
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        
        yellowView.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.top.leading.equalToSuperview()
        }
    
        blueView.snp.makeConstraints {
            $0.width.equalTo(yellowView).multipliedBy(0.5)
            $0.top.equalTo(yellowView.snp.bottom).offset(20)
            $0.centerX.equalTo(yellowView)
            $0.bottom.equalToSuperview()
        }
    
        redView.snp.makeConstraints {
            $0.height.equalTo(yellowView).multipliedBy(0.5)
            $0.top.equalTo(yellowView.snp.bottom).offset(20)
        }
        
        view.backgroundColor = UIColor.orange
        
        // subview를 생성하여 추가하기
        // UIView는 frame 생성자를 받음
        // CGRect: 사각형 왼쪽 모서리 기준 x,y,가로,세로
        // addSubview를 꼭 추가해야 함
        let subview = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        subview.backgroundColor = UIColor.black
        
        view.addSubview(subview)
        
        print(subview.frame)
        subview.center = view.center // Superview의 중앙에 넣겠다
        print(subview.frame)
        
        let subview_y = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        subview_y.backgroundColor = UIColor.yellow
        view.addSubview(subview_y)
        
        print(subview_y.frame)
        subview_y.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        print(subview_y.frame)
        
        
        let subview_r = UIView(frame: CGRect(x: view.bounds.width-100, y: view.bounds.height-100, width: 100, height: 100))
        subview_r.backgroundColor = UIColor.red
        view.addSubview(subview_r)
        
        print(subview_r.frame)
        subview_r.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        print(subview_r.frame)
        
        let rightSubview = UIView(frame: CGRect(x: view.bounds.width-100, y: 0, width: 100, height: 100))
        rightSubview.backgroundColor = UIColor.blue
        view.addSubview(rightSubview)
        
        print(rightSubview.frame)
        rightSubview.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        print(rightSubview.frame)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

