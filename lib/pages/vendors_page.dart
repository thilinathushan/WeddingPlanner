import 'package:flutter/material.dart';

import '../models/vendor_checklist_data.dart';
import '../widgets/card_vendor.dart';

class VendorsPage extends StatefulWidget {
  const VendorsPage({super.key});

  @override
  State<VendorsPage> createState() => _VendorsPageState();
}

class _VendorsPageState extends State<VendorsPage> {
  VendorCard vendorcard = VendorCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 15.0,
              ),
              itemCount: vendorcard.displayNameData.length,
              itemBuilder: (context, index) {
                String jobName = vendorcard.jobNameData[index];
                String price = vendorcard.priceData[index];
                String vendorCategory = vendorcard.vendorCategory[index];
                String vendorName = vendorcard.displayNameData[index];
                return CardVendor(
                  jobName: jobName,
                  price: price,
                  vendorCategory: vendorCategory,
                  vendorName: vendorName,
                );
              }),
        ),
      ],
    );
  }
}
