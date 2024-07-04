import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/providers/payment_method_provider.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Methods"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Text(
                "Select payment method",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemCount: Provider.of<PaymentMethodProvider>(context).paymentMethods.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Provider.of<PaymentMethodProvider>(context, listen: false).updatePaymentMethod(Provider.of<PaymentMethodProvider>(context, listen: false).paymentMethods[index]);
                      Navigator.of(context).pop();
                    },
                    contentPadding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary
                      )
                    ),
                    leading: Image.asset(
                      "assets/images/${Provider.of<PaymentMethodProvider>(context).paymentMethods[index].fileName}",
                      width: 50,
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right_sharp),
                    title: Text(
                      Provider.of<PaymentMethodProvider>(context).paymentMethods[index].name,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}