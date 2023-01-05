//
//  CreateView.swift
//  MJ_APP
//
//  Created by admin on 5/1/2023.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Top")
                }
            }
            HStack{
                VStack{
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Front")
                }
                
                VStack{
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Back")
                }
                
                VStack{
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Left")
                }
                
                VStack{
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Right")
                }
            }
            HStack{
                VStack{
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 32.0, height: 32.0)
                        }.frame(width: 80, height: 120, alignment: .center)
                    })
                    .foregroundColor(Color.black)
                    .background(Color(hex: "F0EFF5"))
                    Text("Bottom")
                }
            }
            HStack{
                Button(action: {}, label: {
                    Text("Clear")
                })
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
