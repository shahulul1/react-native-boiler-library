//
//  SampleDetailScreen.swift
//  BoilerPlateCode
//
//  Created by Shahulul Faris on 25/10/23.
//

import SwiftUI

@available(iOS 13.0, *)
struct SampleDetailScreen: View {
    @SwiftUI.Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Spacer()
                Button("Event pass") {
                    NotificationCenter.default.post(name: NSNotification.Name("event"), object: nil)
                }
                Spacer()
                Button("back") {
                    mode.wrappedValue.dismiss()
                }
            }
           
           
        }
       
    }
}

