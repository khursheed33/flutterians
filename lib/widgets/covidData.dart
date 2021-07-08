import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterians/constants/covidConstants.dart';
import 'package:flutterians/models/covidGlobalData.dart';
import 'package:http/http.dart' as http;

class FlutteriansCovidData extends StatefulWidget {
  const FlutteriansCovidData({Key? key}) : super(key: key);

  @override
  _FlutteriansCovidDataState createState() => _FlutteriansCovidDataState();
}

class _FlutteriansCovidDataState extends State<FlutteriansCovidData> {
  bool _isInit = true;
  bool _isLoading = false;
  late CovidGlobalData fetchedGlobalData;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      try {
        print("Print before await");
        http.Response response = await http.get(Uri.parse(globalData));
        final globalJson = jsonDecode(response.body);
        if (globalJson != null) {
          fetchedGlobalData = CovidGlobalData(
            active: globalJson['active'] as int,
            activePerOneMillion: globalJson['activePerOneMillion'] as double,
            affectedCountries: globalJson['affectedCountries'],
            cases: globalJson['cases'],
            casesPerOneMillion: globalJson['casesPerOneMillion'],
            critical: globalJson['critical'],
            criticalPerOneMillion: globalJson['criticalPerOneMillion'],
            deaths: globalJson['deaths'],
            deathsPerOneMillion: globalJson['deathsPerOneMillion'],
            oneCasePerPeople: globalJson['oneCasePerPeople'],
            oneDeathPerPeople: globalJson['oneDeathPerPeople'],
            oneTestPerPeople: globalJson['oneTestPerPeople'],
            population: globalJson['population'],
            recovered: globalJson['recovered'],
            recoveredPerOneMillion: globalJson['recoveredPerOneMillion'],
            tests: globalJson['tests'],
            testsPerOneMillion: globalJson['testsPerOneMillion'],
            todayCases: globalJson['todayCases'],
            todayDeaths: globalJson['todayDeaths'],
            todayRecovered: globalJson['todayRecovered'],
            undefined: globalJson['undefined'],
          );
          print("Print after await $globalJson");
          setState(() {
            _isLoading = false;
          });
        }
      } catch (err) {
        print("Fetch-Error: $err");
      }
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.blue[900],
      child: SafeArea(
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  cardBuilder("cases", fetchedGlobalData),
                ],
              ),
      ),
    );
  }

  Widget cardBuilder(String title, CovidGlobalData covidData) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Total".toUpperCase(),
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      covidData.cases.toString(),
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: 2,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  color: Colors.grey[300],
                ),
                Column(
                  children: [
                    Text(
                      "Today".toUpperCase(),
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "${covidData.todayCases}",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.4,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
