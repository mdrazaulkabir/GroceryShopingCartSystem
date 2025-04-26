import 'dart:io';
void main(){
  List<Map<String,dynamic>>cart=[];
  while(true){
    print("\n....Grocery Shopping Cart....");
    print("1.Add item to cart:");
    print('2.View cart:');
    print('3.Remove item:');
    print('4.View total bill:');
    print('5.Update quantity and price:');
    print('6.Exit:');

    print("Enter your choise (1-6):");
    String? choise=stdin.readLineSync();
    switch(choise){
      case '1':
      addItem(cart);
      break;
      case '2':
      viewItem(cart);
      break;
      case '3':
      removeItem(cart);
      break;
      case '4':
      viewTotal(cart);
      break;
      case '5':
      updateCart(cart);
      break;
      case '6':
      print("Thank you for shopping!");
      return; //here, return means is code terminate no more execute the code or while loop
      default:
      print("Invalid option choose. Try agin!");
    }
  }
}


void addItem(List<Map<String,dynamic>>cart){
  print("Enter your product name:");
  String? name=stdin.readLineSync();
  print("Enter quantity:");
  int quantity=int.parse(stdin.readLineSync()!);
  print("Enter price per item:");
  double price=double.parse(stdin.readLineSync()!);
  cart.add({
    "name":name,
    "quantity":quantity,
    "price":price
  });
  print("Product name: ${name!.toUpperCase()} is added to the cart:");
}



void viewItem(List<Map<String,dynamic>>cart){
  if(cart.isEmpty){
    print("Empty cart! Need Shopping first and Add item your cart:");
  }
  else{
    print("\n...Your Cart...");
  for(int i=0;i<cart.length;i++){
    var item=cart[i];
    print("${i+1} Item is: ${item['name']} Quantity:${item['quantity']} Price:${item['price']}");
  }
  // for(var carts in cart){
  //   print("Item name is: ${carts['name']} Quantity:${carts["quantity"]} Price:${carts["price"]}");
  // }
  }
}

void removeItem(List<Map<String,dynamic>>cart){
  if(cart.isEmpty){
      print("your cart is empty! You need to shopping first add item your cart:");
  }
 else{
   print("Enter the item number, which want to remove:");
  int index=int.parse(stdin.readLineSync()!)-1;
  if(index>=0 && index<cart.length){
    print("${cart[index]['name']} is remove!");
    cart.removeAt(index);
  }
  else{
    print("Invalid index. Try again!");
  }
 }
}





void viewTotal(List<Map<String,dynamic>>cart){
    if(cart.isEmpty){
      print("your cart is empty! You need to shopping first:");
    }
   else{
     double total=0;
    print("\n...Bill Details...");
    for(var item in cart){
      double totalCost=item['quantity']*item['price'];
      print("Item ${item['name']}- ${item['quantity']}*${item['price']} = ${totalCost.toStringAsFixed(2)}");
      total=total+totalCost;
    }
    print("Total Bill: ${total.toStringAsFixed(2)}");
   }
}




void updateCart(List<Map<String,dynamic>>cart){
   if(cart.isEmpty){
      print("your cart is empty! You need to shopping first:");
    }


   else{
     print("Enter which item number want to update:");
    int index=int.parse(stdin.readLineSync()!)-1;
    if(index>=0 && index<cart.length){
      print("Enter new quantity:");
     cart[index]['quantity']=double.parse(stdin.readLineSync()!);
     print("Enter new price:");
     cart[index]['price']=double.parse(stdin.readLineSync()!);
     print("${cart[index]['name']} is updated!");
    }

    else{print("Item number is invalid. Try again!");}
   }

}