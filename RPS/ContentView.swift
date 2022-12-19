//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Jack Kamaryt on 12/12/22.
//

import SwiftUI

//Views: ContentView, Names, Player1Choice, Player2Choice, FinalView
struct ContentView: View {
    var body: some View {
        NavigationView
        {
            VStack
            {
                CustomTextTitle(title: "Rock Paper Scissors")
                    .foregroundColor(.black)
                    .background(
                        Image("Grass")
                        .resizable()
                        .frame(width: 800, height: 1565)
                                            )
                NavigationLink("Play", destination: Names()
                    .navigationBarBackButtonHidden(true)
                    .foregroundColor(.black)
                )
                
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 3).padding(-5)
                )
                .foregroundColor(.black)
                .frame(width: 400, height: 300, alignment: .center)
                .padding()
                .font(.system(size: 20))
                Spacer()
                    
                    
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Names: View {
    @State private var player1NameInput = ""
    @State private var player2NameInput = ""
    var body: some View {
        NavigationView
        {
            VStack
            {
                HStack
                {
                    CustomText(text: "Player 1:")
                        .foregroundColor(.black)
                        .background(
                            Image("Grass")
                            .resizable()
                            .frame(width: 800, height: 1565)
                                                )
                    CustomTextField(placeholder: "", variable: $player1NameInput)
                }
                HStack
                {
                    CustomText(text: "Player 2:")
                    CustomTextField(placeholder: "", variable: $player2NameInput)
                }
                NavigationLink("Next", destination: Player1Choice(player1NameInput: player1NameInput, player2NameInput: player2NameInput)
                    .navigationBarBackButtonHidden(true)
                    .foregroundColor(.black)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 3).padding(-5)
                )
                .frame(width: 400, height: 300, alignment: .center)
                .padding()
                .font(.system(size: 20))
                Spacer()
                
            }
            .navigationTitle("Enter Names:")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Player1Choice: View{
    let player1NameInput: String
    let player2NameInput: String
    @State private var P1decider = 0
    @State private var p1Choice = ""
    @State private var display = ""
    
    var body: some View{
        NavigationView()
        {
            VStack
            {
                CustomTextTitle(title: "\(player1NameInput)")
                    .foregroundColor(.black)
                    .background(
                        Image("Grass")
                        .resizable()
                        .frame(width: 800, height: 1565)
                                            )
                    .padding()
                Picker("Selection", selection: $P1decider)
                {
                    Text("Rock").tag(1)
                    Text("Paper").tag(2)
                    Text("Scissors").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(40)
                .onChange(of: P1decider, perform: { newValue in
                    calculatePlayer1Choice()})
                if P1decider == 1
                {
                    Image("Rock")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    
                }
                
                if P1decider == 2
                {
                    Image("Paper")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                }
                if P1decider == 3
                {
                    Image("Scissors")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                }
                
                Image(display)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                
                NavigationLink("Next", destination: Player2Choice(player1NameInput: player1NameInput, player2NameInput: player2NameInput, p1Choice: p1Choice)
                    .navigationBarBackButtonHidden(true)
                    .foregroundColor(.black)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 3).padding(-5)
                )
                
                .font(.system(size: 20))
                Spacer()
            }
            //.navigationTitle("\(name1)")
            .navigationBarBackButtonHidden(true)
        }
    }
    func calculatePlayer1Choice()
    {
        if P1decider == 1
        {
            p1Choice = "rock"
        }
        else if P1decider == 2
        {
            p1Choice = "paper"
        }
        else if P1decider == 3
        {
            p1Choice = "scissors"
        }
        else {
            p1Choice = "rock"
        }
    }
}

struct Player2Choice: View{
    let player1NameInput: String
    let player2NameInput: String
    @State private var P2decider = 0
    @State private var p2Choice = ""
    let p1Choice : String
    var body: some View{
        NavigationView()
        {
            VStack
            {
                CustomTextTitle(title: "\(player2NameInput)")
                    .foregroundColor(.black)
                    .background(
                        Image("Grass")
                        .resizable()
                        .frame(width: 800, height: 1565)
                                            )
                    .padding()
                Picker("Selection", selection: $P2decider)
                {
                    Text("Rock").tag(1)
                    Text("Paper").tag(2)
                    Text("Scissors").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(40)
                .onChange(of: P2decider, perform: { newValue in
                    calculatePlayer2Choice()})
                if P2decider == 1
                {
                    Image("Rock")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    
                }
                
                if P2decider == 2
                {
                    Image("Paper")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                }
                if P2decider == 3
                {
                    Image("Scissors")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                }
                NavigationLink("Next", destination: FinalView(player1NameInput : player1NameInput, player2NameInput : player2NameInput, p1Choice: p1Choice, p2Choice: p2Choice)
                    .navigationBarBackButtonHidden(true)
                    .foregroundColor(.black)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.black, lineWidth: 3).padding(-5)
                )
                
                .font(.system(size: 20))
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    func calculatePlayer2Choice()
    {
        if P2decider == 1
        {
            p2Choice = "rock"
        }
        else if P2decider == 2
        {
            p2Choice = "paper"
        }
        else if P2decider == 3
        {
            p2Choice = "scissors"
        } else {
            p2Choice = "rock"
        }
    }
}

struct FinalView: View {
    
    let player1NameInput: String
    let player2NameInput: String
    let p1Choice : String
    let p2Choice : String
    
    var body: some View{
        NavigationView
        {
            VStack
            {
                Text("\(determineWinner(name1: player1NameInput, name2: player2NameInput, p1Choice: p1Choice, p2Choice: p2Choice))")
                    .foregroundColor(.black)
                    .font(.title).bold()
                    .background(
                        Image("Grass")
                        .resizable()
                        .frame(width: 800, height: 1565)
                                            )
                    .padding()
                HStack{
                    Text("\(player1NameInput) Chose:")
                        .foregroundColor(.black)
                        .padding()
                    Text("\(player2NameInput) Chose:")
                        .foregroundColor(.black)
                }
                HStack
                {
                    //P1 picture display under choice
                    if p1Choice == "rock"
                    {
                        Image("Rock")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                    if p1Choice == "paper"
                    {
                        Image("Paper")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                    if p1Choice == "scissors"
                    {
                        Image("Scissors")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                // P2 picture display under choice
                    if p2Choice == "rock"
                    {
                        Image("Rock")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                    if p2Choice == "paper"
                    {
                        Image("Paper")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                    if p2Choice == "scissors"
                    {
                        Image("Scissors")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                }
                
                
                HStack
                {
                    NavigationLink("Rematch", destination: Player1Choice(player1NameInput: player1NameInput, player2NameInput: player2NameInput)
                        .navigationBarBackButtonHidden()
                        .foregroundColor(.black)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 3).padding(-5)
                    )
                    
                    .font(.system(size: 20))
                    
                    .padding()
                    
                    
                    NavigationLink("New Game", destination: Names()
                        .navigationBarBackButtonHidden()
                        .foregroundColor(.black)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.black, lineWidth: 3).padding(-5)
                    )
                    
                    .font(.system(size: 20))
                }
                Spacer()
                
            }
        }
    }
    
    func determineWinner(name1 : String, name2 : String, p1Choice: String, p2Choice: String) -> String
    {
        var text = ""
        //TIE GAME
        if p1Choice == p2Choice
        {
            text = "Tie - Game"
        }
        // Player 1 Winning
        else if p1Choice == "rock" && p2Choice == "scissors"
        {
            text  = "Winner: \(name1)"
            
        }
        else if p1Choice == "paper" && p2Choice == "rock"
        {
            text  = "Winner: \(name1)"
        }
        else if p1Choice == "scissors" && p2Choice == "paper"
        {
            text  = "Winner: \(name1)"
        }
        //Player 2 Winning
        else {
            text = "Winner: \(name2)"
        }
        return text
    }
    
}

// Customs
struct CustomTextTitle: View{
    let title : String
    var body: some View {
        Text(title)
            .font(.title).bold()
    }
}
struct CustomText: View {
    let text : String
    var body: some View {
        Text(text)
            .fontWeight(.bold)
    }
}
struct CustomTextField: View {
    let placeholder : String
    let variable : Binding<String>
    var body: some View {
        TextField(placeholder, text: variable)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30, alignment: .center)
            .font(.body)
            .padding()
    }
}
