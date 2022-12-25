//
//  HomeView.swift
//  marcadortruco
//
//  Created by Gabriel on 25/12/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dadosTimes: DadosTimes
    
    func resetaTudo(){
        /*for time in times.times{
            time.reset()
        }*/

        dadosTimes.a_pontos = 0
        dadosTimes.a_vitorias = 0

        dadosTimes.b_pontos = 0
        dadosTimes.b_vitorias = 0
    }
    
    func verificaGanhador(){
        /*for time in times.times{
            if(time.pontos > 11){
                time.vitorias+=1
                for time in times.times{
                    time.pontos = 0
                }
            }
        }*/
        /*if(InfoJogo.time1.pontos > 11 || InfoJogo.time2.pontos > 11){
            if(InfoJogo.time1.pontos > 11){
                InfoJogo.time1.vitorias = InfoJogo.time1.vitorias + 1
            }
            if(InfoJogo.time2.pontos > 11){
                InfoJogo.time2.vitorias = InfoJogo.time2.vitorias + 1
            }
            InfoJogo.time1.pontos = 0
            InfoJogo.time2.pontos = 0
        }*/

        if(dadosTimes.a_pontos > 11 || dadosTimes.b_pontos > 11){
            if(dadosTimes.a_pontos > 11)
            {
                dadosTimes.a_vitorias+=1
            }
            else if(dadosTimes.b_pontos > 11)
            {
                dadosTimes.b_vitorias+=1
            }
            dadosTimes.a_pontos = 0
            dadosTimes.b_pontos = 0
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
                            print(String(dadosTimes.a_pontos))
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
                        Text(String(dadosTimes.b_nome) + " Vitórias")
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
            }
            .padding(.horizontal, 20)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
