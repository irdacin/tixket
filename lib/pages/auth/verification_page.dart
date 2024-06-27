import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:tixket/components/loading_button.dart';
import 'package:tixket/pages/auth/create_new_password_page.dart';
import 'package:tixket/pages/auth/login_page.dart';
import 'package:tixket/utils/local_notifications.dart';

class VerificationPage extends StatefulWidget {
  final String email;

  const VerificationPage({
    super.key,
    required this.email
  });

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>  {
  bool invalid = false;
  int resendTime = 0;
  String textCode = "";
  String otpCode = "";
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _generateOtp();
    _startTimer();
    _showNotifications();
  }

  void _showNotifications() {
    LocalNotifications.showSimpleNotification(
      title: "Tixket", 
      body: "Your OTP Code $otpCode", 
      payload: otpCode
    );
  }


  void _generateOtp() {
    DateTime now = DateTime.now();
    int miliseconds = now.millisecondsSinceEpoch;
    int otpNumber = miliseconds % 10000;

    setState(() {
      otpCode = otpNumber.toString().padLeft(4, '0');
    });
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (resendTime > 0) {
        setState(() {
          resendTime--;
        });
        _startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()), 
                (route) => false
              );
            }, 
            tooltip: "Close",
            icon: const Icon(Icons.close)
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification Code",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              Text(
                "Enter the 4 digit verification code received",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              OtpTextField(
                showFieldAsBox: true,
                fieldWidth: 60,
                fieldHeight: 90,
                filled: true,
                fillColor: Theme.of(context).colorScheme.onPrimaryFixed,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                hasCustomInputDecoration: true,
                decoration: InputDecoration(
                  counterText: "",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error,
                      width: 1.5
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.error,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorText: invalid ? "" : null,
                ),
                onSubmit: (value) {
                  setState(() {
                    textCode = value;
                  });
                },
              ),
              Row(
                children: [
                  const Text("Didn't received code yet?"),
                  const SizedBox(width: 10),
                  resendTime == 0
                    ? InkWell(
                      onTap: () {
                        setState(() {
                          invalid = false;
                          resendTime = 60;
                        });
                        _generateOtp();
                        _startTimer();
                        _showNotifications();
                      },
                      child: Text(
                        "Resend",
                        style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.blue)
                      ),
                    ) : const SizedBox(width: 6),
                ]
              ),
              const SizedBox(height: 10),
              resendTime > 0 
              ? Text(
                "You can resend code after $resendTime second(s)",
                style: Theme.of(context).textTheme.bodyMedium,
              ) : const SizedBox(),
              if(invalid) const SizedBox(height: 10),
              Text(
                invalid ? "Invalid Code!" : "",
                style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.red)
              ),
              if(invalid) const SizedBox(height: 20),
              LoadingButton(
                onPressed: () {
                  if(textCode == otpCode) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CreateNewPasswordPage(email: widget.email))
                    );
                  }
                  else {
                    setState(() {
                      invalid = true;
                    });
                  }
                }, 
                label: "Verify"
              )
            ],
          ),
        ),
      ),
    );
  }
}