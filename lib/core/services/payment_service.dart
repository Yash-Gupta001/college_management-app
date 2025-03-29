import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class StripePaymentScreen extends StatefulWidget {
  @override
  _StripePaymentScreenState createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent('10', 'USD'); // Amount in USD
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            merchantDisplayName: 'Test Merchant',
          ),
        );

        await Stripe.instance.presentPaymentSheet();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Payment Successful"),
            content: const Text("Thank you for your payment!"),
            actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
          ),
        );
      }
    } catch (e) {
      print("Payment failed: $e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Payment failed: $e")));
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    try {
      final body = {
        'amount': (int.parse(amount) * 100).toString(), // Convert to cents
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'sk_test_51R7tZbD6D3fE5PpDhXTjp2Cwpby02kL9Fm81S9XOl1tKK9nntwdsmzFkdLI8vq5nOhb9YT4Kgge5sYSfI8ZAy1fY00zP8N174U',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );

      return json.decode(response.body);
    } catch (err) {
      throw Exception("Error creating payment intent: $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stripe Payment")),
      body: Center(
        child: ElevatedButton(
          onPressed: makePayment,
          child: const Text("Pay with Stripe"),
        ),
      ),
    );
  }
}
