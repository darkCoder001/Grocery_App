import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/constants/global_variables.dart';
import 'package:grocery_app/features/address/services/address_services.dart';
import 'package:grocery_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/custom_textfield.dart';
import '../../../constants/utils.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final int totalSum;
  const AddressScreen({super.key, required this.totalSum});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController flatController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final addressFormKey = GlobalKey<FormState>();

  String addressToBeUsed = "";

  final AddressServices addressServices = AddressServices();

  void saveUserAddress() {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBeUsed);
    }
    addressServices.placeOrder(
        context: context,
        address: addressToBeUsed,
        totalSum: widget.totalSum.toDouble());
  }

  void payPressed(String addressFromProvider) {
    addressToBeUsed = "";

    bool isForm = flatController.text.isNotEmpty ||
        streetController.text.isNotEmpty ||
        pincodeController.text.isNotEmpty ||
        cityController.text.isNotEmpty;

    if (isForm) {
      if (addressFormKey.currentState!.validate()) {
        addressToBeUsed =
            '${flatController.text}, ${streetController.text}, ${cityController.text} - ${pincodeController.text}';
        saveUserAddress();
      } else {
        throw Exception('Please enter all the values!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBeUsed = addressFromProvider;
      saveUserAddress();
    } else {
      showSnackBar(context, 'ERROR');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flatController.dispose();
    streetController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          backgroundColor: GlobalVariables.selectedNavBarColor,
          centerTitle: true,
          title: Text(
            "Confirm Address",
            style: GoogleFonts.signikaNegative(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: GoogleFonts.signikaNegative(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "OR",
                      style: GoogleFonts.signikaNegative(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              Form(
                key: addressFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: CustomTextField(
                          controller: flatController,
                          icon: Icon(Icons.house),
                          hintText: "Flat, House No, Building ",
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: CustomTextField(
                          controller: streetController,
                          icon: Icon(Icons.location_city),
                          hintText: "Area, Street",
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: pincodeController,
                            icon: Icon(Icons.pin_drop_outlined),
                            hintText: "Pincode",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: cityController,
                            icon: Icon(Icons.map),
                            hintText: "Town/City",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.expand(
                          width: double.infinity, height: 50),
                      child: TextButton(
                        onPressed: () {
                          payPressed(address);
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              GlobalVariables.selectedNavBarColor,
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            alignment: Alignment.center),
                        child: Text(
                          "Proceed to Payments",
                          style: GoogleFonts.signikaNegative(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
