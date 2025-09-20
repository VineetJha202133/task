import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/product.dart';
import '../widgets/effective_price_bottom_sheet.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Product currentProduct;
  bool showPriceDetails = false;
  bool showFullBanner = false;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    currentProduct = widget.product;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width > 600 ? 400 : double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            const SizedBox(height: 32),
            _buildAppBar(),
            if (currentProduct.shippingInfo.isNotEmpty) _buildShippingInfo(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProductConfigPage(),
                    _buildPricingSection(),
                  ],
                ),
              ),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xffE1E1E1),
              child: Icon(CupertinoIcons.chevron_left,
                  fontWeight: FontWeight.w700, size: 15, color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              currentProduct.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff191919),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 20), // Balance the back button
        ],
      ),
    );
  }

  Widget _buildShippingInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xffFAF4EA),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(PhosphorIcons.truck(PhosphorIconsStyle.regular),
              size: 16, color: const Color(0xff926120)),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              currentProduct.shippingInfo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xff926120),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductConfigPage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildProductImage(),
          _buildTortoiseProtection(),
          Container(
            color: const Color(0xffFAFAFA),
            child: Column(
              children: [
                _buildColorSelector(),
                _buildStorageSelector(),
                _buildSpecificationsSection(),
                if (currentProduct.hasAppleIntelligence)
                  _buildAppleIntelligenceBanner(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 4,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: _buildAssetImage(
                      currentProduct.assetPath, 361.22, 203.18),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
              decoration: BoxDecoration(
                  color: const Color(0xffAFAFAF),
                  borderRadius: BorderRadius.circular(82)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? Colors.white
                          : const Color(0xffCBCBCB),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
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

  Widget _buildTortoiseProtection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xff114036),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/tortoise_protect.svg',
            width: 26,
            height: 29,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          const Text(
            'Protected with Tortoise Corporate Care',
            style: TextStyle(
              color: Color(0xffA4F6B5),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'FINISH',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff191919),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Pick a color',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff141414),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: currentProduct.colorVariants.map((color) {
              return GestureDetector(
                onTap: () => _updateSelectedColor(color.name),
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                  width: 41.84,
                  height: 41.84,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff00000073),
                        offset: Offset(0, 3.14),
                        blurRadius: 3.14,
                        spreadRadius: 0,
                      ),
                    ],
                    color: color.color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: color.isSelected
                          ? const Color(0xff16AF8E)
                          : Colors.white,
                      width: color.isSelected ? 4 : 2.09,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStorageSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'STORAGE',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff191919),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'How much space do you need?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff141414),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 111.3 / 52,
            ),
            itemCount: currentProduct.storageOptions.length,
            itemBuilder: (context, index) {
              final storage = currentProduct.storageOptions[index];
              return GestureDetector(
                onTap: () => _updateSelectedStorage(storage.capacity),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff0000000A),
                        spreadRadius: 0,
                        blurRadius: 0,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: storage.isSelected
                          ? const Color(0xff16AF8E)
                          : const Color(0xffEEEEEE),
                      width: storage.isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: storage.isSelected
                              ? const Color(0xff16AF8E)
                              : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: storage.isSelected
                                ? Colors.transparent
                                : const Color(0xffCBCBCB),
                            width: 1,
                          ),
                        ),
                        child: storage.isSelected
                            ? Container(
                                height: 6,
                                width: 6,
                                margin: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        storage.capacity,
                        style: const TextStyle(
                          color: Color(0xff141414),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationsSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SPECIFICATIONS',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xffAFAFAF),
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xffEEEEEE)),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xff0000000A),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildSpecRow(
                    PhosphorIcons.arrowsOutSimple(PhosphorIconsStyle.regular),
                    'Screen size',
                    currentProduct.specs.screenSize),
                _buildSpecRow(PhosphorIcons.camera(PhosphorIconsStyle.regular),
                    'Camera', currentProduct.specs.camera),
                _buildSpecRow(
                    PhosphorIcons.database(PhosphorIconsStyle.regular),
                    'Storage and RAM',
                    currentProduct.specs.storageAndRAM),
                _buildSpecRow(
                    PhosphorIcons.batteryEmpty(PhosphorIconsStyle.regular),
                    'Battery',
                    currentProduct.specs.battery),
                _buildSpecRow(
                    PhosphorIcons.cellSignalFull(PhosphorIconsStyle.regular),
                    'Connectivity',
                    currentProduct.specs.connectivity),
                const SizedBox(height: 8),
                const Divider(
                  color: Color(0xffE1E1E1),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'More details',
                        style: TextStyle(
                          color: Color(0xff167E62),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 16,
                        width: 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff167E62),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecRow(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff646464),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff646464),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppleIntelligenceBanner() {
    const double fullImageHeight = 1800;
    const double collapsedHeight = fullImageHeight / 6;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.only(bottom: 4, right: 4, left: 2),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0xff0000000A),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 2),
            ),
            BoxShadow(
              color: Color(0xff0000000a),
              spreadRadius: 0,
              blurRadius: 0,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffFAFAFA))),
      child: Column(
        children: [
          SizedBox(
            height: showFullBanner ? fullImageHeight : collapsedHeight,
            // clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/16pro_16promax.png',
              fit: BoxFit.cover,
              width: double.infinity,
              alignment:
                  showFullBanner ? Alignment.center : Alignment.topCenter,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showFullBanner = !showFullBanner;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffFAFAFA)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    showFullBanner ? 'Show less' : 'View more',
                    style: const TextStyle(
                      color: Color(0xff167E62),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    height: 16,
                    width: 16,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff167E62),
                    ),
                    child: Center(
                      child: Icon(
                        showFullBanner
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        size: 16,
                        color: Colors.white,
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

  Widget _buildPricingSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 25,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFAFAFA)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DEVICE PRICE',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff191919),
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      '₹${currentProduct.pricing.basePrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff191919),
                      ),
                    ),
                    Text(
                      'Monthly deduction ₹${currentProduct.pricing.monthlyDeduction.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff646464),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Flexible(flex: 1, child: SizedBox()),
          Flexible(
            flex: 25,
            child: GestureDetector(
              onTap: () => _showEffectivePriceBottomSheet(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xff42D499))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'EFFECTIVE PRICE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff114036),
                              letterSpacing: 1,
                            ),
                          ),
                          Container(
                            height: 16,
                            width: 16,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff167E62),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.keyboard_arrow_right,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '₹${currentProduct.pricing.effectivePrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff167E62),
                        ),
                      ),
                      const Text(
                        'See impact in net-salary',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff167E62),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicPricing() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          GestureDetector(
            onTap: () => setState(() => showPriceDetails = true),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Text(
                    'EFFECTIVE PRICE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'The effective price is the device\'s cost after\nsavings, based on your payroll structure',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedPricing() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'EFFECTIVE PRICE',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade400,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'The effective price is the device\'s cost after\nsavings, based on your payroll structure',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tax slab',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Text(
                          '30%',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                            PhosphorIcons.caretDown(PhosphorIconsStyle.regular),
                            size: 20),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey.shade300,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Effective price of the device',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0D7377),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Price calculation based on selected\ntax slab',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '₹ 92,483*',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0D7377),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  height: 1,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey.shade300,
                        style: BorderStyle.solid,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Impact in monthly in-hand',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'You monthly in-hand salary will be\nreduced by this amount',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '₹7,706*',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 1,
                  color: Colors.grey.shade300,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Know more action
                  },
                  child: Row(
                    children: [
                      const Text(
                        'Know more',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D7377),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(PhosphorIcons.caretDown(PhosphorIconsStyle.regular),
                          size: 16, color: const Color(0xFF0D7377)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              'Okay! Understood',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xff191919),
        borderRadius: BorderRadius.circular(102),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEEEEEE).withOpacity(0.35),
            offset: const Offset(0, -6.54),
            blurRadius: 19.61,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0xFF42474C).withOpacity(0.06),
            offset: const Offset(0, -3.27),
            blurRadius: 6.54,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color(0xFF42474C).withOpacity(0.32),
            offset: const Offset(0, 0),
            blurRadius: 0.82,
            spreadRadius: 0,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Add to cart',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _updateSelectedColor(String colorName) {
    setState(() {
      currentProduct = Product(
        id: currentProduct.id,
        name: currentProduct.name,
        category: currentProduct.category,
        colorVariants: currentProduct.colorVariants.map((variant) {
          return variant.copyWith(isSelected: variant.name == colorName);
        }).toList(),
        storageOptions: currentProduct.storageOptions,
        specs: currentProduct.specs,
        pricing: currentProduct.pricing,
        shippingInfo: currentProduct.shippingInfo,
        features: currentProduct.features,
        assetPath: currentProduct.assetPath,
        hasAppleIntelligence: currentProduct.hasAppleIntelligence,
      );
    });
  }

  void _updateSelectedStorage(String capacity) {
    setState(() {
      currentProduct = Product(
        id: currentProduct.id,
        name: currentProduct.name,
        category: currentProduct.category,
        colorVariants: currentProduct.colorVariants,
        storageOptions: currentProduct.storageOptions.map((option) {
          return option.copyWith(isSelected: option.capacity == capacity);
        }).toList(),
        specs: currentProduct.specs,
        pricing: currentProduct.pricing,
        shippingInfo: currentProduct.shippingInfo,
        features: currentProduct.features,
        assetPath: currentProduct.assetPath,
        hasAppleIntelligence: currentProduct.hasAppleIntelligence,
      );
    });
  }

  void _showEffectivePriceBottomSheet() {
    EffectivePriceBottomSheet.show(
      context,
      devicePrice:
          '₹${currentProduct.pricing.basePrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
      effectivePrice:
          '₹${currentProduct.pricing.effectivePrice.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}*',
      monthlyImpact:
          '₹${currentProduct.pricing.monthlyImpact.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}*',
      taxSlab: '${(currentProduct.pricing.taxRate * 100).toInt()}%',
    );
  }
}
