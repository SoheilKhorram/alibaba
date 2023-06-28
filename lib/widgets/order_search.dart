import 'package:alibaba/widgets/custom_name_input.dart';
import 'package:alibaba/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class OrderSearch extends StatefulWidget {
  const OrderSearch({Key? key}) : super(key: key);

  @override
  _OrderSearchState createState() => _OrderSearchState();
}

class _OrderSearchState extends State<OrderSearch> {
  Jalali? fromDate;
  Jalali? toDate;

  void selectFromDate(BuildContext context, Jalali? initialDate) async {
    final Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: initialDate ?? Jalali.now(),
      firstDate: Jalali(1300),
      lastDate: Jalali(1500),
    );
    if (picked != null) {
      setState(() {
        fromDate = picked;
      });
    }
  }

  void selectToDate(BuildContext context, Jalali? initialDate) async {
    final Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: initialDate ?? Jalali.now(),
      firstDate: Jalali(1390),
      lastDate: Jalali(1450),
    );
    if (picked != null) {
      setState(() {
        toDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                    text: "جستجوی سفارش ",
                    style: TextStyle(
                      fontFamily: 'Vazir',
                      color: Color(0xff4b5259),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                WidgetSpan(
                  child: Icon(
                    Icons.search_rounded,
                    size: 25,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 16),
            height: 1,
            color: Colors.orange,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: RichText(
              text: const TextSpan(
                children: [
                  WidgetSpan(
                    child: Icon(
                      Icons.warning_amber_rounded,
                      size: 20,
                      color: Colors.orange,
                    ),
                  ),
                  TextSpan(
                      text:
                          " برای جستجو در لیست سفرهای من پر کردن حداقل یک فیلد کافیست",
                      style: TextStyle(
                        fontFamily: 'Vazir',
                        color: Color(0xff4b5259),
                        fontSize: 15,
                      )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text('شماره سفارش', style: TextStyle(fontFamily: 'Vazir')),
          const SizedBox(height: 8),
          const CustomNameInput(text: ''),
          const SizedBox(height: 16),
          const Text('تاریخ', style: TextStyle(fontFamily: 'Vazir')),
          const SizedBox(height: 8),
          Row(
            children: const [
              Flexible(child: CustomNameInput(text: 'تا')),
              SizedBox(width: 15),
              Flexible(child: CustomNameInput(text: 'از')),
            ],
          ),
          const SizedBox(height: 16),
          const SubmitButton('جستجو')
        ],
      ),
    );
  }
}
