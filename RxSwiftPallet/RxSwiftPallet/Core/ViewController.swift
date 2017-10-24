//
//  ViewController.swift
//  RxSwift&MVVMDemo
//
//  Created by welkj on 2017/10/23.
//  Copyright © 2017年 Heinz. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
/**MVVM中的视图控制器
 *Controller 在MVVM中担任的职责是加载和布局视图，它更偏向于View
 *但是同时他要负责视图于VM的双向绑定
 */
class ViewController: UIViewController {
    
    private let viewModel = ViewModel()
    
    private let localView: LocalView = {
        let localView = LocalView.init(frame: CGRect.zero)
        return localView
    }()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.subscribeObservers()
        
        self.view.addSubview(localView)
        //下面实现的是相互关联数据的相互绑定
        //注* Map ：通过Map方法将序列中的数据类型转换成我们需要的数据类型，Map等函数的用法详见Swift高阶函数
        //r
        localView.r_slider.rx.value.changed
            .map { UInt($0) }
            .bind(to: viewModel.r_value)
            .addDisposableTo(disposeBag)
        viewModel.r_obser
            .map { Float($0) }
            .bind(to: localView.r_slider.rx.value)
            .addDisposableTo(disposeBag)
        localView.r_textField.rx.text.orEmpty
            .map { UInt($0) ?? 0 }
            .bind(to: viewModel.r_value)
            .addDisposableTo(disposeBag)
        //g
        localView.g_slider.rx.value.changed
            .map { UInt($0) }
            .bind(to: viewModel.g_value)
            .addDisposableTo(disposeBag)
        viewModel.g_obser
            .map { Float($0) }
            .bind(to: localView.g_slider.rx.value)
            .addDisposableTo(disposeBag)
        localView.g_textField.rx.text.orEmpty
            .map { UInt($0) ?? 0 }
            .bind(to: viewModel.g_value)
            .addDisposableTo(disposeBag)
        //b
        localView.b_slider.rx.value.changed
            .map { UInt($0) }
            .bind(to: viewModel.b_value)
            .addDisposableTo(disposeBag)
        viewModel.b_obser
            .map { Float($0) }
            .bind(to: localView.b_slider.rx.value)
            .addDisposableTo(disposeBag)
        localView.b_textField.rx.text.orEmpty
            .map { UInt($0) ?? 0 }
            .bind(to: viewModel.b_value)
            .addDisposableTo(disposeBag)
        
        //这个函数请忽略，这个视图是模拟数据到达后的模拟视图
        self.addFakeView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        localView.frame = CGRect.init(x: 0, y: 150, width: self.view.frame.size.width, height: self.view.frame.size.height - 150)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController {
    func addFakeView() {
        let view = Model.fakeView
        self.view.addSubview(view)
        view.backgroundColor = UIColor.black
        view.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 150)
    }
}



