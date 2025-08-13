import 'package:flutter/Material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../generated/Colors.dart';
import '../../../generated/ImagesAssets.dart';
import 'AccountContrloller.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  AcountController acountController = Get.put(AcountController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              spacing: 10,
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('${imagespath.human}'),
                ),
                Text(
                  'Nour Mahmoud ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  height: height,
                  child: ListView.builder(

                    itemCount: acountController.cardTitle.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 10,
                        color: AppColors.searchParColor,
                        child: ListTile(
                          onTap: (){},
                          title: Text(
                            acountController.cardTitle[index],
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          leading: Icon(acountController.cardIcon[index],size: 30,color: Colors.white,),
                          trailing: Icon(Icons.arrow_forward_ios,size: 30,color: Colors.white,),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
