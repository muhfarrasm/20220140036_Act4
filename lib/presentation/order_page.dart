import 'package:flutter/material.dart';
import 'package:play_navigation/presentation/order_detail_page.dart';
class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();
  final TextEditingController jumlahmakananController = TextEditingController();
  final TextEditingController jumlahminumanController = TextEditingController();
  int totalHarga = 0;

  void calculateTotalPrice() {
    int jumlahmakanan = int.tryParse(jumlahmakananController.text) ?? 0;
    int jumlahminuman = int.tryParse(jumlahminumanController.text) ?? 0;

    setState((){
      totalHarga = (jumlahmakanan * 3200) + (jumlahminuman * 5000);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text('Order Page')),
      body: Form(
        key: _formkey,
        child: Column(
          spacing: 16,
          children: [
            TextFormField(
              controller: makananController,
              decoration: const InputDecoration(labelText: 'Orderan Makanan'),
              validator: (value){
                if (value == null || value.isEmpty){
                  return'Tolong masukkan orderan makanan anda';
                }
                return null;
              },
            ),

            TextFormField(
              controller: minumanController,
              decoration: const InputDecoration(labelText: 'Orderan Minuman'),
              validator: (value){
                if (value == null || value.isEmpty){
                  return'Tolong masukkan orderan minuman anda';
                }
                return null;
              },
            ),

            TextFormField(
              controller: jumlahmakananController,
              decoration: const InputDecoration(labelText: 'Jumlah Orderan Makanan'),
              validator: (value){
                if (value == null || value.isEmpty){
                  return'Tolong masukkan jumlah orderan makanan anda';
                }
                return null;
              },
            ),

            TextFormField(
              controller: jumlahminumanController,
              decoration: const InputDecoration(labelText: 'Jumlah Orderan Minuman'),
              validator: (value){
                if (value == null || value.isEmpty){
                  return'Tolong masukkan jumlah orderan minuman anda';
                }
                return null;
              },
            ),

            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  calculateTotalPrice();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => OrderDetailPage(
                            jumlahMakanan: jumlahmakananController.text,
                            jumlahMinuman: jumlahminumanController.text,
                            makanan: makananController.text,
                            minuman: minumanController.text,
                            totalHarga: totalHarga,
                          ),
                    ),
                  );
                }
              },
              child: Text('Order Now'),
            ),
          ],
        )
      ),
      
    );
  }
}