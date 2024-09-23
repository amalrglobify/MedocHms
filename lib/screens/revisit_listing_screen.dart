import "package:auto_route/annotations.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:google_fonts/google_fonts.dart";
import "package:iconsax/iconsax.dart";
import "package:medochms/Provider/revisit/revisit_Provider.dart";
import "package:medochms/routes/app_router.gr.dart";

import "../models/revisit/revisit_list_model.dart";


@RoutePage()
class RevisitListingScreen extends ConsumerStatefulWidget {
  const RevisitListingScreen({super.key});

  @override
  ConsumerState<RevisitListingScreen> createState() => _RevisitListingScreenState();
}

class _RevisitListingScreenState extends ConsumerState<RevisitListingScreen> {

  var _search = TextEditingController();

  Future<List<AllProducts>> _fetchProducts() async {
    List<AllProducts> products = await ref.read(revisitListProvider).getAllRevisitEntriesList();
    allProducts.clear();
    showedProducts.clear();
    allProducts.addAll(products);
    showedProducts.addAll(products);
    return products;
  }


  late Future<List<AllProducts>> _productsFuture;
  List<AllProducts> allProducts = [];
  List<AllProducts> showedProducts = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productsFuture = _fetchProducts();
  }

  Future<bool> _onWillPop() async {
    await context.pushRoute(const DashboardRoute());
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 30,
          forceMaterialTransparency: true,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          leading: GestureDetector(
            onTap: (){
              context.pushRoute(DashboardRoute());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Icon(Icons.arrow_back_ios, color: Colors.black,),
            ),
          ),
          centerTitle: true,
          title: Text("Revisit Entries", style: GoogleFonts.poppins(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                child: TextFormField(
                  controller: _search,
                  decoration: const InputDecoration(
                      hintText: 'Search Patients',
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                      prefixIconConstraints: BoxConstraints(minWidth: 50),
                      suffixIcon: Icon(Icons.menu)
                  ),
                  onChanged: (v){
                    if(v.isNotEmpty){
                      // setState(() {
                      //   searchProductByName(v);
                      // });
                    }else{
                      // setState(() {
                      //   showedProducts.clear();
                      //   showedProducts = allProducts;
                      // });
                    }
                  },
                ),
              ),
              SizedBox(height: 10,),
              Flexible(
                  flex: 25,
                  child: FutureBuilder<List<AllProducts>>(
                    future: _productsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(child: Text(snapshot.error.toString()));
                        } else if (snapshot.hasData) {
                          List<AllProducts>? products = snapshot.data;
                          if (products == null || products.isEmpty) {
                            return const Center(child: Text("No data available"));
                          }
                          return ListView.builder(
                            itemCount: showedProducts.length,
                            itemBuilder: (BuildContext context, int index) {
                              AllProducts product = showedProducts[index];
                              return productListForOrder(product, index, showedProducts.length);
                            },
                          );
                        } else {
                          return const Center(child: Text("No data available"));
                        }
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget productListForOrder(AllProducts allProduct, int index, int lastIndex) {
    final GlobalKey widgetKey = GlobalKey();
    return Padding(
      padding: EdgeInsets.only(bottom: index != lastIndex-1 ? 8.0 : 75.0),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        initiallyExpanded: false,
        maintainState: true,
        childrenPadding: EdgeInsets.zero,
        backgroundColor: Colors.grey.shade50,
        collapsedBackgroundColor: Colors.grey.shade50,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: Container(
          height: MediaQuery.of(context).size.height * 0.09,
          width: double.maxFinite,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            // color: Color(0XFFF1F5FF),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey.shade300,
            //     spreadRadius: 1,
            //     blurRadius: 5,
            //     offset: Offset(0, 3),
            //   ),
            // ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                    key: widgetKey,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: CircleAvatar(
                      backgroundColor: Color(0XFF333E9F),
                      child: Icon(Iconsax.user, color: Colors.white,),
                    )),
              ),
              const SizedBox(width: 10,),
              Flexible(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                         "Patient Name" ?? "",
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "Age : 30" ?? "",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          'Gender : Male',
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,)
            ],
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0XFF77209F),
                    borderRadius: BorderRadius.circular(8), // Optional border radius
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          flex:2,
                          child: Center(child: Text("SlNo#", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),))),
                      Flexible(
                          flex: 3,
                          child: Center(child: Text("OP ID", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),))),
                      Flexible(
                          flex: 4,
                          child: Center(child: Text("Date", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),))),
                      Flexible(
                          flex: 5,
                          child: Center(child: Text("Consultant", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 13),))),
                    ],
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, index){
                      return Container(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 2,
                                  child: Center(child: Text("12", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),))),
                              Flexible(
                                  flex: 3,
                                  child: Center(child: Text("58452", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),))),
                              Flexible(
                                  flex: 4,
                                  child: Center(child: Text("19/09/2024", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),))),
                              Flexible(
                                  flex: 5,
                                  child: Center(child: Text("Dr. M Mukesh", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12),))),
                            ],
                          )
                      );
                    }
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}


