//
//  MainView.swift
//  Activities
//
//  Created by Roman Gorbenko on 17/02/23.
//

import SwiftUI

private enum Const {
    static var bottomPadding: CGFloat = 33
    static var profileSize: CGFloat = 50
}

protocol MainViewModelProtocol: ObservableObject {
    var person: Person { get }
    func onButtonTap()
}

class MainViewModel: MainViewModelProtocol {
    var personService: PersonServiceProtocol
    @Published var person: Person
    var onDetailsScreen: () -> Void

    init(personService: PersonServiceProtocol, onDetailsScreen: @escaping () -> Void) {
        self.onDetailsScreen = onDetailsScreen
        self.personService = personService
        self.person = personService.getPerson()
    }

    func onButtonTap() {
        onDetailsScreen()
    }
}

struct MainView<VM: MainViewModelProtocol>: View {
    let viewModel: VM

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Welcome back,")
                        .font(.largeTitle)
                    Text(viewModel.person.name + "!")
                        .font(.largeTitle)
                        .bold()
                }
                Spacer()
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 48, height: 48)
            }
            .padding(.top, 40)
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
            Button(action: viewModel.onButtonTap) {
                MainButtonView()
                    .frame(height: 400)
                    .padding(.horizontal, 10)
            }
            .foregroundColor(.primary)
            Spacer()
        }
        .background(Color("MainBackgroundScreen"))
        .toolbar(.hidden)
    }

    var shape: some View {
        Image("shape")
            .resizable()
            .aspectRatio(0.71, contentMode: .fit)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(personService: FakePersonService(), onDetailsScreen: { }))
    }
}
