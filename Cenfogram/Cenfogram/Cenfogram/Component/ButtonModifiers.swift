//
//  ButtonModifiers.swift
//  Cenfogram
//
//  Created by Estudiantes on 4/7/21.
//

import SwiftUI

struct ButtonModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(height: 20)
            .padding()
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .bold))
            .background(Color.black)
            .cornerRadius(5.0)
    }
}

