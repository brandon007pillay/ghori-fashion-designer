import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gfd_official/Login_data/gSignin_data.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

// ignore: camel_case_types
class expert_payment extends StatefulWidget {



  @override
  _expert_payment_State createState() => _expert_payment_State();
}

// ignore: camel_case_types
class _expert_payment_State extends State<expert_payment> {

  Razorpay _razorpay;
  num _paymentamount = 0;
  // ignore: non_constant_identifier_names
  double _1yearwidth = 300;
  // ignore: non_constant_identifier_names
  double _1yearheight = 110;
  double limitedheight = 200;
  double limitedwidth = 300;
  double yearborderwidth = 1;
  double limitedborder = 1;
  bool _yearchecked = true;
  bool limitedchecked = false;

  @override
  void initState() {
    super.initState();
    _razorpay =Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async{
       var option= {
         "key": "rzp_test_rkbMfLcwVZtwyk",
         'amount': _paymentamount*100,
        'name': 'ghori fashion designer',
        'description': 'expert bane',
        'prefill' : {
        'contact' : '1234567890',
        'email' : 'anything@gmail.com',
      },
        'external' : {
        'wallet' : ['paytm']
      }
    };
    try{
      _razorpay.open(option);
    }
    catch(e){
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "SUCCESS: "+ response.paymentId);
    userRef.update({'role': 'fullexpert'}).then((value) => print('Done!'));
  }

  void _handlePaymentError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "Error: "+ response.code.toString() + ' - ' + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet: "+ response.walletName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pay Here',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        backgroundColor: Colors.grey[200],
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: <Widget>[
          Row(
            children: [
              Text(
                'Secure and fast',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              ),
              SizedBox(
                width: 1,
              ),
              IconButton(
                icon: Icon(
                  Icons.https,
                  color: Colors.green,
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              Row(
                children: [
                  expimage(),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Expert bane expert \n course ke sath',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _paymentamount = 1500;
                    yearborderwidth = 3;
                    limitedborder = 1;
                    _yearchecked = true;
                    limitedchecked = false;
                  });
                },
                child: AnimatedContainer(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green[300],
                        width: yearborderwidth,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: _1yearheight,
                        width: _1yearwidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: ListView(
                            children: [
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Chip(
                                    label: Text(
                                      '1 year full access',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green[400],
                                    avatar: CircleAvatar(
                                      backgroundColor: Colors.green[300],
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Chip(
                                    backgroundColor: Colors.green[400],
                                    label: Text(
                                      'Best choice',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    avatar: CircleAvatar(
                                      backgroundColor: Colors.green[300],
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: _yearchecked,
                                      onChanged: (bool isChecked) {
                                        setState(() {
                                          _yearchecked = isChecked;
                                          _paymentamount = 1500;
                                          limitedchecked = false;
                                          yearborderwidth = 3;
                                          limitedborder = 1;
                                        });
                                      }
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    duration: Duration(milliseconds: 100)),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    yearborderwidth = 1;
                    _paymentamount = 500;
                    limitedborder = 3;
                    limitedchecked = true;
                    _yearchecked = false;
                  });
                },
                child: AnimatedContainer(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green[300],
                        width: limitedborder,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: _1yearheight,
                        width: _1yearwidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: ListView(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Colors.green,
                                      value: limitedchecked,
                                      onChanged: (bool isChecked) {
                                        setState(() {
                                          limitedchecked = isChecked;
                                          _paymentamount = 500;
                                          limitedchecked = false;
                                          limitedborder = 3;
                                          yearborderwidth = 1;
                                        });
                                      }
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    duration: Duration(milliseconds: 100)),
              ),
              RaisedButton(
                onPressed: () {
                  openCheckout();
                },
                hoverElevation: 20,
                splashColor: Colors.blue,
                color: Colors.green[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Expert Bane",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget expimage() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://i.ytimg.com/vi/bSywfMPuwaw/maxresdefault.jpg',
              fit: BoxFit.cover,
              height: 60,
              width: 100,
            )),
      ],
    );
  }
}
