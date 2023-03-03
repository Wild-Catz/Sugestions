//
//  OnboardingUserDataView.swift
//  Activities
//
//  Created by Valentina Russo on 01/03/23.
//

import SwiftUI

protocol OnboardingUserDataViewModelProtocol: ObservableObject {
    func onButtonTapped()
    func getUserData()
}

final class OnboardingUserDataViewModel: OnboardingUserDataViewModelProtocol {
    let onQuestionView: () -> Void
    
    init(onQuestionView: @escaping () -> Void) {
        self.onQuestionView = onQuestionView
    }
    
    func onButtonTapped() {
        onQuestionView()
    }
    
    func getUserData() {
        
    }
}

struct OnboardingUserDataView<VM: OnboardingUserDataViewModelProtocol>: View {
    let vm: VM
    @State var userName: String
//    @State var gender: String
    @State var gender: Gender
    
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
                    TextField("Name", text: $userName)
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
                            gender = .female
                        } label: {
                            ZStack {
                                Text("👧🏻")
                                    .fontWeight(.medium)
                                    .font(.title2)
                                RoundedRectangle(cornerRadius: 13)
                                    .frame(height: 107)
                                    .foregroundColor(.gray.opacity(0.20))
                            }
                        }
                        Button {
                            gender = .male
                        } label: {
                            ZStack {
                                Text("👦🏻")
                                    .fontWeight(.medium)
                                    .font(.title2)
                                RoundedRectangle(cornerRadius: 13)
                                    .frame(height: 107)
                                    .foregroundColor(.gray.opacity(0.20))
                            }
                        }
                        
//                        ForEach(Gender.allCases, id: \.rawValue) { gen in
//                            Button {
//                                print(1)
//                            } label: {
//                                SquareSelector(selectorContent: $gender)
//                            }
//                            .onAppear {
//                                gender = gen.rawValue
//                            }
//                            .buttonStyle(.plain)
//                        }
                    }
                }

            }
            
            Spacer()
            WCButton(action: vm.onButtonTapped, text: "Next")
        }
        .padding()
        .toolbar(.hidden)
    }
}

struct OnboardingUserDataView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingUserDataView(vm: OnboardingUserDataViewModel(onQuestionView: { }), userName: "", gender: .male)
    }
}
