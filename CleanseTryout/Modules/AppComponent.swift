//
//  AppComponent.swift
//  CleanseTryout
//
//  Created by Tom van der Spek on 12/03/2019.
//

import Cleanse

struct AppComponent: Cleanse.RootComponent {
    typealias Root = PropertyInjector<AppDelegate>
    typealias Scope = AppScope
    
    static func configure(binder: AppBinder) {
        binder.include(module: CoreAppModule.self)
    }
    
    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.propertyInjector(configuredWith: CoreAppModule.configureAppDelegateInjector)
    }
}


struct CoreAppModule : Cleanse.Module {
    static func configure(binder: AppBinder) {
        binder.include(module: Modules.App.self)
    }
    
    static func configureAppDelegateInjector(binder bind: PropertyInjectionReceiptBinder<AppDelegate>) -> BindingReceipt<PropertyInjector<AppDelegate>> {
        return bind.to(injector: AppDelegate.injectProperties)
    }
}
