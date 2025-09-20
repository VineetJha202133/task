import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EffectivePriceBottomSheet extends StatelessWidget {
  final String devicePrice;
  final String effectivePrice;
  final String monthlyImpact;
  final String taxSlab;
  final VoidCallback? onOkayPressed;

  const EffectivePriceBottomSheet({
    Key? key,
    required this.devicePrice,
    required this.effectivePrice,
    required this.monthlyImpact,
    required this.taxSlab,
    this.onOkayPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'EFFECTIVE PRICE',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xffAFAFAF),
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),

          // Description
          const Text(
            'The effective price is the device\'s cost after\nsavings, based on your payroll structure',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xff323232),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          // Main content card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xffFAFAFA)),
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
            child: Column(
              children: [
                // Tax slab row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tax slab',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff191919)),
                    ),
                    Row(
                      children: [
                        Text(
                          taxSlab,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff323232)),
                        ),
                        const SizedBox(width: 8),
                        Icon(PhosphorIcons.caretDown(PhosphorIconsStyle.fill),
                            color: const Color(0xff323232), size: 16),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: List.generate(
                      150 ~/ 3,
                      (index) => Expanded(
                            child: Container(
                              color: index % 2 == 0
                                  ? Colors.transparent
                                  : const Color(0xffE1E1E1),
                              height: 1,
                            ),
                          )),
                ),

                const SizedBox(height: 15),

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
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF16AF8E),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Price calculation based on selected\ntax slab',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      effectivePrice,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff16AF8E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: List.generate(
                      150 ~/ 3,
                      (index) => Expanded(
                            child: Container(
                              color: index % 2 == 0
                                  ? Colors.transparent
                                  : const Color(0xffE1E1E1),
                              height: 1,
                            ),
                          )),
                ),
                const SizedBox(height: 15),

                // Monthly impact row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Impact in monthly in-hand',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff191919),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'You monthly in-hand salary will be\nreduced by this amount',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      monthlyImpact,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff323232),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: List.generate(
                      150 ~/ 3,
                      (index) => Expanded(
                            child: Container(
                              color: index % 2 == 0
                                  ? Colors.transparent
                                  : const Color(0xffE1E1E1),
                              height: 1,
                            ),
                          )),
                ),
                const SizedBox(height: 15),

                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Know more',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff167E62),
                        ),
                      ),
                      Icon(PhosphorIcons.caretDown(PhosphorIconsStyle.fill),
                          size: 16, color: const Color(0xff167E62)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          GestureDetector(
            onTap: onOkayPressed ?? () => Navigator.pop(context),
            child: Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
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
                color: const Color(0xff191919),
                borderRadius: BorderRadius.circular(102),
              ),
              child: const Center(
                child: Text(
                  'Okay! Understood',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void show(
    BuildContext context, {
    required String devicePrice,
    required String effectivePrice,
    required String monthlyImpact,
    required String taxSlab,
    VoidCallback? onOkayPressed,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EffectivePriceBottomSheet(
        devicePrice: devicePrice,
        effectivePrice: effectivePrice,
        monthlyImpact: monthlyImpact,
        taxSlab: taxSlab,
        onOkayPressed: onOkayPressed,
      ),
    );
  }
}
