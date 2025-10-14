import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentMethodesState();
}

class _PaymentMethodesState extends State<Payment> {
  int selectedPayment = 1;
  bool saveCard = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      tileColor: Colors.blue.shade500,
      title: CoustomText(
        text: 'Debit card',
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      subtitle: CoustomText(
        text: '**** **** **** 1234',
        color: Colors.white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      trailing: Radio(
        value: 2,
        groupValue: selectedPayment,
        onChanged: (value) {
          setState(() {
            selectedPayment = value!;
          });
        },
        activeColor: Colors.white,
      ),
      leading: Image.asset('assets/images/visa.png', scale: 3.5),
    );
  }
}
