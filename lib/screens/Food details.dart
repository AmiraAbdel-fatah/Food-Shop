import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_shop/screens/Cart%20Food.dart';
import 'package:food_shop/utils/App%20Colors.dart';

import '../utils/App Styles.dart';

class FoodDetails extends StatefulWidget {
  final Map<String, String> foodData;

  const FoodDetails({super.key, required this.foodData});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  int quantity = 3;
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Icon(Icons.menu, color: Colors.black, size: 28.sp),
          ),
        ),
        centerTitle: true,
        title: Text("Food", style: AppStyles.medium23Black),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/icons/shopping-cart 1.png",
                  width: 30.w,
                  height: 30.h,
                ),
                Positioned(
                  bottom: 12.h,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.white, fontSize: 10.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: Image.asset(
                      widget.foodData['image']!,
                      height: 250.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Container(
                      width: 153.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => setState(
                              () => quantity > 1 ? quantity-- : null,
                            ),
                            child: Icon(Icons.remove, size: 20.sp),
                          ),
                          Text(
                            quantity.toString(),
                            style: AppStyles.semiBold18Black,
                          ),
                          GestureDetector(
                            onTap: () => setState(() => quantity++),
                            child: Icon(Icons.add, size: 20.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.foodData['name']!,
                          style: AppStyles.semiBold20Black.copyWith(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "(4.0)",
                            style: AppStyles.medium15Primary.copyWith(
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "View all reviews",
                      style: AppStyles.regular12Secondary.copyWith(
                        color: const Color(0xFFACACAC),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: ["S", "M", "L"].map((size) {
                      bool isSelected = selectedSize == size;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSize = size),
                        child: Container(
                          width: 112.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primaryColor
                                : const Color(0xFFFFEFE6),
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            size,
                            style: AppStyles.semiBold18Black.copyWith(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    widget.foodData['price']!,
                    style: AppStyles.semiBold20Primary.copyWith(
                      fontSize: 30.sp,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text("Description", style: AppStyles.semiBold18Black),
                  SizedBox(height: 10.h),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
                    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: AppStyles.regular12Secondary.copyWith(
                      height: 1.5,
                      fontSize: 13.sp,
                      color: const Color(0xFFACACAC),
                    ),
                  ),
                  SizedBox(height: 130.h),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(25.w, 40.h, 25.w, 30.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0),
                    Colors.white.withOpacity(0.9),
                    Colors.white,
                  ],
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 65.w,
                    height: 65.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.r),
                        ),
                        elevation: 0,
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 35.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                  Expanded(
                    child: SizedBox(
                      width: 274.w,
                      height: 65.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => CartFood()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(235.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Add to cart",
                          style: AppStyles.semiBold18Black.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
