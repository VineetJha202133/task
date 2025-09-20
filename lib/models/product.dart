import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final String category;
  final List<ColorVariant> colorVariants;
  final List<StorageOption> storageOptions;
  final ProductSpecs specs;
  final PricingInfo pricing;
  final String shippingInfo;
  final List<String> features;
  final String assetPath;
  final bool hasAppleIntelligence;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.colorVariants,
    required this.storageOptions,
    required this.specs,
    required this.pricing,
    required this.shippingInfo,
    required this.features,
    required this.assetPath,
    this.hasAppleIntelligence = false,
  });

  ColorVariant get selectedColor => 
      colorVariants.firstWhere((c) => c.isSelected, orElse: () => colorVariants.first);
  
  StorageOption get selectedStorage => 
      storageOptions.firstWhere((s) => s.isSelected, orElse: () => storageOptions.first);
  
  int get currentPrice => pricing.basePrice + selectedStorage.priceAdjustment;
}

class ColorVariant {
  final String name;
  final String displayName;
  final Color color;
  final bool isSelected;

  ColorVariant({
    required this.name,
    required this.displayName,
    required this.color,
    this.isSelected = false,
  });

  ColorVariant copyWith({bool? isSelected}) {
    return ColorVariant(
      name: name,
      displayName: displayName,
      color: color,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class StorageOption {
  final String capacity;
  final int priceAdjustment;
  final bool isSelected;

  StorageOption({
    required this.capacity,
    required this.priceAdjustment,
    this.isSelected = false,
  });

  StorageOption copyWith({bool? isSelected}) {
    return StorageOption(
      capacity: capacity,
      priceAdjustment: priceAdjustment,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class ProductSpecs {
  final String screenSize;
  final String camera;
  final String storageAndRAM;
  final String battery;
  final String connectivity;

  ProductSpecs({
    required this.screenSize,
    required this.camera,
    required this.storageAndRAM,
    required this.battery,
    required this.connectivity,
  });
}

class PricingInfo {
  final int basePrice;
  final int effectivePrice;
  final int monthlyDeduction;
  final double taxRate;
  final int monthlyImpact;

  PricingInfo({
    required this.basePrice,
    required this.effectivePrice,
    required this.monthlyDeduction,
    required this.taxRate,
    required this.monthlyImpact,
  });
}
