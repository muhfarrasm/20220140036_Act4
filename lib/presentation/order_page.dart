import 'package:flutter/material.dart';

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
    return const Placeholder();
  }
}