import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangery/core/constant/app_colors.dart';
import 'package:hangery/core/sheard/widgets/coustom_text.dart';

class CardItem extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final double rating;
  final bool initialFavorite;
  final void Function(bool isFav)? onFavoriteToggle;
  final double? width;
  final Color? backgroundColor;

  const CardItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.rating,
    this.initialFavorite = false,
    this.onFavoriteToggle,
    this.width,
    this.backgroundColor,
  });

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavorite;
  }

  void toggleFavorite() {
    setState(() => isFavorite = !isFavorite);
    if (widget.onFavoriteToggle != null) {
      widget.onFavoriteToggle!(isFavorite);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        width: widget.width ?? 175.w,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    widget.imagePath,
                    height: 120.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              8.verticalSpace,
              CoustomText(
                text: widget.title,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              CoustomText(
                text: widget.subtitle,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey[600],
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              10.verticalSpace,
              Row(
                children: [
                  Icon(Icons.star, size: 18.sp, color: Colors.amber),
                  5.horizontalSpace,
                  CoustomText(
                    text: widget.rating.toStringAsFixed(1),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: toggleFavorite,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, animation) =>
                          ScaleTransition(scale: animation, child: child),
                      child: Icon(
                        key: ValueKey(isFavorite),
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? AppColors.primaryColor
                            : Colors.grey[400],
                        size: 22.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
