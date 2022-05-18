import 'package:firestore_search/firestore_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/details/provider/detail_product_provider.dart';
import 'package:shop_app/screens/search/components/search_header.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<DetailProductProvider>(context);
    Widget _buildList() {
      return FirestoreSearchResults.builder(
        tag: 'all',
        firestoreCollectionName: 'Products',
        searchBy: 'title',
        initialBody: const Center(
          child: Text('enter product\'s name'),
        ),
        dataListFromSnapshot: (querySnapshot) {
          return querySnapshot.docs.map((snapshot) {
            final Map<String, dynamic> data =
                snapshot.data() as Map<String, dynamic>;

            return Product(
                title: data['title'],
                readMore: data['readMore'],
                image: data['image'],
                id: data['id'],
                description: data['description'],
                price: data['price'],
                isPopular: data['isPopular'],
                isFavourite: data['isFavourite'],
                rating: data['rating']);
          }).toList();
        },
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Product>? dataList = snapshot.data;
            if (dataList==null||dataList.isEmpty) {
              return const Center(
                child: Text('No product found'),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final Product data = dataList[index];

                  return ListTile(
                    title: Text(
                      data.title,
                      style: TextStyle(color: Colors.black),
                      maxLines: 2,
                    ),
                    trailing: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        if(data.isFavourite == true){
                          _provider.unLikeProduct(data.id);
                        } else {
                          _provider.likeProduct(data.id);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        height: getProportionateScreenWidth(28),
                        width: getProportionateScreenWidth(28),
                        decoration: BoxDecoration(
                          color: data.isFavourite
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: data.isFavourite
                              ? Color(0xFFFF4848)
                              : Color(0xFFDBDEE4),
                        ),
                      ),
                    ),
                    subtitle: Text(
                      "\$${data.price}",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ),
                    leading: Image.network(data.image),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: kSecondaryColor),
                        borderRadius: BorderRadius.circular(20)),
                    onTap: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName,
                          arguments: ProductDetailsArguments(product: data));
                    },
                  );
                });
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text('No Results Returned'),
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            _buildList()
          ],
        ),
      ),
    );
  }
}
