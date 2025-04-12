import 'package:fip9/configuration/current_session.dart';
import 'package:fip9/login/login_screen.dart';
import 'package:fip9/tabs/views/models/intro_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class HomeTab extends StatefulWidget {
  TabController? tabController;

  HomeTab({super.key, this.tabController});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<IntroModel> intros = [];

  @override
  void initState() {
    _getIntroDataFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Tab'),
            if (CurrentSession().apiLoginModel != null)
              Text('Welcome ${CurrentSession().apiLoginModel!.user.fullName}'),
            Text('${CurrentSession().apiLoginModel!.user.email}'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => LoginScreen()));

                  return;
                  if (widget.tabController != null) {
                    widget.tabController!.animateTo(2,
                        curve: Curves.easeInOut,
                        duration: Duration(seconds: 2));
                  }
                },
                child: Text('move')),
            if (intros.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.red, width: 2)),
                      padding: EdgeInsets.all(12),
                      child: Column(children: [
                        SizedBox(
                          height: 100,
                          child: Lottie.network(intros[index].imageUrl),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(intros[index].title),
                        Text(intros[index].description),
                      ]),
                    );
                  },
                  itemCount: intros.length,
                  shrinkWrap: true,
                ),
              )
          ],
        ),
      ),
    );
  }

  void _getIntroDataFromApi() async {
    var url = Uri.parse('http://173.212.197.212:8888/api/v1/landing-page');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });
    if (response.statusCode >= 200 && response.statusCode < 300) {
      IntroResponse introResponse = IntroResponse.fromRawJson(response.body);
      if (introResponse.success) {
        setState(() {
          intros = introResponse.result;
        });
      }
    }
  }
}

// getx
// design pattern
// google map
// project // 9%
// upload to store  1%
