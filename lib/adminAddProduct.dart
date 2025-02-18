import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('Admin Products'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField('Product Name'),
                  SizedBox(height: 20.h),
                  buildTextField('Price'),
                  SizedBox(height: 20.h),
                  buildTextField('Product Description', maxLines: 5),
                  SizedBox(height: 20.h),
                  CategoryDropdown(),
                  SizedBox(height: 20.h),
                  MediumDropdown(),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(child: buildTextField("Height")),
                      SizedBox(width: 5.w),
                      Expanded(child: SizeDropdown()),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Expanded(child: buildTextField("Width")),
                      SizedBox(width: 5.w),
                      Expanded(child: SizeDropdown()),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  buildTextField('Product Image', maxLines: 2),
                  SizedBox(height: 20.h),
                  buildTextField('Artist Name'),
                  SizedBox(height: 20.h),
                  buildTextField('Artist Description', maxLines: 5),
                  SizedBox(height: 20.h),
                  buildTextField('Artist Image', maxLines: 2),
                  SizedBox(height: 30.h),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 15.h),
                      ),
                      onPressed: () => {},
                      child: const Text('Add product'),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: VerticalDivider(
              width: 1.w,
              thickness: 1,
              color: Colors.grey[300],
            ),
          ),
          // Replace the existing right side Flexible widget with this:
          Flexible(
            flex: 2,
            child: Container(
              constraints: BoxConstraints(maxWidth: screenWidth * 0.35),
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image Preview
                  Text(
                    'Product Image Preview',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                      height: 250.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 50.sp,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16.h),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                ),
                                onPressed: () {
                                  // Add image upload logic
                                },
                                child: Text('Upload Product Image'),
                              ),
                            ]),
                      )),

                  SizedBox(height: 30.h),

                  // Artist Image Preview
                  Text(
                    'Artist Image Preview',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                      height: 250.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 50.sp,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16.h),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 10.h),
                                ),
                                onPressed: () {
                                  // Add image upload logic
                                },
                                child: Text('Upload Artist Image'),
                              ),
                            ]),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(String hint, {int maxLines = 1}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
        ),
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey[600],
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}

class CategoryDropdown extends StatefulWidget {
  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String? selectedCategory; // State variable to store selected category

  final List<String> categories = [
    "Paintings",
    "Photography",
    "Collage",
    "Abstract",
    "Sketches",
    "Digital Art",
    "Poster",
    "Sculpture"
  ]; // Category options

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: selectedCategory,
            decoration: InputDecoration(
              hintText: "Select a Category",
              hintStyle: TextStyle(
                color: Colors.grey[600],
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
            ),
            items: categories.map((category) {
              return DropdownMenuItem(
                value: category,
                child: Text(
                  category,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),
        ),

        SizedBox(height: 16),

        // Display selected category
        Text(
          "Selected Category: ${selectedCategory ?? 'None'}",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}

class MediumDropdown extends StatefulWidget {
  @override
  _MediumDropdownState createState() => _MediumDropdownState();
}

class _MediumDropdownState extends State<MediumDropdown> {
  String? selectedMedium; // State variable to store selected category

  final List<String> mediumList = [
    "Oil",
    "Water Color",
    "Poster Color",
    "Gouache",
    "Acrylic",
    "Pencil",
    "Chalk",
    "Charcol",
    "Pencil & Charcol",
    "Pastel",
    "Ink"
  ]; // Category options

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: selectedMedium,
            decoration: InputDecoration(
              hintText: "Select a Medium",
              hintStyle: TextStyle(
                color: Colors.grey[600],
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
            ),
            items: mediumList.map((medium) {
              return DropdownMenuItem(
                value: medium,
                child: Text(
                  medium,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedMedium = value;
              });
            },
          ),
        ),

        const SizedBox(height: 16),

        // Display selected category
        Text(
          "Selected Medium: ${selectedMedium ?? 'None'}",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}

class SizeDropdown extends StatefulWidget {
  @override
  _SizeDropdownState createState() => _SizeDropdownState();
}

class _SizeDropdownState extends State<SizeDropdown> {
  String? selectedSize; // State variable to store selected category

  final List<String> sizes = [
    "cm",
    "inch",
  ]; // Category options

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: DropdownButtonFormField<String>(
          value: selectedSize,
          decoration: InputDecoration(
            hintText: "Select a Medium",
            hintStyle: TextStyle(
              color: Colors.grey[600],
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
          items: sizes.map((category) {
            return DropdownMenuItem(
              value: category,
              child: Text(
                category,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedSize = value;
            });
          },
        ),
      ),
    ]);
  }
}
