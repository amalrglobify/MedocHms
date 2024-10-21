import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medochms/Provider/registration/registration_provider.dart';
import 'package:medochms/models/registration/registration_List_Model.dart';
import '../../routes/app_router.gr.dart';


@RoutePage()
class RegistrationListScreen extends ConsumerStatefulWidget {
  const RegistrationListScreen({super.key});

  @override
  ConsumerState<RegistrationListScreen> createState() => _RegistrationListScreenState();
}

class _RegistrationListScreenState extends ConsumerState<RegistrationListScreen> {

  var _search = TextEditingController();

 getRegistrationList() async {
    List<RegistrationListModel> registrationList = await ref.read(registrationProvider).getAllRegistrationList();
    allRegistrationList.clear();
    showedRegistrationList.clear();
    allRegistrationList.addAll(registrationList);
    showedRegistrationList.addAll(registrationList);
    setState(() {});
    return registrationList;
  }

  List<RegistrationListModel> allRegistrationList = [];
  List<RegistrationListModel> showedRegistrationList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRegistrationList();
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
                      setState(() {
                        searchPatientsByName(v);
                      });
                    }else{
                      setState(() {
                        showedRegistrationList.clear();
                        showedRegistrationList = allRegistrationList;
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 10,),
              Flexible(
                  flex: 25,
                  child: (showedRegistrationList.isNotEmpty)?ListView.builder(
                    itemCount: showedRegistrationList.length,
                    itemBuilder: (BuildContext context, int index) {
                      RegistrationListModel registrationList = showedRegistrationList[index];
                      return newRegistrationList(registrationList, index, showedRegistrationList.length);
                    },
                  ):const Center(child: CircularProgressIndicator())
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget newRegistrationList(RegistrationListModel registrationList, int index, int lastIndex) {
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
                        Text(registrationList.pName.toString(), style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                        Text("Reg : ${registrationList.regNo.toString()}", style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),),
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
                                        text: registrationList.pDOB.toString(),
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
                                        text: registrationList.mobileNo.toString(),
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
                                        text: registrationList.pGender.toString() == "1" ? "Male" : "Female",
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
                                        text: "Reg Date : ",
                                        style: GoogleFonts.poppins(color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 13),
                                      ),
                                      TextSpan(
                                        text: registrationList.regDate.toString(),
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
                            text: registrationList.address1.toString(),
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
    showedRegistrationList = allRegistrationList.where(
            (patients) => patients.pName!.toLowerCase().contains(searchName.toLowerCase())
    ).toList();
  }

}
