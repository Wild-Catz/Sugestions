//
//  OnboardingUserDataView.swift
//  Activities
//
//  Created by Valentina Russo on 01/03/23.
//

import SwiftUI
import Combine

protocol OnboardingUserDataViewModelProtocol: ObservableObject {
    var userName: String { get set }
    var gender: Gender { get set }
    var disableButton: Bool { get }
    func calculateDisabled()
    func onButtonTapped()
}

final class OnboardingUserDataViewModel: OnboardingUserDataViewModelProtocol {
    @Published var userName: String {
        didSet {
            self.calculateDisabled()
        }
    }

    @Published var gender: Gender
    @Published var disableButton: Bool
    
    let onQuestionView: (String, Gender) -> Void
    var store = Set<AnyCancellable>()

    init(onQuestionView: @escaping (String, Gender) -> Void) {
        self.onQuestionView = onQuestionView
        self.userName = ""
        self.gender = .none
        self.disableButton = true
    }
    
    func calculateDisabled() {
        self.disableButton = !(userName != "" && gender != .none)
    }
    
    func onButtonTapped() {
        onQuestionView(self.userName, self.gender)
    }
}

struct OnboardingUserDataView<VM: OnboardingUserDataViewModelProtocol>: View {
    @ObservedObject var vm: VM
    @State var userName: String
    
    var body: some View {
        VStack(spacing: 60) {
            Text("onboarding_user_data")
                .font(.largeTitle)
                .bold()
                .padding(.top)
            
            VStack(alignment: .leading) {
                Section {
                    Text("onboarding_user_name")
                        .font(.title2)
                        .fontWeight(.medium)
                    TextField("Name", text: $vm.userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 50)
                }
                Section {
                    Text("onboarding_gender")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding(.bottom, 10)
                    HStack {
                        Button {
                            vm.gender = .female
                            vm.calculateDisabled()

                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 13)
                                    .frame(height: 107)
                                    .foregroundColor(vm.gender == .male ? .gray.opacity(0.20) : .pink.opacity(0.20))
                                Text("👧🏻")
                                    .fontWeight(.medium)
                                    .font(.largeTitle)
                            }
                        }
                        Button {
                            vm.gender = .male
                            vm.calculateDisabled()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 13)
                                    .frame(height: 107)
                                    .foregroundColor(vm.gender == .female ? .gray.opacity(0.20) : .blue.opacity(0.20))
                                Text("👦🏻")
                                    .fontWeight(.medium)
                                    .font(.largeTitle)
                            }
                        }
                    }
                }

            }
            
            Spacer()
            WCButton(action: vm.onButtonTapped, text: "Next", color: .black, colorFor: .white)
                .disabled(vm.disableButton)
        }
        .padding()
        .toolbar(.hidden)
    }
}

struct OnboardingUserDataView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingUserDataView(vm: OnboardingUserDataViewModel(onQuestionView: { _,_ in }), userName: "")
    }
}
