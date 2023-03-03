//
//  OnboardingCategorieView.swift
//  Activities
//
//  Created by Valentina Russo on 02/03/23.
//

import SwiftUI

protocol OnboardingCategoriesViewModelProtocol: ObservableObject {
    func onButtonTapped()
    func getUserData()
}

final class OnboardingCategoriesViewModel: OnboardingCategoriesViewModelProtocol {
    let onEndView: () -> Void
    
    init(onEndView: @escaping () -> Void) {
        self.onEndView = onEndView
    }
    
    func onButtonTapped() {
        onEndView()
    }
    
    func getUserData() {
        
    }
}

struct OnboardingCategoriesView<VM: OnboardingCategoriesViewModel>: View {
    let vm: VM
    
    var body: some View {
        VStack {
            Text("onboarding_categories_title")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Text("onboarding_subtitle")
                .padding(.top, 10)
            Section {
                Grid {
                    GridRow {
                        ForEach(1..<3) { _ in
                            Button {
                                
                            } label: {
//                                SquareSelector(selectorContent: <#T##Binding<String>#>)
                            }
                            .buttonStyle(.plain
                            )
                        }
                    }
                    GridRow {
                        ForEach(1..<3) { _ in
                            Button {
                                
                            } label: {
//                                SquareSelector()
                            }
                            .buttonStyle(.plain
                            )
                        }
                    }
                }
            }
            .padding(.top, 50)
            Spacer()
            WCButton(action: vm.onButtonTapped, text: "Start")
        }
        .padding()
    }
}

struct OnboardingCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCategoriesView(vm: OnboardingCategoriesViewModel(onEndView: { }))
    }
}
