//
//  OnboardingCategorieView.swift
//  Activities
//
//  Created by Valentina Russo on 02/03/23.
//

import SwiftUI

protocol OnboardingCategoriesViewModelProtocol: ObservableObject {
    func onButtonTapped()
    func getCategories()
}

final class OnboardingCategoriesViewModel: OnboardingCategoriesViewModelProtocol {
    var selectedCategories: [(category: Category, select: Bool)]
    var isDisabled: Int
    var chosenCategory: [Category]
    let onEndView: () -> Void
    
    init(onEndView: @escaping () -> Void) {
        self.selectedCategories = []
        self.chosenCategory = []
        self.onEndView = onEndView
        self.isDisabled = 0
    }
    
    func getCategories() {
//        ForEach(0..<4) { index in
//            if selectedCategories[index].select! == true {
//                chosenCategory.append(selectedCategories[index].category)
//            }
//        }
    }
    
    func onButtonTapped() {
        onEndView()
        getCategories()
    }
}

struct OnboardingCategoriesView<VM: OnboardingCategoriesViewModel>: View {
    let vm: VM
    @State var selectedCategories: [(category: Category, select: Bool)]
    @State var isDisabled: Int
    
    var body: some View {
        VStack {
            Spacer()
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
                        Button {
                            selectedCategories[0].select.toggle()
                            if selectedCategories[0].select == true {
                                isDisabled += 1
                            } else {
                                isDisabled -= 1
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 13)
                                    .frame(height: 120)
                                    .foregroundColor(selectedCategories[0].select == false ? .gray.opacity(0.20) : Color(String("\(selectedCategories[0].category)")))
                                Text("Receptive \nlanguage")
                                    .fontWeight(.medium)
                                    .font(.title2)
                            }
                        }
                        .buttonStyle(.plain)
                        
                        Button {
                            selectedCategories[1].select.toggle()
                            if selectedCategories[1].select {
                                isDisabled += 1
                            } else {
                                isDisabled -= 1
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 13)
                                    .frame(height: 120)
                                    .foregroundColor(selectedCategories[1].select == false ? .gray.opacity(0.20) : Color(String("\(selectedCategories[1].category)")))
                                Text("Expressive \nlanguage")
                                    .fontWeight(.medium)
                                    .font(.title2)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                    GridRow {
                        Button {
                            selectedCategories[2].select.toggle()
                            if selectedCategories[2].select {
                                isDisabled += 1
                            } else {
                                isDisabled -= 1
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 13)
                                    .frame(height: 120)
                                    .foregroundColor(selectedCategories[2].select == false ? .gray.opacity(0.20) : Color(String("\(selectedCategories[2].category)")))
                                Text("Problem \nsolving")
                                    .fontWeight(.medium)
                                    .font(.title2)
                            }
                        }
                        .buttonStyle(.plain)
                        
                        Button {
                            selectedCategories[3].select.toggle()
                            if selectedCategories[3].select {
                                isDisabled += 1
                            } else {
                                isDisabled -= 1
                            }
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 13)
                                    .frame(height: 120)
                                    .foregroundColor(selectedCategories[3].select == false ? .gray.opacity(0.20) : Color(String("\(selectedCategories[3].category)")))
                                Text("Motor \nabilities")
                                    .fontWeight(.medium)
                                    .font(.title2)
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.top, 50)
            Spacer()
            WCButton(action: vm.onButtonTapped, text: "Start", color: .black, colorFor: .white)
                .disabled(isDisabled == 0)
        }
        .padding()
        .toolbar(.hidden)
    }
}

struct OnboardingCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCategoriesView(vm: OnboardingCategoriesViewModel(onEndView: { }), selectedCategories: [(category: .receptive, select: false), (category: .expressive, select: false), (category: .problemSolving, select: false), (category: .fineMotory, select: false)], isDisabled: 0)
    }
}
