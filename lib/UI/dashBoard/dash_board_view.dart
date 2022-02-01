import 'package:NewsApp/models/news_response.dart';
import 'package:NewsApp/widgets/tools/model_future_builder.dart';
import 'package:NewsApp/widgets/tools/screen_size.dart';
import 'package:NewsApp/widgets/tools/view_model_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard_viewmodel.dart';

class DashBoardView extends StatelessWidget {

   DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return ViewModelBuilder<DashBoardViewModel>.reactive(
      onModelReady: (model) => model.dashBoard(),
      builder: (context, model, child) =>
         Container(
          height: ScreenSize.height,
          color: Colors.white,
          child: Column(
            children: [
              TextButton(onPressed: (){
                model.signInWithGoogle();
              }, child:Text("click me!")),
              ModelFutureListBuilder<Articles>(
                busy: model.isBusy,
                data: model.articles,
                loading: const Center(
                  child: CircularProgressIndicator(),
                ),
                builder: (context, data, child) => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].title ?? "No Title",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                data[index].author ?? "",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black12,
                                image: data[index].urlToImage != null
                                    ? DecorationImage(
                                        image: NetworkImage(
                                          data[index].urlToImage!,
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                data[index].description ?? "",
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

              ),
            ],
          ),
        ),
      viewModelBuilder: () =>
          DashBoardViewModel(apiService: Provider.of(context)),
    );
  }
}
