import 'package:carft_bay/presentation/state_holders/create_invoice_controller.dart';
import 'package:carft_bay/presentation/ui/widget/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<CreateInvoiceController>().createInVoice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: GetBuilder<CreateInvoiceController>(
          builder: (createInvoiceController) {
        if (createInvoiceController.inProgress) {
          return const CenterCircularProgressIndicator();
        }
        final inVoiceWrapper =
            createInvoiceController.paymentMethodListModel.data!.first;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text('Payable ${inVoiceWrapper.payable}'),
                Text('VAT: ${inVoiceWrapper.vat}'),
                Text('Total: ${inVoiceWrapper.total}'),
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: inVoiceWrapper.paymentMethodList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      leading: Image.network(
                          inVoiceWrapper.paymentMethodList?[index].logo ?? ''),
                      title: Text(
                          inVoiceWrapper.paymentMethodList?[index].name ?? ''),
                      trailing: const Icon(Icons.arrow_forward_outlined),
                    );
                  },
                  separatorBuilder: (__, ___) => const Divider(),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
