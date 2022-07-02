//
//  ContentView.swift
//  Lista_de_Contactos
//
//  Created by Diogo Pedro on 01/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    

    	
    
    @ObservedObject var listItem2 = ListItem2()
    
    @State var texto = ""
    @State var texto1 = ""
    @State var contactos = [
        
        ListItem(name: "Diogo Pedro", numero: "932213045"),
        ListItem(name: "Gonçalo feliciano", numero: "914848486"),
        ListItem(name: "Bruno Miguel", numero: "961301295")
        
        ]
    
    


    var body: some View {
        TextField("Novo nome", text: $texto)
        TextField("Novo numero", text: $texto1)
        NavigationView {
            
            
            List{
                
                    ForEach(contactos , id: \.self) { contacto in
                        Text(contacto.name+"\nContacto: "+String(contacto.numero))
                            
                        
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                        
                
            }
            .navigationTitle("Lista de Contactos")
            
            .navigationBarItems( leading: addButton)
            
        }
         
        
        
        }
 
    
    var addButton: some View {
        Button("Adicionar", action:  {
            adicionar()
           
       })
    }
    
    func delete(indexSet: IndexSet){
        
        contactos.remove(atOffsets: indexSet)
            
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        
        contactos.move(fromOffsets: indices, toOffset: newOffset)
        
    }
    
    func adicionar () {
        
        let NovoContacto = ListItem (name: texto, numero: texto1)
        contactos.append(NovoContacto)
        
    }
    
}

class ListItem2 : ObservableObject{
    @Published var contactos2 = [ListItem]()
}


struct ListItem: Hashable{
    var id = UUID()
    var name:String
    var numero: String
    
}


    	
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

