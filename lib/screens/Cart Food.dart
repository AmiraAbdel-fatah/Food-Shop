import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_shop/utils/App%20Colors.dart';
import 'package:food_shop/utils/App%20Styles.dart';

class CartFood extends StatefulWidget {
  const CartFood({super.key});

  @override
  State<CartFood> createState() => _CartFoodState();
}

class _CartFoodState extends State<CartFood> {
  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Sandwich",
      "category": "Fast food ",
      "price": 12.50,
      "image": "assets/images/Club Sandwich.png",
      "quantity": 1,
    },
    {
      "name": "Hamburger",
      "category": "Fast food ",
      "price": 6.99,
      "image": "assets/images/Hamburger.png",
      "quantity": 1,
    },
    {
      "name": "Mix Rice",
      "category": "Fast food ",
      "price": 5.99,
      "image": "assets/images/Mix Rice (2).png",
      "quantity": 1,
    },
    {
      "name": "Prawn Mix Salad",
      "category": "Seafood",
      "price": 8.99,
      "image": "assets/images/PrawnMixSalad.png",
      "quantity": 1,
    },
    {
      "name": "Grill Chicken",
      "category": "BBQ",
      "price": 9.99,
      "image": "assets/images/Grill Chicken.png",
      "quantity": 1,
    },
    {
      "name": "BBQ Chicken",
      "category": "BBQ",
      "price": 10.99,
      "image": "assets/images/BBQ Chicken.png",
      "quantity": 1,
    },
  ];

  double get subtotal =>
      cartItems.fold(
          0.0, (sum, item) => sum + (item['price'] * item['quantity']));
  double deliveryCharge = 2.50;

  double get total => subtotal + deliveryCharge;

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
            child: Image.asset(
              "assets/icons/menus 1.png",
              width: 24.w,
              height: 24.h,
            ),
          ),
        ),
        centerTitle: true,
        title: Text("Cart food", style: AppStyles.medium23Black),
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
                      "${cartItems.length}",
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
          Column(
            children: [
              SizedBox(height: 20.h),
              _buildTabSelector(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.w, vertical: 20.h),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return _buildCartItem(index);
                  },
                ),
              ),
              SizedBox(height: 280.h), // Space for summary
            ],
          ),
          _buildSummarySection(),
        ],
      ),
    );
  }

  Widget _buildTabSelector() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Active", style: AppStyles.semiBold18Black),
                SizedBox(height: 4.h),
                Container(
                  width: 110.w,
                  height: 3.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              "Previous",
              textAlign: TextAlign.center,
              style: AppStyles.semiBold18Black.copyWith(
                  color: AppColors.secondaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(int index) {
    final item = cartItems[index];
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
              item['image'], width: 120.w, height: 120.h, fit: BoxFit.contain),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['name'],
                  style: AppStyles.semiBold18Black.copyWith(fontSize: 20.sp),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(item['category'], style: AppStyles.regular12Secondary),
                SizedBox(height: 8.h),
                Text("\$${item['price']}",
                    style: AppStyles.semiBold18Black.copyWith(
                        color: AppColors.primaryColor, fontSize: 20.sp)),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 32.w,
            height: 90.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () =>
                      setState(() =>
                      item['quantity'] > 1
                          ? item['quantity']--
                          : null),
                  child: const Icon(
                      Icons.remove, color: Colors.white, size: 20),
                ),
                Text(
                  "${item['quantity']}",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => setState(() => item['quantity']++),
                  child: const Icon(Icons.add, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummarySection() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(30.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Summery",
                style: AppStyles.semiBold20Black.copyWith(fontSize: 24.sp)),
            SizedBox(height: 10.h),
            _buildSummaryRow("Items:", "${cartItems.length}"),
            _buildSummaryRow("Subtotal", "\$${subtotal.toStringAsFixed(2)}"),
            _buildSummaryRow(
                "Delivery charge", "\$${deliveryCharge.toStringAsFixed(2)}"),
            _buildSummaryRow(
                "Total", "\$${total.toStringAsFixed(2)}", isTotal: true),
            SizedBox(height: 25.h),
            SizedBox(
              width: 350.w,
              height: 60.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  "Checkout",
                  style: AppStyles.semiBold18Black.copyWith(
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal ? AppStyles.semiBold18Black : AppStyles.medium13Black
                .copyWith(fontSize: 16.sp),
          ),
          Text(
            value,
            style: isTotal ? AppStyles.semiBold18Black : AppStyles
                .semiBold15Black.copyWith(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
