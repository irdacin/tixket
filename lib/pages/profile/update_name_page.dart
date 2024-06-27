import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tixket/components/input_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/providers/user_provider.dart';

class UpdateNamePage extends StatefulWidget {
  const UpdateNamePage({super.key});

  @override
  State<UpdateNamePage> createState() => _UpdateNamePageState();
}

class _UpdateNamePageState extends State<UpdateNamePage> {
  TextEditingController nameController = TextEditingController();
  FocusNode focusNodeName = FocusNode();
  bool isChanged = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.text = Provider.of<UserProvider>(context, listen: false).currentUser!.name;
    });
  }

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
                  isChanged = value != Provider.of<UserProvider>(context, listen: false).currentUser!.name;
                });
              },
              labelText: "Name",
            ),
            const SizedBox(height: 40),
            LoadingButton(
              onPressed: isChanged ? () {
                Provider.of<UserProvider>(context, listen: false).updateName(nameController.text);
                Navigator.of(context).pop();

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
                backgroundColor: isChanged ? Colors.blue : Theme.of(context).colorScheme.secondary,
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