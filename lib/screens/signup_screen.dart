import 'package:flutter/material.dart';

import '../enums/enums.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isVisible = false;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final formKey=GlobalKey<FormState>();
  bool product1CheckBox=false;
  bool product2CheckBox=false;
  bool product3CheckBox=false;
  Gender? selectedGender;
  bool switchValue=false;
  double selectedSliderValue=0;
  final emailFocuseNode=FocusNode();
  final passwordFocuseNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(

        body: SafeArea(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  focusNode: emailFocuseNode,
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(fontSize: 30),
                  ),
                  validator: (String? val){
                    if (val!.isEmpty) {
                      return "enter email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: passwordFocuseNode,
                    onChanged: (String val){
                      print(val);
                    },
                    onTap: (){
                      print('tapped');
                    },
                    onFieldSubmitted: (String val){
                      print ("submitted");
                    },
                    controller: passwordController,
                    obscureText: !isVisible,
                    validator: (String? val){
                      if (val!.length<6) {
                        return "password must be 6 char";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      labelStyle: TextStyle(fontSize: 30),
                      suffix: IconButton(
                        icon: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                Text("Section"),
                CheckboxListTile(
                    value: product1CheckBox,
                    title: Text("product1"),
                    onChanged: (val){
                      setState(() {
                        product1CheckBox=val!;
                      });
                    }),
                Row(
                  children: [
                    Text("product2"),
                    Checkbox(
                        value: product2CheckBox,
                        onChanged: (val){
                          setState(() {
                            product2CheckBox=val!;
                          });
                        }),
                  ],
                ),
                Row(
                  children: [
                    Text("product3"),
                    Checkbox(
                        value: product3CheckBox,
                        onChanged: (val){
                          setState(() {
                            product3CheckBox=val!;
                          });
                        }),
                  ],
                ),
                Text("Gender"),
                Row(
                  children: [
                    Text("male"),
                    Radio<Gender>(
                      groupValue: selectedGender,
                      value: Gender.male,
                      onChanged: (val){
                        setState(() {
                          selectedGender=val;
                        });
                      },
                    )
                  ],
                ),
                RadioListTile<Gender>(
                  groupValue: selectedGender,
                  value: Gender.female,
                  onChanged: (val){
                    setState(() {
                      selectedGender=val;
                    });
                  },
                  title: Text("Female"),
                ),
                Row(
                  children: [
            
                    Text("wifi"),
                    Expanded(child: Container()),
            
                    Switch(
                      value: switchValue,
                      onChanged: (val){
                        print(val);
                        setState(() {
                          switchValue=val;
                        });
                      },
            
                      activeColor: Colors.white,
                      activeTrackColor: Colors.green,
                      inactiveThumbColor: Colors.red,
                      inactiveTrackColor: Colors.black,
                    ),
            
                  ],
                ),
                Center(child: Text(selectedSliderValue.round().toString(),style: TextStyle(fontSize: 30),)),
                Slider(
            
                    value: selectedSliderValue,
            
                    onChanged: (double newVal){
                      print(newVal);
                      setState(() {
                        selectedSliderValue=newVal;
                      });
            
                    },
                  min: 0,
                  max: 100,
                ),
            
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: ElevatedButton(onPressed: () {
                      if (formKey.currentState!.validate()){
                        print(product1CheckBox);
                       print("validated");
                      }
            
                    }, child: Text("Sign up",),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
