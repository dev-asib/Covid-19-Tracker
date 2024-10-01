import 'package:covid_insight/Services/world_covid_states_services.dart';
import 'package:covid_insight/presentation/utils/size_config.dart';
import 'package:covid_insight/presentation/view/country_list_screen.dart';
import 'package:covid_insight/presentation/widgets/covid_data_row.dart';
import 'package:covid_insight/presentation/widgets/world_states_covid_data_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WorldCovidStatesScreen extends StatefulWidget {
  const WorldCovidStatesScreen({super.key});

  @override
  State<WorldCovidStatesScreen> createState() => _WorldCovidStatesScreenState();
}

class _WorldCovidStatesScreenState extends State<WorldCovidStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.06),
              FutureBuilder(
                future: WorldCovidStatesServices.getWorldCovidStatesRecord(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Expanded(
                      child: SpinKitSpinningLines(
                        color: Colors.white,
                        size: 100,
                        controller: _animationController,
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("No Data Available"),
                    );
                  }

                  final covidData = snapshot.data!;

                  final List<Map<String, dynamic>> covidStatesData = [
                    {'title': 'Total Cases', 'value': covidData.cases},
                    {'title': 'Active Cases', 'value': covidData.active},
                    {'title': 'Today Cases', 'value': covidData.todayCases},
                    {
                      'title': 'One Case Per People',
                      'value': covidData.oneCasePerPeople
                    },
                    {
                      'title': 'Cases Per Million',
                      'value': covidData.casesPerOneMillion
                    },
                    {'title': 'Total Deaths', 'value': covidData.deaths},
                    {'title': 'Today Deaths', 'value': covidData.todayDeaths},
                    {
                      'title': 'Deaths Per Million',
                      'value': covidData.deathsPerOneMillion
                    },
                    {
                      'title': 'One Deaths Per People',
                      'value': covidData.oneDeathPerPeople
                    },
                    {'title': 'Recovered', 'value': covidData.recovered},
                    {
                      'title': 'Today Recovered',
                      'value': covidData.todayRecovered
                    },
                    {
                      'title': 'Active Per Million',
                      'value': covidData.activePerOneMillion
                    },
                    {'title': 'Critical Cases', 'value': covidData.critical},
                    {
                      'title': 'Critical Per Million',
                      'value': covidData.criticalPerOneMillion
                    },
                    {'title': 'Tests', 'value': covidData.tests},
                    {
                      'title': 'Tests Per Million',
                      'value': covidData.testsPerOneMillion
                    },
                    {
                      'title': 'One Tests Per People',
                      'value': covidData.oneTestPerPeople
                    },
                    {'title': 'Population', 'value': covidData.population},
                    {
                      'title': 'Affected Countries',
                      'value': covidData.affectedCountries
                    },
                  ];

                  return Expanded(
                    child: Column(
                      children: [
                        WorldStatesCovidDataChart(
                          totalCases: covidData.cases?.toDouble() ?? 0.0,
                          totalDeaths: covidData.deaths?.toDouble() ?? 0.0,
                          totalRecovered: covidData.recovered?.toDouble() ?? 0.0,
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: _buildCovidDataList(covidStatesData),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _onTapTrackCountriesButton,
                          child: const Text("Track Countries"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapTrackCountriesButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CountryListScreen(),
      ),
    );
  }

  Widget _buildCovidDataList(List<Map<String, dynamic>> covidStatesData) {
    return ColoredBox(
      color: Colors.grey.shade900,
      child: ListView.builder(
        itemCount: covidStatesData.length,
        itemBuilder: (context, index) {
          return CovidDataRow(
            title: covidStatesData[index]['title'],
            value: covidStatesData[index]['value'].toString(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
