import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/product.dart';
import '../models/brand.dart';

class ProductData {
  static List<Brand> getBrands() {
    return [
      Brand(
        name: 'apple',
        displayName: 'Apple',
        icon: SvgPicture.asset('assets/images/apple_logo.svg', width: 24, height: 24),
        isSelected: true,
      ),
      Brand(
        name: 'google',
        displayName: 'Google',
        icon: SvgPicture.asset('assets/images/google_logo.svg', width: 24, height: 24),
      ),
      Brand(
        name: 'samsung',
        displayName: 'Samsung',
        icon: SvgPicture.asset('assets/images/samsung_logo.svg', width: 24, height: 24),
      ),
      Brand(
        name: 'oneplus',
        displayName: 'OnePlus',
        icon: SvgPicture.asset('assets/images/onepluslogo.svg', width: 24, height: 24),
      ),
    ];
  }

  static List<Product> getProducts() {
    return [
      Product(
        id: 'iphone16',
        name: 'iPhone 16',
        category: 'iPhone',
        hasAppleIntelligence: true,
        shippingInfo: 'Available now',
        assetPath: 'assets/images/iphone16.png',
        colorVariants: [
          ColorVariant(name: 'ultramarine', displayName: 'Ultramarine', color: Color(0xFF007AFF), isSelected: true),
          ColorVariant(name: 'teal', displayName: 'Teal', color: Color(0xFF30B0C7)),
          ColorVariant(name: 'pink', displayName: 'Pink', color: Color(0xFFFF69B4)),
          ColorVariant(name: 'white', displayName: 'White', color: Colors.white),
          ColorVariant(name: 'black', displayName: 'Black', color: Colors.black),
        ],
        storageOptions: [
          StorageOption(capacity: '128 GB', priceAdjustment: 0, isSelected: true),
          StorageOption(capacity: '256 GB', priceAdjustment: 10000),
          StorageOption(capacity: '512 GB', priceAdjustment: 30000),
        ],
        specs: ProductSpecs(
          screenSize: '6.1 inches',
          camera: '48MP Main',
          storageAndRAM: '6 GB | 128 GB',
          battery: 'Up to 22 hours video',
          connectivity: '5G',
        ),
        pricing: PricingInfo(
          basePrice: 79900,
          effectivePrice: 67900,
          monthlyDeduction: 12000,
          taxRate: 0.18,
          monthlyImpact: 5658,
        ),
        features: ['Built for Apple Intelligence', 'Camera Control', 'Action Button'],
      ),
      
      Product(
        id: 'iphone16plus',
        name: 'iPhone 16 Plus',
        category: 'iPhone',
        hasAppleIntelligence: true,
        shippingInfo: 'Available now',
        assetPath: 'assets/images/iphone16plus.png',
        colorVariants: [
          ColorVariant(name: 'teal', displayName: 'Teal', color: Color(0xFF30B0C7), isSelected: true),
          ColorVariant(name: 'ultramarine', displayName: 'Ultramarine', color: Color(0xFF007AFF)),
          ColorVariant(name: 'pink', displayName: 'Pink', color: Color(0xFFFF69B4)),
          ColorVariant(name: 'white', displayName: 'White', color: Colors.white),
          ColorVariant(name: 'black', displayName: 'Black', color: Colors.black),
        ],
        storageOptions: [
          StorageOption(capacity: '128 GB', priceAdjustment: 0, isSelected: true),
          StorageOption(capacity: '256 GB', priceAdjustment: 10000),
          StorageOption(capacity: '512 GB', priceAdjustment: 30000),
        ],
        specs: ProductSpecs(
          screenSize: '6.7 inches',
          camera: '48MP Main',
          storageAndRAM: '6 GB | 128 GB',
          battery: 'Up to 27 hours video',
          connectivity: '5G',
        ),
        pricing: PricingInfo(
          basePrice: 89900,
          effectivePrice: 76400,
          monthlyDeduction: 13500,
          taxRate: 0.18,
          monthlyImpact: 6367,
        ),
        features: ['Built for Apple Intelligence', 'Larger Display', 'Camera Control'],
      ),

      Product(
        id: 'iphone16pro',
        name: 'iPhone 16 Pro',
        category: 'iPhone',
        hasAppleIntelligence: true,
        shippingInfo: 'Shipping starts from 19th September onwards',
        assetPath: 'assets/images/16pro.png',
        colorVariants: [
          ColorVariant(name: 'natural_titanium', displayName: 'Natural Titanium', color: Color(0xff464A4C), isSelected: true),
          ColorVariant(name: 'white_titanium', displayName: 'White Titanium', color: Color(0xffD0DBCC)),
          ColorVariant(name: 'black_titanium', displayName: 'Black Titanium', color: Color(0xffEEE9CC)),
          ColorVariant(name: 'desert_titanium', displayName: 'Desert Titanium', color: Color(0xffEDD4D7)),
          ColorVariant(name: 'blue_titanium', displayName: 'Blue Titanium', color: Color(0xffD6DDE0)),
        ],
        storageOptions: [
          StorageOption(capacity: '128 GB', priceAdjustment: 0, isSelected: true),
          StorageOption(capacity: '256 GB', priceAdjustment: 10000),
          StorageOption(capacity: '512 GB', priceAdjustment: 30000),
          StorageOption(capacity: '1 TB', priceAdjustment: 50000),
        ],
        specs: ProductSpecs(
          screenSize: '6.3 inches',
          camera: 'Rear facing: 48 MP',
          storageAndRAM: '8 GB | 512 GB',
          battery: 'Up to 27 hours video playback',
          connectivity: '5G',
        ),
        pricing: PricingInfo(
          basePrice: 138963,
          effectivePrice: 92483,
          monthlyDeduction: 18900,
          taxRate: 0.30,
          monthlyImpact: 7706,
        ),
        features: [
          'Built for Apple Intelligence',
          'Thinnest borders yet',
          'Durable titanium design',
          '48MP Ultra Wide camera',
          '4K 120 fps Dolby Vision',
          'A18 Pro chip',
        ],
      ),

      Product(
        id: 'iphone16promax',
        name: 'iPhone 16 Pro Max',
        category: 'iPhone',
        hasAppleIntelligence: true,
        shippingInfo: 'Available now',
        assetPath: 'assets/images/16promax.png',
        colorVariants: [
          ColorVariant(name: 'natural_titanium', displayName: 'Natural Titanium', color: Color(0xFF8B7D6B), isSelected: true),
          ColorVariant(name: 'white_titanium', displayName: 'White Titanium', color: Color(0xFFE8E8E8)),
          ColorVariant(name: 'black_titanium', displayName: 'Black Titanium', color: Color(0xFF2C2C2E)),
          ColorVariant(name: 'desert_titanium', displayName: 'Desert Titanium', color: Color(0xFFFFA366)),
        ],
        storageOptions: [
          StorageOption(capacity: '256 GB', priceAdjustment: 0, isSelected: true),
          StorageOption(capacity: '512 GB', priceAdjustment: 20000),
          StorageOption(capacity: '1 TB', priceAdjustment: 40000),
        ],
        specs: ProductSpecs(
          screenSize: '6.9 inches',
          camera: 'Rear facing: 48 MP',
          storageAndRAM: '8 GB | 256 GB',
          battery: 'Up to 33 hours video playback',
          connectivity: '5G',
        ),
        pricing: PricingInfo(
          basePrice: 159900,
          effectivePrice: 135900,
          monthlyDeduction: 24000,
          taxRate: 0.30,
          monthlyImpact: 11325,
        ),
        features: ['Largest iPhone display ever', 'Pro camera system'],
      ),

      Product(
        id: 'iphone17pro',
        name: 'iPhone 17 Pro',
        category: 'iPhone',
        hasAppleIntelligence: true,
        shippingInfo: 'Shipping will begin in 3-4 weeks',
        assetPath: 'assets/images/iphone-17-pro-finish-select-202509-6-3inch-cosmicorange 1.png',
        colorVariants: [
          ColorVariant(name: 'desert_titanium', displayName: 'Desert Titanium', color: Color(0xFFFFA366), isSelected: true),
          ColorVariant(name: 'white_titanium', displayName: 'White Titanium', color: Color(0xFFE8E8E8)),
          ColorVariant(name: 'deep_blue', displayName: 'Deep Blue', color: Color(0xFF1E3A8A)),
        ],
        storageOptions: [
          StorageOption(capacity: '128 GB', priceAdjustment: 0, isSelected: true),
          StorageOption(capacity: '256 GB', priceAdjustment: 12000),
          StorageOption(capacity: '512 GB', priceAdjustment: 32000),
          StorageOption(capacity: '1 TB', priceAdjustment: 52000),
        ],
        specs: ProductSpecs(
          screenSize: '6.3 inches',
          camera: 'Rear facing: 48 MP',
          storageAndRAM: '8 GB | 512 GB',
          battery: 'Up to 27 hours video playback',
          connectivity: '5G',
        ),
        pricing: PricingInfo(
          basePrice: 138963,
          effectivePrice: 92483,
          monthlyDeduction: 18900,
          taxRate: 0.30,
          monthlyImpact: 7706,
        ),
        features: ['Next-generation Apple Intelligence', 'Enhanced performance'],
      ),

      Product(
        id: 'iphone17promax',
        name: 'iPhone 17 Pro Max',
        category: 'iPhone',
        hasAppleIntelligence: true,
        shippingInfo: 'Shipping will begin in 3-4 weeks',
        assetPath: 'assets/images/iphone-17-pro-finish-select-202509-6-3inch-cosmicorange 1.png',
        colorVariants: [
          ColorVariant(name: 'desert_titanium', displayName: 'Desert Titanium', color: Color(0xFFFFA366), isSelected: true),
          ColorVariant(name: 'white_titanium', displayName: 'White Titanium', color: Color(0xFFE8E8E8)),
          ColorVariant(name: 'deep_blue', displayName: 'Deep Blue', color: Color(0xFF1E3A8A)),
          ColorVariant(name: 'natural_titanium', displayName: 'Natural Titanium', color: Color(0xFF8B7D6B)),
        ],
        storageOptions: [
          StorageOption(capacity: '256 GB', priceAdjustment: 0, isSelected: true),
          StorageOption(capacity: '512 GB', priceAdjustment: 20000),
          StorageOption(capacity: '1 TB', priceAdjustment: 40000),
          StorageOption(capacity: '2 TB', priceAdjustment: 80000),
        ],
        specs: ProductSpecs(
          screenSize: '6.9 inches',
          camera: 'Rear facing: 48 MP',
          storageAndRAM: '8 GB | 256 GB',
          battery: 'Up to 33 hours video playback',
          connectivity: '5G',
        ),
        pricing: PricingInfo(
          basePrice: 159900,
          effectivePrice: 135900,
          monthlyDeduction: 24000,
          taxRate: 0.30,
          monthlyImpact: 11325,
        ),
        features: [
          'Next-generation Apple Intelligence',
          'Largest iPhone display ever',
          'Enhanced Pro camera system',
          'Advanced titanium design',
        ],
      ),

      Product(
        id: 'macbookpro',
        name: 'MacBook Pro',
        category: 'Mac',
        shippingInfo: 'Available now',
        assetPath: 'assets/images/macbook.png',
        colorVariants: [
          ColorVariant(name: 'space_black', displayName: 'Space Black', color: Color(0xFF1D1D1F), isSelected: true),
          ColorVariant(name: 'silver', displayName: 'Silver', color: Color(0xFFE8E8E8)),
        ],
        storageOptions: [
          StorageOption(capacity: '512 GB', priceAdjustment: 0, isSelected: true),
          StorageOption(capacity: '1 TB', priceAdjustment: 20000),
          StorageOption(capacity: '2 TB', priceAdjustment: 60000),
        ],
        specs: ProductSpecs(
          screenSize: '14 inches',
          camera: '1080p FaceTime HD',
          storageAndRAM: '18 GB | 512 GB',
          battery: 'Up to 18 hours battery life',
          connectivity: 'Wi-Fi 6E, Bluetooth 5.3',
        ),
        pricing: PricingInfo(
          basePrice: 199900,
          effectivePrice: 169900,
          monthlyDeduction: 30000,
          taxRate: 0.18,
          monthlyImpact: 14158,
        ),
        features: ['M3 Pro chip', 'Liquid Retina XDR display'],
      ),

      Product(
        id: 'ipadpro',
        name: 'iPad Pro',
        category: 'iPad',
        shippingInfo: 'Available now',
        assetPath: 'assets/images/ipadpro.png',
        colorVariants: [
          ColorVariant(name: 'space_gray', displayName: 'Space Gray', color: Color(0xFF1D1D1F), isSelected: true),
          ColorVariant(name: 'silver', displayName: 'Silver', color: Color(0xFFE8E8E8)),
        ],
        storageOptions: [
          StorageOption(capacity: '128 GB', priceAdjustment: 0, isSelected: true),
          StorageOption(capacity: '256 GB', priceAdjustment: 10000),
          StorageOption(capacity: '512 GB', priceAdjustment: 30000),
          StorageOption(capacity: '1 TB', priceAdjustment: 70000),
        ],
        specs: ProductSpecs(
          screenSize: '12.9 inches',
          camera: '12MP Wide',
          storageAndRAM: '8 GB | 128 GB',
          battery: 'Up to 10 hours battery life',
          connectivity: 'Wi-Fi 6E, 5G available',
        ),
        pricing: PricingInfo(
          basePrice: 112900,
          effectivePrice: 95900,
          monthlyDeduction: 17000,
          taxRate: 0.18,
          monthlyImpact: 7992,
        ),
        features: ['M2 chip', 'Liquid Retina XDR display'],
      ),

      // iPhone 15 Series
      Product(
        id: 'iphone15',
        name: 'iPhone 15',
        category: 'iPhone',
        shippingInfo: 'Available now',
        assetPath: 'assets/images/iphone15.png',
        colorVariants: [
          ColorVariant(name: 'blue', displayName: 'Blue', color: Color(0xFF007AFF), isSelected: true),
          ColorVariant(name: 'pink', displayName: 'Pink', color: Color(0xFFFF69B4)),
          ColorVariant(name: 'yellow', displayName: 'Yellow', color: Colors.yellow),
          ColorVariant(name: 'green', displayName: 'Green', color: Colors.green),
          ColorVariant(name: 'black', displayName: 'Black', color: Colors.black),
        ],
        storageOptions: [
          StorageOption(capacity: '128 GB', priceAdjustment: 0, isSelected: true),
          StorageOption(capacity: '256 GB', priceAdjustment: 8000),
          StorageOption(capacity: '512 GB', priceAdjustment: 25000),
        ],
        specs: ProductSpecs(
          screenSize: '6.1 inches',
          camera: '48MP Main',
          storageAndRAM: '6 GB | 128 GB',
          battery: 'Up to 20 hours video',
          connectivity: '5G',
        ),
        pricing: PricingInfo(
          basePrice: 69900,
          effectivePrice: 59900,
          monthlyDeduction: 10000,
          taxRate: 0.18,
          monthlyImpact: 4992,
        ),
        features: ['Dynamic Island', 'USB-C', '48MP camera'],
      ),

      Product(
        id: 'iphone15plus',
        name: 'iPhone 15 Plus',
        category: 'iPhone',
        shippingInfo: 'Available now',
        assetPath: 'assets/images/iphone15plus.png',
        colorVariants: [
          ColorVariant(name: 'pink', displayName: 'Pink', color: Color(0xFFFF69B4), isSelected: true),
          ColorVariant(name: 'blue', displayName: 'Blue', color: Color(0xFF007AFF)),
          ColorVariant(name: 'yellow', displayName: 'Yellow', color: Colors.yellow),
          ColorVariant(name: 'green', displayName: 'Green', color: Colors.green),
          ColorVariant(name: 'black', displayName: 'Black', color: Colors.black),
        ],
        storageOptions: [
          StorageOption(capacity: '128 GB', priceAdjustment: 0, isSelected: true),
          StorageOption(capacity: '256 GB', priceAdjustment: 8000),
          StorageOption(capacity: '512 GB', priceAdjustment: 25000),
        ],
        specs: ProductSpecs(
          screenSize: '6.7 inches',
          camera: '48MP Main',
          storageAndRAM: '6 GB | 128 GB',
          battery: 'Up to 26 hours video',
          connectivity: '5G',
        ),
        pricing: PricingInfo(
          basePrice: 79900,
          effectivePrice: 67900,
          monthlyDeduction: 12000,
          taxRate: 0.18,
          monthlyImpact: 5658,
        ),
        features: ['Dynamic Island', 'USB-C', 'Larger Display'],
      ),
    ];
  }
}
