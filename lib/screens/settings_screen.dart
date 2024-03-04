// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import '../Data/data_exchange_rate.dart';
import '../Data/data_currency.dart';
import 'package:expenser/Data/dropdownvalue_data.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with AutomaticKeepAliveClientMixin {
  String UserCurrency = "SAR";
  String FinalCurrency = "SAR";
  @override
  bool get wantKeepAlive => true; //<== add this line

  FocusNode searchFocusNode = FocusNode();

  FocusNode textFieldFocusNode = FocusNode();

  late SingleValueDropDownController _cnt;

  late MultiValueDropDownController _cntMulti;

  TextEditingController UserCurrencyInput = TextEditingController();
  TextEditingController FinalCurrencyOutput = TextEditingController();

  @override
  void initState() {
    _cnt = SingleValueDropDownController();
    _cntMulti = MultiValueDropDownController();
    super.initState();
  }

  @override
  void dispose() {
    _cnt.dispose();
    _cntMulti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: false,
          title: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 5, top: 10),
              child: Text(
                "محول العملات",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Rudwa"),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: const Color(0xffFAFAFA),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "المبلغ",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontFamily: "Rudwa"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SizedBox(
                      width: 120,
                      child: DropDownTextField(
                        textFieldDecoration: InputDecoration(
                            hintText: "🇸🇦 SAR",
                            filled: true,
                            fillColor: Color(0xff5d74ef).withOpacity(0.25),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12)))),
                        clearOption: false,
                        textFieldFocusNode: textFieldFocusNode,
                        searchFocusNode: searchFocusNode,
                        // searchAutofocus: true,
                        dropDownItemCount: 8,
                        searchShowCursor: false,

                        searchKeyboardType: TextInputType.text,
                        dropDownList: List.generate(
                            DropData().allDropData.length,
                            (index) => DropDownValueModel(
                                name: DropData().allDropData[index][0],
                                value: DropData().allDropData[index][1])),
                        onChanged: (val) {
                          setState(() {
                            UserCurrency = val.value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                      fontSize: 19, color: Colors.black87, fontFamily: "Rudwa"),
                  controller: UserCurrencyInput,
                  onChanged: (value) {
                    setState(() {
                      UserCurrencyInput.text = value;
                    });
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 19,
                          color: Color(0xffA9A9A9),
                          fontFamily: "Rudwa"),
                      hintText: "ادخل المبلغ",
                      hintTextDirection: TextDirection.rtl,
                      filled: true,
                      fillColor: Color(0xffe8e8e8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Divider(
                  indent: 12,
                  endIndent: width * 0.07,
                  thickness: 1.5,
                )),
                Icon(
                  Icons.currency_exchange,
                  color: Color(0xffA9A9A9),
                ),
                Expanded(
                    child: Divider(
                  indent: width * 0.07,
                  endIndent: 12,
                  thickness: 1.5,
                )),
              ]),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "تم التحويل الى",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                          fontFamily: "Rudwa"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SizedBox(
                      width: 120,
                      child: DropDownTextField(
                        textFieldDecoration: InputDecoration(
                            hintText: "🇸🇦 SAR",
                            filled: true,
                            fillColor: Color(0xff5d74ef).withOpacity(0.25),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)))),
                        clearOption: false,
                        textFieldFocusNode: textFieldFocusNode,
                        searchFocusNode: searchFocusNode,
                        // searchAutofocus: true,
                        dropDownItemCount: 8,
                        searchShowCursor: false,
                        searchKeyboardType: TextInputType.text,
                        dropDownList: List.generate(
                            DropData().allDropData.length,
                            (index) => DropDownValueModel(
                                name: DropData().allDropData[index][0],
                                value: DropData().allDropData[index][1])),
                        onChanged: (val) {
                          setState(() {
                            FinalCurrency = val.value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  style: TextStyle(
                      fontSize: 19, color: Colors.black87, fontFamily: "Rudwa"),
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  controller: FinalCurrencyOutput,
                  onChanged: (value) {
                    setState(() {
                      FinalCurrencyOutput.text = value;
                    });
                  },
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontSize: 19,
                          color: Color(0xffA9A9A9),
                          fontFamily: "Rudwa"),
                      hintText: "المبلغ المحول",
                      hintTextDirection: TextDirection.rtl,
                      filled: true,
                      fillColor: Color(0xffe8e8e8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (UserCurrency == 'SAR') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.SAR["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'USD') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.USD["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'KWD') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.KWD["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'BHD') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.BHD["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'GBP') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.GBP["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'EUR') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.EUR["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'JPY') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.JPY["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'RUB') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.RUB["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'AED') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.AED["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'ARS') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.ARS["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'TRY') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.TRY["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'IQD') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.IQD["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'JOD') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.JOD["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'OMR') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.OMR["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'QAR') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.QAR["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'YER') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.YER["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'EGP') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.EGP["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  } else if (UserCurrency == 'IDR') {
                    double UserCurrencyINT =
                        double.parse(UserCurrencyInput.text);
                    FinalCurrencyOutput.text =
                        "${(UserCurrencyINT * ExchangeRate.IDR["$FinalCurrency"]).toStringAsFixed(2)} ${Currencys["$FinalCurrency"]}";
                  }
                },
                child: Container(
                  height: height * 0.07,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      color: const Color(0xff5d74ef).withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      "تحويل",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black87,
                          fontFamily: "Rudwa"),
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "اخر تحديث في 2023",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 19,
                          color: Colors.grey,
                          fontFamily: "Rudwa"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
