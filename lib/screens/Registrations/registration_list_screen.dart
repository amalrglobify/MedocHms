import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Provider/revisit/revisit_Provider.dart';
import '../../models/revisit/revisit_list_model.dart';
import '../../routes/app_router.gr.dart';


@RoutePage()
class RegistrationListScreen extends ConsumerStatefulWidget {
  const RegistrationListScreen({super.key});

  @override
  ConsumerState<RegistrationListScreen> createState() => _RegistrationListScreenState();
}

class _RegistrationListScreenState extends ConsumerState<RegistrationListScreen> {

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
          title: Text("Registrations", style: GoogleFonts.poppins(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),),
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
                              return newRegistrationList(product, index, showedProducts.length);
                            },
                          );
                        } else {
                          return const Center(child: Text("No data available"));
                        }
                      } else {
                        return const Center(child: CircularProgressIndicator());
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

  Widget newRegistrationList(AllProducts allProduct, int index, int lastIndex) {
    final GlobalKey widgetKey = GlobalKey();
    return Padding(
      padding: EdgeInsets.only(bottom: index != lastIndex-1 ? 8.0 : 75.0),
      child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8), // Optional border radius
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Patient Name", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                          Text("Reg : WH - 3", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("DOB : 19/09/1998", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),),
                                  Text("Mobile No : 1234567890", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),),
                                ],
                              )),
                          Flexible(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("Gender : Female", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),),
                                  Text("Date : 19/09/1998", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 3,),
                      Text("Address : Technopark Road, Amstor Building 2nd floor, Kazhakoottam, Trivandrum", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),),
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }

}
