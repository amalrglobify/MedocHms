import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medochms/Provider/ip/ip_provider.dart';
import 'package:medochms/models/ip/ip_listing_model.dart';

import '../Provider/revisit/revisit_Provider.dart';
import '../models/revisit/revisit_list_model.dart';
import '../routes/app_router.gr.dart';


@RoutePage()
class NewIpListingScreen extends ConsumerStatefulWidget {
  const NewIpListingScreen({super.key});

  @override
  ConsumerState<NewIpListingScreen> createState() => _NewIpListingScreenState();
}

class _NewIpListingScreenState extends ConsumerState<NewIpListingScreen> {

  var _search = TextEditingController();

    _fetchIPList() async {
    List<IPListingModel> ipList = await ref.read(ipListProvider).getAllIpListPatients();
    allIpList.clear();
    showedIPList.clear();
    allIpList.addAll(ipList);
    showedIPList.addAll(ipList);
    setState(() {});
    return ipList;
  }

  List<IPListingModel> allIpList = [];
  List<IPListingModel> showedIPList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchIPList();
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
          title: Text("New IP", style: GoogleFonts.poppins(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),),
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
                        showedIPList.clear();
                        showedIPList = allIpList;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 10,),
              Flexible(
                  flex: 25,
                  child: (showedIPList.isNotEmpty)?ListView.builder(
                    itemCount: showedIPList.length,
                    itemBuilder: (BuildContext context, int index) {
                      IPListingModel ipListItem = showedIPList[index];
                      return newIpList(ipListItem, index, showedIPList.length);
                    },
                  ):const Center(child: CircularProgressIndicator())
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget newIpList(IPListingModel ipList, int index, int lastIndex) {
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(ipList.patientName.toString(), style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text("Admitted", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 9),),
                            )),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex:5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "IP No : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: ipList.iPNumber.toString(),
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
                                        text: "Reg : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: "${ipList.oPSerName}/${ipList.oPNumber}",
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
                                        text: "Room No : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: ipList.shiftName.toString(),
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
                                        text: "DOB : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: ipList.dOB.toString(),
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
                                        text: "Gender : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: ipList.gender.toString(),
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
                                        text: "Date : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: ipList.revisitDate.toString(),
                                        style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
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
    showedIPList = allIpList.where(
            (patients) => patients.patientName!.toLowerCase().contains(searchName.toLowerCase())
    ).toList();
  }
}
