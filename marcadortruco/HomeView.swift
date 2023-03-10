//
//  HomeView.swift
//  marcadortruco
//
//  Created by Gabriel on 25/12/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dadosTimes: DadosTimes
    
    @State var alguem_ganhou = false
    @State var ganhador = ""
    
    func resetaTudo(){
        dadosTimes.a_pontos = 0
        dadosTimes.a_vitorias = 0

        dadosTimes.b_pontos = 0
        dadosTimes.b_vitorias = 0
    }
    
    func verificaGanhador(){
        if(dadosTimes.a_pontos > 11 || dadosTimes.b_pontos > 11){
            if(dadosTimes.a_pontos > 11)
            {
                dadosTimes.a_vitorias+=1
                ganhador = "a"
            }
            else if(dadosTimes.b_pontos > 11)
            {
                dadosTimes.b_vitorias+=1
                ganhador = "b"
            }
            dadosTimes.a_pontos = 0
            dadosTimes.b_pontos = 0
            
            if(dadosTimes.notificar_vitoria == true){
                alguem_ganhou = true
            }
        }
    }
    
    var body: some View {
        ZStack{
            Color("FundoVerde")
                .ignoresSafeArea()
            VStack {
                HStack{
                    VStack(spacing: 0){
                        Text(dadosTimes.a_nome)
                            .foregroundColor(Color.black)
                            .font(.system(size: 50))
                        Text(String(dadosTimes.a_pontos))
                            .foregroundColor(Color.black)
                            .font(.system(size: 85))
                        Text(String(dadosTimes.a_vitorias) + " Vitórias")
                            .foregroundColor(Color(.darkGray))
                            .font(.system(size: 17))
                        
                        BotaoPrimario(title: "+", size: 50, action: {
                            dadosTimes.a_pontos+=1
                            verificaGanhador()
                        })
                    }
                    .inExpandingRectangle()
                    .fixedSize(horizontal: false, vertical: true)
                    VStack(spacing: 0){
                        Text(dadosTimes.b_nome)
                            .foregroundColor(Color.black)
                            .font(.system(size: 50))
                        Text(String(dadosTimes.b_pontos))
                            .foregroundColor(Color.black)
                            .font(.system(size: 85))
                        Text(String(dadosTimes.b_vitorias) + " Vitórias")
                            .foregroundColor(Color(.darkGray))
                            .font(.system(size: 17))
                        
                        BotaoPrimario(title: "+", size: 50, action: {
                            dadosTimes.b_pontos+=1
                            verificaGanhador()
                        })
                    }
                    .inExpandingRectangle()
                    .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.vertical, 50)
                .frame(maxWidth: .infinity)
                .background(Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .shadow(radius: 15)
                )
                BotaoPrimario(title: "Zerar Placar", action: {
                    resetaTudo()
                })
            }.alert(isPresented: $alguem_ganhou) {
                Alert(
                    title: Text("Vitória 🥳"),
                    message: Text("A equipe '\((ganhador == "a" ? dadosTimes.a_nome : dadosTimes.b_nome))' ganhou essa partida!"),
                    dismissButton: .default(Text("Ok"))
                )
            }
            .padding(.horizontal, 20)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(DadosTimes())
    }
}
