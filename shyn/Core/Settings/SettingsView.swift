//
//  SettingsView.swift
//  SwiftCoin
//
//  Created by Stephen Dowless on 1/21/22.
//

import SwiftUI

struct SettingsView: View {
    @State var darkModeEnabled = false
    @State var enableFaceId = false
    @State var enableNotifications = false
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Anzeige bearbeiten")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    SettingsToggleRowView(imageName: "s",
                                          title: "Darkmode",
                                          imageTintColor: .yellow,
                                          isOn: $darkModeEnabled)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Sicherheit")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    VStack {
                        SettingsToggleRowView(imageName: ".FaceID",
                                              title: "Face ID nutzen",
                                              imageTintColor: Color(.yellow),
                                              isOn: $enableFaceId)
                        
                        Divider()
                            .padding(.horizontal)
                        
                        SettingsRowView(imageName: "", title: "Seedphrase anzeigen", imageTintColor: .yellow)
                        
                        Divider()
                            .padding(.horizontal)
                        
                        SettingsRowView(imageName: "", title: "Passcode der Wallet ändern", imageTintColor: .yellow)
                        
                    }
    //                .padding(.vertical, 4)
                    .background(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(Color.theme.itemBackgroundColor)
                    
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Benachrichtigungen")
                        .font(.headline)
                        .fontWeight(.semibold)

                    SettingsToggleRowView(imageName: "",
                                          title: " Erlaube Benachrichtigungen",
                                          imageTintColor: Color(.yellow),
                                          isOn: $enableNotifications)
                }
                .padding()
                
    //            Spacer()
                
                VStack(alignment: .leading) {
                    Text("Währungen")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Button {
                        AuthViewModel.shared.signOut()
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "")
                                .font(.title)
                                .foregroundColor(Color(.systemRed))

                            Text("Anzeigewährung ändern")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.theme.accent)
                            
                            Spacer()
                        }
                        .padding(.leading)
                    }
                    .frame(height: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.theme.itemBackgroundColor)
                    )
                    
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Wallet")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Button {
                        AuthViewModel.shared.signOut()
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        HStack {
                            Text("Wallet vom Gerät entfernen")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.theme.accent)
                            
                            Spacer()
                        }
                        .padding(.leading)
                    }
                    
                    .frame(height: 48)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.theme.itemBackgroundColor)
                    )
                    
                }
                .padding()
                Spacer()
                
                
            }
            .navigationTitle("Einstellungen")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }

                }
            }
            .background(Color.theme.background)
        }
    }
}

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let imageTintColor: Color
    
    var body: some View {
        HStack {
            HStack {
                

                Text(title)
                    .font(.subheadline)
                    .foregroundColor(Color.theme.accent)
                
                Spacer()
            }
            .frame(height: 48)
            .padding(.leading)
        }
    }
}

struct SettingsToggleRowView: View {
    let imageName: String
    let title: String
    let imageTintColor: Color
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Image(systemName: imageName)
                .font(.title2)
                .imageScale(.large)
                .foregroundColor(imageTintColor)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color.theme.accent)
        }
        .padding(.horizontal)
        .frame(height: 48)
        .background(Color.theme.itemBackgroundColor)
        .cornerRadius(10)
        .toggleStyle(SwitchToggleStyle(tint: .blue))
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
    }
}
