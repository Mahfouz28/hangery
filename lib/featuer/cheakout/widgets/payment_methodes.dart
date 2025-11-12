import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';

class PaymentMethodes extends StatefulWidget {
  final String visa;
  const PaymentMethodes({super.key, required this.visa});

  @override
  State<PaymentMethodes> createState() => _PaymentMethodesState();
}

class _PaymentMethodesState extends State<PaymentMethodes> {
  int selectedPayment = 1;
  bool saveCard = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: const Color(0xff3C2F2F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          title: CoustomText(
            text: 'Cash on delivery',
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          trailing: Radio(
            value: 1,
            groupValue: selectedPayment,
            onChanged: (value) {
              setState(() {
                selectedPayment = value!;
              });
            },
            activeColor: Colors.white,
          ),
          leading: Image.asset('assets/images/dollar.png'),
        ),
        10.verticalSpace,

        ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          tileColor: Colors.blue.shade500,
          title: CoustomText(
            text: 'Debit card',
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
          subtitle: CoustomText(
            text: widget.visa,
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
        ),
        5.verticalSpace,

        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: saveCard,
          onChanged: (value) {
            setState(() {
              saveCard = value ?? false;
            });
          },
          title: CoustomText(
            text: 'Save card details for future payments',
            color: Colors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          controlAffinity: ListTileControlAffinity.leading,
          checkColor: Colors.white,
          activeColor: Colors.red,
        ),
      ],
    );
  }
}
