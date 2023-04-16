import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/admin/screens/all_product/provider/admin_provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';

class Body extends StatefulWidget {
  final Product product;
  bool isUpdate;

  Body({Key? key, required this.product, required this.isUpdate})
      : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String? title;
  String? description;
  String? readMore;
  String? category;
  double? price;
  num? rating;
  String? image;

  bool isPop = false;

  List<String?> errors = [];

  @override
  void initState() {
    image = widget.product.image;
    super.initState();
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AdminProvider>(context);
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInImage.assetNetwork(
            height: 100,
              placeholder: 'assets/icons/Gift Icon.svg', image: image!),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: _globalKey,
                child: Column(
                  children: [
                    Text(
                      'Title:',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextFormField(
                      onSaved: (value) => title = value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: 'Title is empty');
                          return "";
                        }
                        return null;
                      },
                      enabled: widget.isUpdate,
                      initialValue: widget.product.title,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Image:',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextFormField(
                      onChanged: ((value) => setState(() {
                        image = value;
                      })),
                      onSaved: (value) => image = value??'',
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: 'Title is empty');
                          return "";
                        }
                        return null;
                      },
                      enabled: widget.isUpdate,
                      initialValue: widget.product.image,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Product id:',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextFormField(
                      enabled: false,
                      initialValue: widget.product.id,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Product price:',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: 'price is empty');
                          return "";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      enabled: widget.isUpdate,
                      initialValue: widget.product.price.toString(),
                      onSaved: (value) => price = double.tryParse(value ?? ''),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Product rating:',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: 'rating is empty');
                          return "";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      enabled: widget.isUpdate,
                      initialValue: widget.product.rating.toString(),
                      onSaved: (value) => rating = num.tryParse(value ?? ''),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Description:',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: 'description is empty');
                          return "";
                        }
                        return null;
                      },
                      onSaved: (value) => description = value,
                      enabled: widget.isUpdate,
                      initialValue: widget.product.description,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Read more:',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: 'read more is empty');
                          return "";
                        }
                        return null;
                      },
                      onSaved: (value) => readMore = value,
                      enabled: widget.isUpdate,
                      maxLines: null,
                      initialValue: widget.product.readMore,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Category:',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    DropdownButtonFormField<String>(
                      value: widget.product.category,
                      validator: (value) {
                        if (value!.isEmpty) {
                          addError(error: 'category is empty');
                          return "";
                        }
                        return null;
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text('Smart Phone'),
                          value: 'SmartPhones',
                        ),
                        DropdownMenuItem(
                          child: Text('Fashion'),
                          value: 'Fashions',
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {}
                      },
                      onSaved: (value) {
                        category = value;
                      },
                    )
                  ],
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                checkColor: Colors.white,
                value: isPop,
                onChanged: (bool? value) {
                  print(isPop);
                  setState(() {
                    isPop = value!;
                  });
                },
              ),
              Text(
                'Popular?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              )
            ],
          ),
          widget.isUpdate
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: DefaultButton(
                    text: 'Update',
                    press: () async {
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                        await _provider.updateProduct(
                            widget.product.id,
                            title!,
                            description!,
                            readMore!,
                            price!,
                            category!,
                            isPop,
                            rating!);
                      } else {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                  title: Text('ERROR'),
                                  content: Column(
                                    children: errors
                                        .map((e) => Text(e.toString()))
                                        .toList(),
                                  ));
                            });
                      }
                    },
                  ),
                )
              : Container()
        ],
      ),
    ));
  }
}
