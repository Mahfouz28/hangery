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
    // Gradient for the active track
    final gradient = const LinearGradient(
      colors: [
        Colors.blueAccent, // Cold 🧊
        Colors.greenAccent,
        Colors.orange,
        Colors.red, // Hot 🌶️
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            'Spiciness Level',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
        ),
        6.verticalSpace,
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return gradient.createShader(bounds);
          },
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 6.h,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              overlayColor: Colors.transparent,
              inactiveTrackColor: Colors.grey.shade300,
            ),
            child: SizedBox(
              width: 290.w,
              child: Slider(
                value: _spicyValue,
                min: 0,
                max: 1,
                divisions: 10,
                thumbColor:
                    gradient.colors[(_spicyValue * (gradient.colors.length - 1))
                        .round()],
                onChanged: (value) {
                  setState(() {
                    _spicyValue = value;
                  });
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '🥶 Mild',
                style: TextStyle(fontSize: 13.sp, color: Colors.blue),
              ),
              Text(
                '🌶️ Hot',
                style: TextStyle(fontSize: 13.sp, color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
