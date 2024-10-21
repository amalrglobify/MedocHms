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

  getRevisitEntriesList() async {
    List<RevisitListingModel> revisitEntries = await ref.read(revisitListProvider).getAllRevisitEntriesList();
    allRevisitEntries.clear();
    showedRevisitEntries.clear();
    allRevisitEntries.addAll(revisitEntries);
    showedRevisitEntries.addAll(revisitEntries);
    setState(() {});
    return revisitEntries;
  }

  List<RevisitListingModel> allRevisitEntries = [];
  List<RevisitListingModel> showedRevisitEntries = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   getRevisitEntriesList();
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
                      setState(() {
                        searchPatientsByName(v);
                      });
                    }else{
                      setState(() {
                        showedRevisitEntries.clear();
                        showedRevisitEntries = allRevisitEntries;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 10,),
              Flexible(
                  flex: 25,
                  child: (showedRevisitEntries.isNotEmpty)?ListView.builder(
                    itemCount: showedRevisitEntries.length,
                    itemBuilder: (BuildContext context, int index) {
                      RevisitListingModel revisitEntries = showedRevisitEntries[index];
                      return revisitList(revisitEntries, index, showedRevisitEntries.length);
                    },
                  ):const Center(child: CircularProgressIndicator())
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget revisitList(RevisitListingModel revisitList, int index, int lastIndex) {
    final GlobalKey widgetKey = GlobalKey();
    return Padding(
      padding: EdgeInsets.only(bottom: index != lastIndex-1 ? 8.0 : 10.0),
      child: Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 10.0, left: 0.0, right: 0.0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(revisitList.patientName.toString(), style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                        Text("Revisit Id : ${revisitList.revId.toString()}", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),),
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
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "DOB : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: revisitList.dOB.toString(),
                                        style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4,),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Mobile No : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: revisitList.contact.toString(),
                                        style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Flexible(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Gender : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: revisitList.gender.toString(),
                                        style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4,),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Revisit Date : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: revisitList.revisitDate.toString(),
                                        style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    const SizedBox(height: 4,),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Address : ",
                            style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                          ),
                          TextSpan(
                            text: revisitList.add1.toString(),
                            style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }

  void searchPatientsByName(String searchName) {
    showedRevisitEntries = allRevisitEntries.where(
            (patients) => patients.patientName!.toLowerCase().contains(searchName.toLowerCase())
    ).toList();
  }

}


