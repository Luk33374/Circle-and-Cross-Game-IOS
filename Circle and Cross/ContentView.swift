//
//  ContentView.swift
//  Circle and Cross
//
//  Created by Łukasz Solik on 19/11/2022.
//

import SwiftUI

struct ContentView: View {
    @State public var winner = ""
    @State public var isX = false
    @State public var xOrO:[[String]]=[["","",""],["","",""],["","",""]]
    @State public var isClicked:[[Bool]]=[[false,false,false],[false,false,false],[false,false,false]]
    var body: some View {
        VStack {
            Text(winner).font(.system(size: 60))
            HStack {
                Text(xOrO[0][0])
                    .font(.system(size:50))
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 75, height: 75)
                    .background(Rectangle().fill(Color.white).border(Color.black,width: 2)
                        .onTapGesture {
                            click(x: 0, y: 0)
                        })
                    .onTapGesture {
                        click(x: 0, y: 0)
                    }
                
                Text(xOrO[0][1])
                    .font(.system(size:50))
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 75, height: 75)
                    .background(Rectangle().fill(Color.white).border(Color.black,width: 2).onTapGesture {
                        click(x: 0, y: 1)
                    })
                .onTapGesture {
                    click(x: 0, y: 1)
                }
            
                   
                Text(xOrO[0][2])
                    .font(.system(size:50))
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 75, height: 75)
                    .background(Rectangle().fill(Color.white).border(Color.black,width: 2).onTapGesture {
                        click(x: 0, y: 2)
                    })
                .onTapGesture {
                    click(x: 0, y: 2)
                }
            
                    
                
            }
            .padding(.all,0)
            HStack {
                Text(xOrO[1][0])
                    .font(.system(size:50))
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 75, height: 75)
                    .background(Rectangle().fill(Color.white).border(Color.black,width: 2).onTapGesture {
                        click(x: 1, y: 0)
                    })
                .onTapGesture {
                    click(x: 1, y: 0)
                }
            
                        
                Text(xOrO[1][1])
                    .font(.system(size:50))
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 75, height: 75)
                    .background(Rectangle().fill(Color.white).border(Color.black,width: 2).onTapGesture {
                        click(x: 1, y: 1)
                    })
                .onTapGesture {
                    click(x: 1, y: 1)
                }
            
                        
                Text(xOrO[1][2])
                    .font(.system(size:50))
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 75, height: 75)
                    .background(Rectangle().fill(Color.white).border(Color.black,width: 2).onTapGesture {
                        click(x: 1, y: 2)
                    })
                .onTapGesture {
                    click(x: 1, y: 2)
                }
            
                    
            }
            .padding(.all, 0)
            
            HStack {
                Text(xOrO[2][0])
                    .font(.system(size:50))
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 75, height: 75)
                    .background(Rectangle().fill(Color.white).border(Color.black,width: 2).onTapGesture {
                        click(x: 2, y: 0)
                    })
                .onTapGesture {
                    click(x: 2, y: 0)
                }
            
                
                Text(xOrO[2][1])
                    .font(.system(size:50))
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 75, height: 75)
                    .background(Rectangle().fill(Color.white).border(Color.black,width: 2).onTapGesture {
                        click(x: 2, y: 1)
                    })
                .onTapGesture {
                    click(x: 2, y: 1)
                }
            
                
                Text(xOrO[2][2])
                    .font(.system(size:50))
                    .fixedSize(horizontal: true, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 75, height: 75)
                    .background(Rectangle().fill(Color.white).border(Color.black,width: 2).onTapGesture {
                        click(x: 2, y: 2)
                    })
                .onTapGesture {
                    click(x: 2, y: 2)
                }
            
                
            }
            .padding(.all,0)
            Button("Reset",role: .destructive,action: reset)
                .font(.system(size: 50))
        }
        
    }
    
    func reset(){
        winner=""
        isClicked=[[false,false,false],[false,false,false],[false,false,false]]
        xOrO=[["","",""],["","",""],["","",""]]
    }
    
    func click(x:Int,y:Int){
        if(!isClicked[x][y]){
            if(isX){
                xOrO[x][y]="X"
                if(checkIfIsWinner(winner: "X")){
                    isClicked=[[true,true,true],[true,true,true],[true,true,true]]
                    winner="Winner is: X"
                }
                isX=false
            }
            else
            {
                xOrO[x][y]="O"
                if(checkIfIsWinner(winner: "O")){
                    isClicked=[[true,true,true],[true,true,true],[true,true,true]]
                    winner="Winner is: O"
                }
                isX=true
            }
            isClicked[x][y]=true
        }
    }
    
    func checkIfIsWinner(winner:String) -> Bool{
        for line in xOrO {
            var lineWin:[Bool]=[false,false,false]
            for index in 0...2{
                if(line[index]==winner){
                    lineWin[index]=true
                }
            }
            if(lineWin[0]&&lineWin[1]&&lineWin[2]) {return true}
        }
        for indexY in 0...2{
            var rowWin:[Bool]=[false,false,false]
            for indexX in 0...2{
                if(xOrO[indexX][indexY]==winner){
                    rowWin[indexX]=true
                }
            }
            if(rowWin[0]&&rowWin[1]&&rowWin[2]){return true}
        }
       
        if(checkCross(winner: winner)){return true}
        return false;
    }
    
    func checkCross(winner:String) -> Bool{
        if(xOrO[0][0]==winner&&xOrO[1][1]==winner&&xOrO[2][2]==winner){return true}
        if(xOrO[0][2]==winner&&xOrO[1][1]==winner&&xOrO[2][0]==winner){return true}
        return false
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
