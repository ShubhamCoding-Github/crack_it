import 'package:crack_it_user/utils/base_widgets/base_app_bar.dart';
import 'package:crack_it_user/utils/constants/base_colors.dart';
import 'package:crack_it_user/utils/constants/base_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletView extends StatefulWidget {
  const WalletView({super.key});

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: "Wallet",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 180,
                      child: SvgPicture.asset(
                        walletBackgroundIc,
                        fit: BoxFit.fill,
                      )),
                  const Positioned(
                      top: 50,
                      left: 20,
                      child: Column(
                        children: [
                          Text(
                            "Wallet Amount",
                            style: TextStyle(color: whiteColor, fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$127",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ))
                ],
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: List.generate(10, (index) {
                  return baseTransactionCard(
                    index: index,
                  );
                }),
              ),
              const SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}

class baseTransactionCard extends StatelessWidget {
  const baseTransactionCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    walletTnxIc,
                    width: 60,
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jaxen C",
                        style: TextStyle(
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "My progress getting better. Thank you",
                          style: TextStyle(fontSize: 14, color: textGrayColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  index.isEven
                      ? const Text(
                          "+\$582",
                          style: TextStyle(
                              fontSize: 16,
                              color: primaryColor,
                              fontWeight: FontWeight.normal),
                        )
                      : const Column(
                          children: [
                            Text(
                              "Pending",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: greyColor2,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "\$582",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: orangeColor,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                ],
              )
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
