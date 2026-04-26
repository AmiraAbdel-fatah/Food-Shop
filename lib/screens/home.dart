import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_shop/screens/Food%20details.dart';
import 'package:food_shop/utils/App%20Colors.dart';
import 'package:food_shop/utils/App%20Styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Image.asset(
            "assets/icons/menus 1.png",
            width: 24.w,
            height: 24.h,
          ),
        ),
        centerTitle: true,
        title: Text("Home", style: AppStyles.medium23Black),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.primaryColor,
                image: const DecorationImage(
                  image: AssetImage("assets/icons/profile.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            _buildSearchAndFilter(),
            SizedBox(height: 25.h),
            _buildCategories(),
            SizedBox(height: 30.h),
            _buildMainCarousel(),
            SizedBox(height: 20.h),
            _buildPopularHeader(),
            SizedBox(height: 15.h),
            _buildPopularItems(),
            SizedBox(height: 120.h), // Space for bottom nav
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildSearchAndFilter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 70.h,
              width: 260.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: AppStyles.regular12Secondary.copyWith(
                    fontSize: 16.sp,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(15.w),
                    child: Image.asset(
                      "assets/icons/search 1.png",
                      height: 25.h,
                      width: 25.w,
                      color: Colors.grey,
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Container(
            width: 55.w,
            height: 55.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            padding: EdgeInsets.all(12.w),
            child: Image.asset(
              "assets/icons/settings.png",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    final List<Map<String, dynamic>> categories = [
      {
        "name": "Vegetarian",
        "icon": "assets/icons/eat.png",
        "color": AppColors.softPeach,
      },
      {
        "name": "Fast Food",
        "icon": "assets/icons/hamburger.png",
        "color": AppColors.warmBeige,
      },
      {
        "name": "Ice Cream",
        "icon": "assets/icons/ice-cream-cone.png",
        "color": const Color(0xFFFCE6D9),
      },
    ];

    return SizedBox(
      height: 45.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.w),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 15.w),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              color: categories[index]['color'],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Image.asset(
                  categories[index]['icon'],
                  width: 24.w,
                  height: 24.h,
                ),
                SizedBox(width: 8.w),
                Text(categories[index]['name'], style: AppStyles.medium13Black),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainCarousel() {
    final List<Map<String, String>> items = [
      {
        "name": "Sandwich",
        "category": "Fast food ",
        "price": "\$12.50",
        "image": "assets/images/Club Sandwich.png",
      },
      {
        "name": "Hamburger",
        "category": "Fast food ",
        "price": "\$6.99",
        "image": "assets/images/Hamburger.png",
      },
      {
        "name": "Mix Rice",
        "category": "Fast food ",
        "price": "\$5.99",
        "image": "assets/images/Mix Rice (2).png",
      },
      {
        "name": "Prawn Mix Salad",
        "category": "Seafood",
        "price": "\$8.99",
        "image": "assets/images/PrawnMixSalad.png",
      },
      {
        "name": "Grill Chicken",
        "category": "BBQ",
        "price": "\$9.99",
        "image": "assets/images/Grill Chicken.png",
      },
      {
        "name": "BBQ Chicken",
        "category": "BBQ",
        "price": "\$10.99",
        "image": "assets/images/BBQ Chicken.png",
      },
    ];

    return CarouselSlider.builder(
      itemCount: items.length,
      options: CarouselOptions(
        height: 362.h,
        enlargeCenterPage: true,
        viewportFraction: 0.52,
        enableInfiniteScroll: true,
        onPageChanged: (index, reason) {
          setState(() {
            _carouselIndex = index;
          });
        },
      ),
      itemBuilder: (context, index, realIndex) {
        final item = items[index];
        bool isActive = _carouselIndex == index;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FoodDetails(foodData: item)),
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 214.w,
                height: 298.h,
                margin: EdgeInsets.symmetric(vertical: 20.h),
                padding: EdgeInsets.only(top: 80.h, bottom: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 40.h),
                      Text(item['name']!, style: AppStyles.semiBold18Black),
                      SizedBox(height: 4.h),
                      Text(
                        item['category']!,
                        style: AppStyles.regular12Secondary,
                      ),
                      SizedBox(height: 20.h),
                      Text(item['price']!, style: AppStyles.semiBold20Primary),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Image.asset(item['image']!, height: 160.h, width: 155.w),
              ),
              Positioned(
                top: 40.h,
                right: 8.w,
                child: Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primaryColor : Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.favorite, color: Colors.white, size: 16),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPopularHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Popular Items", style: AppStyles.semiBold20Black),
          Text("Popular Items", style: AppStyles.medium15Primary),
        ],
      ),
    );
  }

  Widget _buildPopularItems() {
    final List<Map<String, String>> popularItems = [
      {
        "name": "Prawn mix Rice",
        "category": "Rice",
        "price": "\$5.99",
        "image": "assets/images/Mix Rice (2).png",
      },
      {
        "name": "Burger",
        "category": "Fast food",
        "price": "\$6.99",
        "image": "assets/images/Hamburger.png",
      },
      {
        "name": "Sandwich",
        "category": "Fast food ",
        "price": "\$12.50",
        "image": "assets/images/Club Sandwich.png",
      },
    ];

    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20.w),
        itemCount: popularItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    FoodDetails(foodData: popularItems[index])),
              );
            },
            child: Container(
              width: 190.w,
              margin: EdgeInsets.only(right: 15.w),
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 80.w,
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                        image: AssetImage(popularItems[index]['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          popularItems[index]['name']!,
                          style: AppStyles.semiBold11Black,
                        ),
                        Text(
                          popularItems[index]['category']!,
                          style: AppStyles.regular12Secondary.copyWith(
                            fontSize: 9,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          popularItems[index]['price']!,
                          style: AppStyles.semiBold15Primary.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavBar() {
    final List<Map<String, dynamic>> items = [
      {"icon": "assets/icons/shopping-bag.png", "index": 0},
      {"icon": "assets/icons/heart.png", "index": 1},
      {"icon": "assets/icons/home.png", "index": 4},
      {"icon": "assets/icons/setting (1).png", "index": 2},
      {"icon": "assets/icons/user (1).png", "index": 3},
    ];

    return Container(
      margin: EdgeInsets.fromLTRB(0.w, 0, 0.w, 0.h),
      height: 100.h,
      child: LayoutBuilder(
        builder: (context, constraints) {
          int visualIndex = items.indexWhere(
            (item) => item['index'] == _currentIndex,
          );
          if (visualIndex == -1) visualIndex = 2; // Default to center

          double itemWidth = constraints.maxWidth / 5;
          double centerX = itemWidth * visualIndex + (itemWidth / 2);

          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: CustomPaint(painter: BNBCustomPainter(centerX: centerX)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: items.map((item) {
                  bool isSelected = _currentIndex == item['index'];
                  return Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          setState(() => _currentIndex = item['index']),
                      child: Container(
                        height: 70.h,
                        color: Colors.transparent, // Better hit testing
                        child: Stack(
                          alignment: Alignment.center,
                          clipBehavior: Clip.none,
                          children: [
                            if (isSelected)
                              Positioned(
                                top: -35.h,
                                child: Container(
                                  width: 70.w,
                                  height: 70.h,
                                  padding: EdgeInsets.all(4.w),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.w),
                                      child: Image.asset(
                                        item['icon'],
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            else
                              Image.asset(
                                item['icon'],
                                width: 30.w,
                                height: 30.h,
                                color: Colors.grey[400],
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  final double centerX;

  BNBCustomPainter({required this.centerX});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final curveWidth = 65.w;
    final curveHeight = 30.h;
    final radius = 35.r;

    path.moveTo(0, 0);

    path.lineTo(centerX - curveWidth, 0);
    path.cubicTo(
      centerX - curveWidth / 2,
      0,
      centerX - curveWidth / 2,
      -curveHeight,
      centerX,
      -curveHeight,
    );
    path.cubicTo(
      centerX + curveWidth / 2,
      -curveHeight,
      centerX + curveWidth / 2,
      0,
      centerX + curveWidth,
      0,
    );
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.lineTo(0, 0);

    path.close();

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant BNBCustomPainter oldDelegate) =>
      oldDelegate.centerX != centerX;
}
