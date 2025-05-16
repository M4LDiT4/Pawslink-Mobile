
import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/widgets/text_fields/generic_text_field/generic_text_field.dart';

class GenericTextfieldBuilder {
  TextEditingController? _controller;
  String? _hintText;
  String? _labelText;
  String? _errorText;
  bool _obscureText = false;
  TextInputType _keyboardType = TextInputType.text;
  int? _maxLines = 1;
  int? _maxLength;
  bool _enabled = true;
  String? _suffixText;
  EdgeInsetsGeometry _padding = const EdgeInsets.all(8);
  Function(String)? _onChanged;
  FormFieldValidator<String>? _validator;
  bool _isRequired = false;
  String? _errMessage;
  bool _hasClearButton = false;

  //default constructor
  GenericTextfieldBuilder();

  //creates a simple text input for a form
  //assumes validation and value retrieval in the form
  factory GenericTextfieldBuilder.formField({
    required String label,
    String? errorMessage,
    bool isRequired = false
  }){
    return GenericTextfieldBuilder()
      .._labelText = label
      .._errMessage = errorMessage
      .._isRequired = isRequired;
  }

  //standalone textfield
  factory GenericTextfieldBuilder.independentTextField({
    required String label,
    required TextEditingController controller,
    String? errorMessage,
    bool isRequired = false,
  }){
    return GenericTextfieldBuilder()
      .._labelText = label
      .._controller = controller
      .._errorText = errorMessage
      .._isRequired = isRequired;
  }

  GenericTextfieldBuilder controller(TextEditingController controller){
    _controller = controller;
    return this;
  }

  GenericTextfieldBuilder label(String label){
    _labelText = label;
    return this;
  }

  GenericTextfieldBuilder error(String error){
    _errorText = error;
    return this;
  }

  GenericTextfieldBuilder obscure (bool flag){
    _obscureText = flag;
    return this;
  }

  GenericTextfieldBuilder keyboardType(TextInputType type){
    _keyboardType = type;
    return this;
  }

  GenericTextfieldBuilder maxLines (int lines){
    _maxLines = lines;
    return this;
  }

  GenericTextfieldBuilder maxLength(int length){
    _maxLength = length;
    return this;
  }

  GenericTextfieldBuilder enable(bool flag){
    _enabled = flag;
    return this;
  }

  GenericTextfieldBuilder suffixString(String suffix){
    _suffixText = suffix;
    return this;
  }

  GenericTextfieldBuilder onChanged(Function(String) callback){
    _onChanged = callback;
    return this;
  }

  GenericTextfieldBuilder validator(FormFieldValidator<String> v){
    _validator = v;
    return this;
  }

  GenericTextfieldBuilder clearButton(bool flag){
    _hasClearButton = flag;
    return this;
  }

  GenericTextfieldBuilder required({
    String? message
  }){
    _isRequired = true;
    _errMessage = message;
    return this;
  }

  GenericTextfieldBuilder padding(double padding){
    _padding = EdgeInsets.all(padding);
    return this;
  }
  GenericTextField build(){
    return GenericTextField(
      labelText: _labelText,
      controller: _controller,
      hintText: _hintText,
      errorText: _errorText,
      obscureText: _obscureText,
      keyboardType: _keyboardType,
      maxLines: _maxLines,
      enabled: _enabled,
      suffixText: _suffixText,
      onChanged: _onChanged,
      padding: _padding,
      validator: _validator,
      isRequired: _isRequired,
      errMessage: _errMessage,
      hasClearButton: _hasClearButton,
    );
  }
}