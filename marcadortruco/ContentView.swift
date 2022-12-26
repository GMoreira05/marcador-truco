//
//  ContentView.swift
//  marcadortruco
//
//  Created by Gabriel on 25/12/22.
//

import SwiftUI

extension View {
    func inExpandingRectangle() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
            self
        }
    }
}

class Equipe {
    var nome: String
    var pontos: Int
    var vitorias: Int
    
    init(nome: String) {
        self.nome = nome
        self.pontos = 0
        self.vitorias = 0
    }
    
    func addPontos(_qtd: Int){
        self.pontos += _qtd
    }
    
    func reset(){
        self.pontos = 0
        self.vitorias = 0
    }
}

struct BotaoPrimario: View {
    var title: String
    var size: CGFloat = 15
    var action: () -> Void

    var body: some View {
        Button(title, action: action)
            .foregroundColor(Color("TextoBotao"))
            .font(.system(size: size, weight: Font.Weight.bold))
            .padding(10)
            .padding(.horizontal, 20)
            .background(Color("FundoBotao"))
            .cornerRadius(10)
    }
}

struct ContentView: View {
    @EnvironmentObject var dadosTimes: DadosTimes
    var body: some View {
        TabView{
            HomeView()
                .tabItem({
                    Image(systemName: "house")
                    Text("Placar")
                })
            
            ConfigView()
                .tabItem({
                    Image(systemName: "gear")
                    Text("Configurações")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DadosTimes())
    }
}

class DadosTimes: ObservableObject{
    @Published var a_nome = "Nós"
    @Published var a_pontos = 0
    @Published var a_vitorias = 0
    
    @Published var b_nome = "Eles"
    @Published var b_pontos = 0
    @Published var b_vitorias = 0
    
    @Published var notificar_vitoria = true
}
