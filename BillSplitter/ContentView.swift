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
   
    @State var total: Double = 999
    @State var ppl:Double = 10
    //-----
    @State var val = ""
    @State var pplVal = ""

        //view
    var body: some View {
            
        
        VStack {
            
            TextField("Enter total price: ", text: $val)
                .padding()
                .keyboardType(.decimalPad)
            let ax = Double(val) ?? 0
                
            TextField("Enter total number of people: ", text: $pplVal)
                .padding()
                .keyboardType(.decimalPad)
            let bx = Double(pplVal) ?? 0
           
        //    TextField("Enter Total Price", text: total)
        
            Text("Total Bill: " + String(total)).padding()
            Text("Bill for each: "+String(a.BillforEach(subtotal: ax, numOfPeople: bx)))
            Text("5% Tax Incl: "+String(a.splitBy(subtotal: ax, numOfPeople: bx)))
            
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

