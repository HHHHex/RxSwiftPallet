//
//  ViewModel.swift
//  RxSwift&MVVMDemo
//
//  Created by welkj on 2017/10/23.
//  Copyright © 2017年 Heinz. All rights reserved.
//

import UIKit
import RxSwift

/** ViewModel
 *在这里介绍一个ViewModel的使用过程
 *ViewModel只处理业务逻辑相关内容
 */

/**push，present等视图逻辑需要交给视图控制器进行完成，
 *所以这里需要设置针对视图控制器的协议
 *ViewModelDelegate
 *需要业务逻辑进行的视图操作,需要这样设置代理
 *如果是视图逻辑的操作则不需要代理和协议，可直接在控制器中完成push等操作
 */
protocol ViewModelDelegate: NSObjectProtocol {
    func nextController()
    func showHUD()
}

/**不继承NSObject 因为要在要在init方法里进行初始化*/
class ViewModel {
    /**(这里只做属性设置，用以理解视图逻辑和业务逻辑要区分开，并未做实际代理操作)*/
    weak var viewController: ViewModelDelegate?
    let model: Model
/***********************值与可观察对象***********************************/
    let r_value = Variable<UInt>(0)
    let r_obser: Observable<UInt>
/****************************************************************/
    let g_value = Variable<UInt>(0)
    let g_obser: Observable<UInt>
/****************************************************************/
    let b_value = Variable<UInt>(0)
    let b_obser: Observable<UInt>
    
    let disposeBag = DisposeBag()

    /**初始化客观察对象*/
    init() {
        self.model = Model()
        self.r_obser = r_value.asObservable()
        self.g_obser = g_value.asObservable()
        self.b_obser = b_value.asObservable()
    }
    //订阅Observable，及接收到消息后进行如何对消息中的数据进行处理的方法（处理时会涉及到与业务逻辑相关的判断）
    func subscribeObservers() {
        r_obser.subscribe { (event) in
            guard let value = event.element else { return }
            if value <= 255 {
                self.model.red = value
                self.setFakeViewColor()
            }
            }.addDisposableTo(disposeBag)
        g_obser.subscribe { (event) in
            guard let value = event.element else { return }
            if value <= 255 {
                self.model.green = value
                self.setFakeViewColor()
            }
            }.addDisposableTo(disposeBag)
        b_obser.subscribe { (event) in
            guard let value = event.element else { return }
            if value <= 255 {
                self.model.blue = value
                self.setFakeViewColor()
            }
            }.addDisposableTo(disposeBag)
    }
    //业务逻辑，操作收到的新数据
    private func setFakeViewColor() {
        Model.fakeView.backgroundColor = model.color
    }
    
    
}
