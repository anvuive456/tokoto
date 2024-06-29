import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/check_out/provider/check_out_provider.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<CheckOutProvider>(context);
    return SafeArea(
        child: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: BouncingScrollPhysics(),
      children: [
        Text(
          'Please check your address and phone number before pay',
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        FutureBuilder(
          future: _provider.init(),
          builder: (context, snapshot) => Form(
              child: Column(
            children: [
              TextFormField(
                // decoration: InputDecoration(
                //   prefixIcon: SvgPicture.asset('assets/Phone.svg')
                // ),
                controller: _provider.phone,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                // decoration: InputDecoration(
                //     prefixIcon: SvgPicture.asset('assets/Location point.svg')
                // ),
                controller: _provider.address,
              ),
            ],
          )),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
                'Receive time: ${DateFormat("dd/MM/yyyy").format(_provider.receiveTime)}'),
            TextButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      minTime: DateTime(
                          2022, DateTime.now().month, DateTime.now().day + 3),
                      currentTime: _provider.receiveTime, onConfirm: (date) {
                    setState(() {
                      _provider.setReceiveTime(date);
                    });
                  });
                },
                child: Text('Choose receive time'))
          ],
        )
      ],
    ));
  }
}
