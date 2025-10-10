import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpicySlider extends StatefulWidget {
  const SpicySlider({super.key});

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  double _spicyValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Spicy',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.green.shade900,
            thumbColor: Colors.green.shade900,
            overlayColor: Colors.green.withOpacity(0.2),
            trackHeight: 6.h,
          ),
          child: SizedBox(
            width: 290.w,
            child: Slider(
              value: _spicyValue,
              onChanged: (value) {
                setState(() {
                  _spicyValue = value;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('🥶', style: TextStyle(fontSize: 16.sp)),
              Text('🌶️', style: TextStyle(fontSize: 16.sp)),
            ],
          ),
        ),
      ],
    );
  }
}
