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
            MainButtonView()
                .frame(height: 400)
                .padding(.horizontal, 10)
            Spacer()
        }
        .background(Color("MainBackgroundScreen"))
        .toolbar(.hidden)
    }

    var startButton: some View {
        Button(action: viewModel.onButtonTap) {
            Text("start_button_label")
                .foregroundColor(Color.accentColor)
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .background(Color.primary)
        .cornerRadius(10)
        .padding(.horizontal, 30)
        .padding(.bottom, Const.bottomPadding)
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
