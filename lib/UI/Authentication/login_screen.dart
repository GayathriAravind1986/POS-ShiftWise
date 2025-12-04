import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:simple/Alertbox/snackBarAlert.dart';
import 'package:simple/Bloc/Authentication/login_bloc.dart';
import 'package:simple/ModelClass/Authentication/Post_login_model.dart';
import 'package:simple/ModelClass/Authentication/postShiftModel.dart';
import 'package:simple/Reusable/color.dart';
import 'package:simple/Reusable/customTextfield.dart';
import 'package:simple/Reusable/space.dart';
import 'package:simple/UI/DashBoard/custom_tabbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginInBloc(),
      child: const LoginScreenView(),
    );
  }
}

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({
    super.key,
  });

  @override
  LoginScreenViewState createState() => LoginScreenViewState();
}

class LoginScreenViewState extends State<LoginScreenView> {
  PostLoginModel postLoginModel = PostLoginModel();
  PostShiftModel postShiftModel = PostShiftModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RegExp emailRegex = RegExp(r'\S+@\S+\.\S+');
  String? errorMessage;
  var showPassword = true;
  bool loginLoad = false;
  bool shiftLoad = false;
  String? selectedShift;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showShiftPopup(BuildContext context, Size size, Data user) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by clicking outside
      builder: (context2) {
        return BlocProvider(
          create: (context) => LoginInBloc(),
          child: BlocProvider.value(
            value: BlocProvider.of<LoginInBloc>(context, listen: false),
            child: StatefulBuilder(builder: (context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                backgroundColor: whiteColor,
                child: Container(
                  width: size.width * 0.3,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // -------- HEADER -------- //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Select Shift",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // -------- USER DETAILS -------- //
                      Text("Welcome, ${user.name}",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      Text("Role: ${user.role}",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                      const SizedBox(height: 20),

                      // -------- Dropdown -------- //
                      const Text("Choose your shift"),
                      const SizedBox(height: 6),

                      StatefulBuilder(
                        builder: (context, setStateDialog) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedShift,
                                isExpanded: true,
                                hint: const Text("-- Select Shift --"),
                                items: user.shiftData
                                    ?.map((shift) => DropdownMenuItem(
                                          value: shift,
                                          child: Text(shift),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedShift = value;
                                    debugPrint("selectedShift:$selectedShift");
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),
                      loginLoad
                          ? const SpinKitCircle(
                              color: appPrimaryColor, size: 30)
                          : InkWell(
                              onTap: () {
                                if (selectedShift == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: redColor,
                                      content: const Text(
                                        "Please select your shift",
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(
                                          16), // Optional: rounded floating style
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                setState(() {
                                  loginLoad = true;
                                });
                                context.read<LoginInBloc>().add(LoginIn(
                                    email.text,
                                    password.text,
                                    selectedShift.toString()));
                              },
                              child: appButton(
                                  height: 50,
                                  width: size.width * 0.85,
                                  buttonText: "Confirm Shift"),
                            ),
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget mainContainer() {
      return Form(
        key: _formKey,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: size.width * 0.5,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: appPrimaryColor),
                  boxShadow: [
                    BoxShadow(
                      color: blackColor12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: appPrimaryColor,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Subtitle
                    Text('Sign in to start your session'),
                    SizedBox(height: 12),

                    // Email field
                    CustomTextField(
                        hint: "Email Address",
                        readOnly: false,
                        controller: email,
                        baseColor: appPrimaryColor,
                        borderColor: appGreyColor,
                        errorColor: redColor,
                        inputType: TextInputType.text,
                        showSuffixIcon: false,
                        FTextInputFormatter: FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z0-9.@]")),
                        obscureText: false,
                        maxLength: 30,
                        onChanged: (val) {
                          _formKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!emailRegex.hasMatch(value)) {
                              return 'Please enter valid email';
                            } else {
                              return null;
                            }
                          }
                          return null;
                        }),
                    SizedBox(height: 12),

                    // Password field
                    CustomTextField(
                        hint: "Password",
                        readOnly: false,
                        controller: password,
                        baseColor: appPrimaryColor,
                        borderColor: appGreyColor,
                        errorColor: redColor,
                        inputType: TextInputType.text,
                        obscureText: showPassword,
                        showSuffixIcon: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: appGreyColor,
                          ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        maxLength: 80,
                        onChanged: (val) {
                          _formKey.currentState!.validate();
                        },
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
                            } else {
                              return null;
                            }
                          }
                          return null;
                        }),
                    SizedBox(height: 12),
                    shiftLoad
                        ? const SpinKitCircle(color: appPrimaryColor, size: 30)
                        : InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  shiftLoad = true;
                                });
                                context.read<LoginInBloc>().add(ShiftSelect(
                                      email.text,
                                      password.text,
                                    ));
                              }
                            },
                            child: appButton(
                                height: 50,
                                width: size.width * 0.85,
                                buttonText: "Login"),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        body: BlocBuilder<LoginInBloc, dynamic>(
          buildWhen: ((previous, current) {
            if (current is PostShiftModel) {
              postShiftModel = current;
              if (postShiftModel.success == true) {
                if (postShiftModel.data!.role == "OPERATOR") {
                  setState(() {
                    shiftLoad = false;
                    showShiftPopup(context, size, postShiftModel.data!);
                  });
                } else {
                  showToast("Please Login Admin in Web", context, color: false);
                }
              } else {
                final errorMsg =
                    postShiftModel.errorResponse?.errors?.first.message ??
                        postShiftModel.message ??
                        "No shift available...";
                showToast(errorMsg, context, color: false);
                setState(() {
                  shiftLoad = false;
                });
              }
              return true;
            }
            if (current is PostLoginModel) {
              postLoginModel = current;
              if (postLoginModel.success == true) {
                setState(() {
                  loginLoad = false;
                });
                showToast('${postLoginModel.message}', context, color: true);
                if (postLoginModel.user!.role == "OPERATOR") {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const DashBoardScreen(
                                selectTab: 0,
                              )),
                      (Route<dynamic> route) => false);
                } else {
                  showToast("Please Login Admin in Web", context, color: false);
                }
              } else {
                final errorMsg =
                    postLoginModel.errorResponse?.errors?.first.message ??
                        postLoginModel.message ??
                        "Login failed. Please try again.";
                showToast(errorMsg, context, color: false);
                setState(() {
                  loginLoad = false;
                });
              }
              return true;
            }
            return false;
          }),
          builder: (context, dynamic) {
            return mainContainer();
          },
        ));
  }
}
