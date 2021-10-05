//
//  ContentView.swift
//  BillSplitter
//
//  Created by Aizaz on 05/10/2021.
//

import SwiftUI
struct taxCalculator{
    let tax: Double = 0.05
    
    func totalWithTax(totalPrice:Double)->Double{
        return totalPrice
    }
}
struct billSplitter{
 
    func splitBy(subtotal:Double, numOfPeople:Double) -> (Double)
    {
        let tp : taxCalculator = taxCalculator()
        let tax:Double = subtotal*tp.tax
       
        
        return (tax)
    }
    
    func BillforEach(subtotal:Double, numOfPeople:Double) -> (Double){
        
        let billforEach : Double = subtotal/numOfPeople
        return billforEach
        
    }
 
}

struct ContentView: View {
    //properrties
    var a : billSplitter = billSplitter();
    @State var total: Double = 5000
    @State var val = ""
    let ppl:Double = 10
    

        //view
    var body: some View {
            
        
        VStack {
            
            TextField("Enter total price: ", text: $val)
                .padding()
                .keyboardType(.decimalPad)
                
           
        //    TextField("Enter Total Price", text: total)
        
            Text("Total Bill: " + String(total)).padding()
            Text("Bill for each: "+String(a.BillforEach(subtotal: total, numOfPeople: ppl)))
            Text("5% Tax Incl: "+String(a.splitBy(subtotal: total, numOfPeople: ppl)))
            
                .padding()
        }.font(.title2)
    }
    
    //methods
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

