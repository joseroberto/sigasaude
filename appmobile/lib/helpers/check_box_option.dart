import 'package:covid_data_app/controller/form_singleton.dart';
import 'package:flutter/material.dart';

class CheckBoxOption extends StatefulWidget {
  final String option;
  const CheckBoxOption({Key? key, required this.option}) : super(key: key);

  @override
  State<CheckBoxOption> createState() => _CheckBoxOptionState();
}

class _CheckBoxOptionState extends State<CheckBoxOption> {
  bool isSelected = false;
  bool isValid = false;

  @override
  void initState() {
    FormSingleton().formProvider.isFormValid.addListener(_handleFormValidityChange);
    FormSingleton().formProvider.validateForm([false, false]);
    super.initState();
  }

  @override
  void dispose() {
    FormSingleton().formProvider.isFormValid.removeListener(_handleFormValidityChange);
    super.dispose();
  }

  void _handleFormValidityChange() {
    setState(() {
      isValid = FormSingleton().formProvider.isFormValid.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    FormSingleton().formProvider.verifyForm([true]);
    return Row(
      children: [
        IconButton(
            onPressed: (() {
              setState(() {
                isSelected = !isSelected;
              });
              FormSingleton().formProvider.validateForm([true]);
              if(isSelected) {
                FormSingleton().formProvider.validateForm([true, false]);
              }else {
                FormSingleton().formProvider.validateForm([false, false]);
              }
            }),
            icon: (isSelected)
                ? const Icon(Icons.check_box)
                : const Icon(Icons.check_box_outline_blank)),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            widget.option,
            style: const TextStyle(
              overflow: TextOverflow.clip,
              fontSize: 16,
              fontFamily: 'Poppins',
            ),
          ),
        )
      ],
    );
  }
}
