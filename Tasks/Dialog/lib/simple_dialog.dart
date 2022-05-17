import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleDialogPage extends StatefulWidget {
  const SimpleDialogPage({Key? key}) : super(key: key);

  @override
  State<SimpleDialogPage> createState() => _SimpleDialogPageState();
}

class _SimpleDialogPageState extends State<SimpleDialogPage> {
  // not necessary variable
  bool isPressed = false;

  // needed variables
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool clear = false;
  bool isDisabled = true;
  bool isNotValid = false;

  @override
  void initState() {
    // TODO: implement initState
    isDisabled = textEditingController.text.isEmpty;
    setState(() {});
    super.initState();
  }

  Future<void> simpleDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                // #paddings
                titlePadding: EdgeInsets.zero,
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                insetPadding: EdgeInsets.zero,
                buttonPadding: EdgeInsets.zero,
                // #shape
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                ),

                // #Dialog title
                title: SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            IconButton(
                              splashRadius: 1,
                              icon: const Icon(CupertinoIcons.clear_thick, size: 20,),
                              onPressed: (){
                                setState(() {
                                  clear = false;
                                  textEditingController.clear();
                                  isDisabled = true;
                                  isNotValid = false;
                                });
                                Navigator.pop(context);
                              },
                            ),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'Name your wishlist',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(thickness: 2, color: Colors.grey.shade300),
                    ],
                  ),
                ),

                // #Dialog content => Text Field
                content: SizedBox(
                  width: MediaQuery.of(context).size.width - 80,
                  child: TextField(
                    controller: textEditingController,
                    focusNode: focusNode,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                        labelText: 'Name',
                        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: isNotValid ? CupertinoColors.systemRed : Colors.grey),

                        errorText: isNotValid ? '' : null,

                        counterText: 'Maximum 50 characters',
                        counterStyle: TextStyle(
                          color: isNotValid ? CupertinoColors.systemRed : Colors.grey,
                          fontSize: 14,
                        ),

                        suffixIcon: clear ? IconButton(
                            splashRadius: 1,
                            color: isNotValid ? CupertinoColors.systemRed : const Color(0xff4f4e9a),
                            icon: const Icon(CupertinoIcons.clear, size: 18),
                            onPressed: (){
                              setState(() {
                                clear = false;
                                textEditingController.clear();
                                isDisabled = true;
                                isNotValid = false;
                              });
                            }
                        ) : const SizedBox(),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey)
                        ),
                        enabledBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey)
                        ),
                        focusedBorder:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.grey)
                        ),
                      errorBorder: isNotValid ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: CupertinoColors.systemRed)
                      ) : null,
                      focusedErrorBorder: isNotValid ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: CupertinoColors.systemRed)
                      ) : null,
                    ),

                    onChanged: (name) {
                      isNotValid = name.length > 50;
                      clear = textEditingController.text.isNotEmpty;
                      isDisabled = isNotValid ? true : textEditingController.text.isEmpty;
                      setState(() {});
                    },

                    onSubmitted: (name){
                      Navigator.pop(context);
                    },
                  ),
                ),

                // #Dialog actions => Button
                actions: <Widget>[
                  Divider(thickness: 2, color: Colors.grey.shade300),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    alignment: Alignment.center,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width - 40,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      color: isDisabled ? Colors.grey.shade300 : const Color(0xff4f4e9a),
                      splashColor: isDisabled ? Colors.transparent : Colors.white54,
                      textColor: isDisabled ? Colors.black45 : Colors.white,
                      child: const Text('Create', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      onPressed: () {
                        isDisabled ? null : Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              );
            }
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        foregroundColor: const Color(0xff4f4e9a),
        backgroundColor: Colors.white,
        title: const Text('Dialog'),
        centerTitle: true,
      ),
      body: Center(
        child: IconButton(
          splashRadius: 1,
          color: const Color(0xff4f4e9a),
          icon: isPressed ? const Icon(CupertinoIcons.heart_fill, size: 60,) : const Icon(CupertinoIcons.heart, size: 60,),
          onPressed: () {
            setState(() {
              isPressed = !isPressed;
            });
            isPressed ? simpleDialog(context) : null;
          },
        ),
      ),
    );
  }
}