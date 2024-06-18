import 'package:flutter/material.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/pages/profile/account_page.dart';
import 'package:tixket/providers/user_provider.dart';
import 'package:tixket/utils/update_user_detail.dart';

class UpdateNamePage extends StatefulWidget {
  const UpdateNamePage({super.key});

  @override
  State<UpdateNamePage> createState() => _UpdateNamePageState();
}

class _UpdateNamePageState extends State<UpdateNamePage> {
  TextEditingController nameController = TextEditingController(text: currentUser?.name ?? "");
  FocusNode focusNodeName = FocusNode();
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InputField(
              controller: nameController,
              icon: Icons.person,
              focusNode: focusNodeName,
              onChanged: (value) {
                setState(() {
                  isChanged = value != currentUser!.name;
                });
              },
              labelText: "Name",
            ),
            const SizedBox(height: 40),
            LoadingButton(
              onPressed: isChanged ? () {
                UpdateUserDetail().updateName(currentUser!.email, nameController.text);
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const AccountPage())
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Name has been successfully updated",
                      style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.blue,
                  )
                );
              } : null, 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isChanged ? Colors.blue : const Color(0xffaaaaaa),
                textStyle: Theme.of(context).textTheme.bodyMedium,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
              label: "Save"
            )
          ],
        ),
      ),
    );
  }
}