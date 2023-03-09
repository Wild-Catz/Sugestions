//
//  OnboardingCategorieView.swift
//  Activities
//
//  Created by Valentina Russo on 02/03/23.
//

import SwiftUI
import Combine

struct SelectableCategory {
    let category: Category
    var isChosen: Bool
    
    init(category: Category) {
        self.category = category
        self.isChosen = false
    }
}

protocol OnboardingCategoriesViewModelProtocol: ObservableObject {
    var selectatbleCategories: [SelectableCategory] { get }
    var isDisabled: Bool { get }
    func onButtonTapped()
}

final class OnboardingCategoriesViewModel: OnboardingCategoriesViewModelProtocol {
    @Published var selectatbleCategories: [SelectableCategory]
    var isDisabled: Bool
    let onEndView: (Set<Category>) -> Void
    var store = Set<AnyCancellable>()
    
    init(onEndView: @escaping (Set<Category>) -> Void) {
        self.selectatbleCategories = Category.allCases.map { SelectableCategory(category: $0) }
        self.onEndView = onEndView
        self.isDisabled = false
        $selectatbleCategories.sink { [weak self] in
            self?.isDisabled = $0.first { $0.isChosen } != nil
        }
        .store(in: &store)
    }
    
    func onButtonTapped() {
        let result: Set<Category> = Set(selectatbleCategories
            .filter { $0.isChosen }
            .map { $0.category }
        )
        onEndView(result)
    }
}

struct OnboardingCategoriesView<VM: OnboardingCategoriesViewModel>: View {
    @ObservedObject var vm: VM
    
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
                        ForEach(0..<2, id: \.self) { index in
                            CategoryButtonView(
                                color: Color(vm.selectatbleCategories[index].category.rawValue),
                                text: Category.completeStrings(str: vm.selectatbleCategories[index].category),
                                selected: vm.selectatbleCategories[index].isChosen) {
                                    vm.selectatbleCategories[index].isChosen.toggle()
                                }
                        }
                    }
                    GridRow {
                        ForEach(2..<4, id: \.self) { index in
                            CategoryButtonView(
                                color: Color(vm.selectatbleCategories[index].category.rawValue),
                                text: Category.completeStrings(str: vm.selectatbleCategories[index].category),
                                selected: vm.selectatbleCategories[index].isChosen) {
                                    vm.selectatbleCategories[index].isChosen.toggle()
                                }
                        }
                    }
                }
            }
            .padding(.top, 50)
            Spacer()
            WCButton(action: vm.onButtonTapped, text: "Save", color: .black, colorFor: .white)
                .disabled(!vm.isDisabled)
        }
        .padding()
        .toolbar(.hidden)
    }
}

struct OnboardingCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingCategoriesView(vm: OnboardingCategoriesViewModel(onEndView: ({ _ in })))
    }
}
