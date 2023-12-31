import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store/data/order.dart';
import 'package:nike_store/data/repo/order_repository.dart';
import 'package:nike_store/ui/cart/price_info.dart';
import 'package:nike_store/ui/receipt/payment_receipt.dart';
import 'package:nike_store/ui/shipping/bloc/shipping_bloc.dart';

class ShippingScreen extends StatefulWidget {
  final int payablePrice;
  final int shippingCost;
  final int totalPrice;

  const ShippingScreen(
      {Key? key,
      required this.payablePrice,
      required this.shippingCost,
      required this.totalPrice})
      : super(key: key);

  @override
  State<ShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ShippingScreen> {
  final TextEditingController firtNameController =
      TextEditingController(text: 'سعید');

  final TextEditingController lastNameController =
      TextEditingController(text: 'شاهینی');

  final TextEditingController phoneNumberController =
      TextEditingController(text: '09121234567');

  final TextEditingController postalCodeController =
      TextEditingController(text: '1234567890');

  final TextEditingController addressController =
      TextEditingController(text: ' gfshfhshsfgsgخیابان شهید بهشتی');

  StreamSubscription? subscription;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تحویل گیرنده'),
        centerTitle: false,
      ),
      body: BlocProvider<ShippingBloc>(
        create: (context) {
          final bloc = ShippingBloc(orderRepository);
          subscription = bloc.stream.listen((event) {
            if (event is ShippingError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(event.appException.message)));
            } else if (event is ShippingSuccess) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  PaymentReceiptScreen(orderId: event.result.orderId)));
            }
          });
          return bloc;
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: firtNameController,
                decoration: const InputDecoration(label: Text('نام')),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(label: Text('نام خانوادگی')),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(label: Text('شماره تماس')),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: postalCodeController,
                decoration: const InputDecoration(label: Text('کد پستی')),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(label: Text('آدرس')),
              ),
              const SizedBox(
                height: 12,
              ),
              PriceInfo(
                  payablePrice: widget.payablePrice,
                  shippingCost: widget.shippingCost,
                  totalPrice: widget.totalPrice),
              BlocBuilder<ShippingBloc, ShippingState>(
                builder: (context, state) {
                  return state is ShippingLoading
                      ? const Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                                onPressed: () {
                                  BlocProvider.of<ShippingBloc>(context).add(
                                      ShippingCreateOrder(CreateOrderParams(
                                          firtNameController.text,
                                          lastNameController.text,
                                          phoneNumberController.text,
                                          postalCodeController.text,
                                          addressController.text,
                                          PaymentMethod.cashOnDelivery)));
                                },
                                child: const Text('پرداخت در محل')),
                            const SizedBox(
                              width: 16,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('پرداخت اینترنتی'),
                            ),
                          ],
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
