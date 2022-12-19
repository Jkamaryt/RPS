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
                    CustomTextField(placeholder: "", variable: $player1NameInput)
                }
                HStack
                {
                    CustomText(text: "Player 2:")
                    CustomTextField(placeholder: "", variable: $player2NameInput)
                }
                NavigationLink("Next", destination: Player1Choice(name1: player1NameInput, name2: player2NameInput)
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

struct Names_Previews: PreviewProvider {
    static var previews: some View {
        Names()
    }
}



struct Player1Choice: View{
    let name1: String
    let name2: String
    @State private var P1decider = 0
    @State private var P1Rock = 0
    @State private var P1Paper = 0
    @State private var P1Scissors = 0
    var body: some View{
        NavigationView()
        {
            VStack
            {
                
                
                CustomTextTitle(title: "\(name1)")
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
                NavigationLink("Next", destination: Player2Choice(name1: name1, name2: name2, P1decider: 0, P1Rock: 0, P1Paper: 0, P1Scissors: 0)
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
            P1Rock = 1
        }
        else if P1decider == 2
        {
            P1Paper = 1
        }
        else if P1decider == 3
        {
            P1Scissors = 1
        }
    }
}



struct Player1Choice_Previews: PreviewProvider {
    static var previews: some View {
        Player1Choice(name1 : "", name2 : "")
    }
}

struct Player2Choice: View{
    let name1: String
    let name2: String
    let P1decider: Int
    @State private var P2decider = 0
    let P1Rock: Int
     let P1Paper: Int
     let P1Scissors: Int
    @State private var P2Rock = 0
    @State private var P2Paper = 0
    @State private var P2Scissors = 0
    var body: some View{
        NavigationView()
        {
            VStack
            {
                CustomTextTitle(title: "\(name2)")
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
                NavigationLink("Next", destination: FinalView(name1 : "\(name1)", name2 : "\(name2)", P1decider : 0, P2decider: 0, P1Rock : 0, P1Paper : 0, P1Scissors : 0, P2Rock : 0, P2Paper : 0, P2Scissors : 0)
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
            P2Rock = 1
        }
        else if P2decider == 2
        {
            P2Paper = 1
        }
        else if P2decider == 3
        {
            P2Scissors = 1
        }
    }
}

struct Player2Choice_Previews: PreviewProvider {
    static var previews: some View {
        Player2Choice(name1 : "", name2 : "", P1decider : 0, P1Rock : 0, P1Paper : 0, P1Scissors : 0)
    }
}

struct FinalView: View{
    
    let name1: String
    let name2: String
    let P1decider: Int
    let P2decider: Int
    let P1Rock: Int
    let P1Paper: Int
    let P1Scissors: Int
    let P2Rock: Int
    let P2Paper: Int
    let P2Scissors: Int
    @State private var Winner = ""
    @State private var TieGame = "Nobody"
    
    var body: some View{
        NavigationView
        {
            Text("Winner: \(Winner)")
           
            
        }
    }
    
    func determineWinner(name1 : String, name2 : String, P1decider : Int, P2decider: Int, P1Rock : Int, P1Paper : Int, P1Scissors : Int, P2Rock : Int, P2Paper : Int, P2Scissors : Int, Winner : String, TieGame : String) -> String
    {
        // All Wins for P1
        
        if P1Rock == 1 && P2Scissors == 1
        {
            self.Winner = name1
        }
        else if P1Paper == 1 && P2Rock == 1
        {
            self.Winner = name1
        }
        else if P1Scissors == 1 && P2Paper == 1
        {
            self.Winner = name1
        }
        
        // All Wins for P2
        
        else if P2Rock == 1 && P1Scissors == 1
        {
            self.Winner = name2
        }
        else if P2Paper == 1 && P1Rock == 1
        {
            self.Winner = name2
        }
        else if P2Scissors == 1 && P1Paper == 1
        {
            self.Winner = name2
        }
        
        // All Tie Games
        
        else if P1Rock == 1 && P2Rock == 1
        {
            self.Winner = TieGame
        }
        else if P1Paper == 1 && P2Paper == 1
        {
            self.Winner = TieGame
        }
        else if P1Scissors == 1 && P2Scissors == 1
        {
            self.Winner = TieGame
        }
        return"Winner: \(Winner)"
        
    }
    
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView(name1 : "", name2 : "", P1decider : 0, P2decider : 0, P1Rock : 0, P1Paper : 0, P1Scissors : 0, P2Rock : 0, P2Paper : 0, P2Scissors : 0)
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
