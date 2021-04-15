//
//  ContentView.swift
//  Cenfogram
//
//  Created by Estudiantes on 4/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var mail = ""
    @State private var password = ""
    
    var body: some View {
        VStack{
            FormField(value: $mail, icon: "mail", placeHolder: "Email")
            FormField(value: $password, icon: "lock", isSecure: true, placeHolder: "Password" )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
