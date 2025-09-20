import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/product.dart';
import '../models/brand.dart';
import '../data/product_data.dart';
import 'product_detail_screen.dart';
import '../widgets/effective_price_bottom_sheet.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Brand> brands = ProductData.getBrands();
  List<Product> products = ProductData.getProducts();
  Set<String> selectedBrands = {
    'Apple'
  }; // Changed to Set for multiple selection
  String searchQuery = '';
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filteredProducts = products.where((product) {
      // Search filtering (primary filter)
      bool searchMatch = true;
      if (searchQuery.isNotEmpty) {
        searchMatch = product.name
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            product.category.toLowerCase().contains(searchQuery.toLowerCase());
      }

      // Brand filtering (secondary filter - only if no search query)
      bool brandMatch = true;
      if (searchQuery.isEmpty && selectedBrands.isNotEmpty) {
        brandMatch = false;

        // Check if product belongs to any selected brand
        for (String brand in selectedBrands) {
          if (brand == 'Apple') {
            if (product.category == 'iPhone' ||
                product.category == 'Mac' ||
                product.category == 'iPad') {
              brandMatch = true;
              break;
            }
          } else if (brand == 'Google') {
            if (product.category == 'Pixel' || product.category == 'Nest') {
              brandMatch = true;
              break;
            }
          } else if (brand == 'Samsung') {
            if (product.category == 'Galaxy') {
              brandMatch = true;
              break;
            }
          } else if (brand == 'OnePlus') {
            if (product.category == 'OnePlus') {
              brandMatch = true;
              break;
            }
          }
        }
      }

      return searchMatch && brandMatch;
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Container(
                  color: const Color(0xffFAFAFA),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      const Text(
                        'Search from popular brands',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1F1F1F),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildBrandSelector(),
                      const SizedBox(height: 24),
                      const Text(
                        'Available devices',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1F1F1F),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: _buildProductGrid(filteredProducts),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundColor: Color(0xffE1E1E1),
                child: Icon(CupertinoIcons.chevron_left,
                    fontWeight: FontWeight.w700, size: 15, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xff191919).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 10),
                        child: Icon(
                            PhosphorIcons.magnifyingGlass(
                                PhosphorIconsStyle.regular),
                            size: 20,
                            color: Colors.black),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 8.0,
                            children: selectedBrands.map((brand) {
                              return Chip(
                                label: Text(brand),
                                deleteIcon: const Icon(Icons.cancel, size: 18),
                                onDeleted: () {
                                  if (selectedBrands.length != 1) {
                                    setState(() {
                                      selectedBrands.remove(brand);
                                    });
                                  }
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBrandSelector() {
    return Wrap(
      spacing: 12, // Horizontal spacing between buttons
      runSpacing: 12, // Vertical spacing between rows
      children: brands.map((brand) => _buildBrandButton(brand)).toList(),
    );
  }

  Widget _buildBrandButton(Brand brand) {
    final isSelected = selectedBrands.contains(brand.displayName);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            if (selectedBrands.length != 1) {
              selectedBrands.remove(brand.displayName);
            }
          } else {
            selectedBrands.add(brand.displayName);
          }
        });
      },
      child: Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.15),
              offset: const Offset(0, 0),
              blurRadius: 2.0,
              spreadRadius: 0,
            ),
          ],
          color: const Color(0xffEEEEEE),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.black : const Color(0xffEEEEEE),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: isSelected
                  ? (brand.name == 'apple'
                      ? const Icon(Icons.apple, size: 18, color: Colors.black)
                      : Transform.scale(
                          scale: 0.75,
                          child: brand.icon,
                        ))
                  : Transform.scale(
                      scale: 0.75,
                      child: brand.icon,
                    ),
            ),
            const SizedBox(height: 6),
            Text(
              brand.displayName,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff191919),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrid(List<Product> products) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 170 / 108),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return _buildProductCard(products[index]);
      },
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        // if (product.name.contains('iPhone 16 Pro') ||
        //     product.name.contains('iPhone 17 Pro')) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product)),
          );
        // } else {
        //   _showEffectivePriceBottomSheet(product);
        // }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.35),
              offset: const Offset(0, 6.54),
              blurRadius: 19.61,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: const Color(0xff42474C0F).withOpacity(0.06),
              offset: const Offset(0, 3.27),
              blurRadius: 6.54,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: const Color(0xff42474C52).withOpacity(0.32),
              offset: const Offset(0, 0),
              blurRadius: 0.82,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildProductImage(product),
            const SizedBox(height: 15),
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff191919),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Product product) {
    return Container(
      width: 48,
      height: 48,
      child: _buildAssetImage(product.assetPath, 48, 48),
    );
  }

  Widget _buildAssetImage(String assetPath, double width, double height) {
    if (assetPath.endsWith('.svg')) {
      return SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        fit: BoxFit.contain,
      );
    } else {
      return Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: BoxFit.contain,
      );
    }
  }

  void _showEffectivePriceBottomSheet(Product product) {
    EffectivePriceBottomSheet.show(
      context,
      devicePrice:
          '₹${product.pricing.basePrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
      effectivePrice:
          '₹${product.pricing.effectivePrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}*',
      monthlyImpact:
          '₹${product.pricing.monthlyImpact.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}*',
      taxSlab: '${(product.pricing.taxRate * 100).toInt()}%',
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
