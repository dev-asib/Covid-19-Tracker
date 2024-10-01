import 'package:covid_insight/Services/world_covid_states_services.dart';
import 'package:covid_insight/presentation/view/country_covid_details_screen.dart';
import 'package:covid_insight/presentation/widgets/country_list_shimmer_effect.dart';
import 'package:flutter/material.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({super.key});

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWithBackButton(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCountrySearchFormField(context),
            const SizedBox(height: 24),
            Expanded(
              child: FutureBuilder(
                future: WorldCovidStatesServices.getCountryList(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CountryListShimmerEffect();
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No Data Available'),
                    );
                  }

                  return _buildCountryList(snapshot);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryList(AsyncSnapshot<List<dynamic>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        String countryName = snapshot.data![index]['country'];
        if (_searchTEController.text.isEmpty) {
          return _buildCountryTile(snapshot, index);
        } else if (countryName
            .toLowerCase()
            .contains(_searchTEController.text.toLowerCase())) {
          return _buildCountryTile(snapshot, index);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildCountryTile(AsyncSnapshot<List<dynamic>> snapshot, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountryCovidDetailsScreen(
              countryName: snapshot.data![index]['country'],
              flag: snapshot.data![index]['countryInfo']['flag'],
              covidStatesCountryData: [
                {
                  'title': 'Total Cases',
                  'value': double.tryParse(
                          snapshot.data![index]['cases']?.toString() ?? '') ??
                      0.0
                },
                {
                  'title': 'Active Cases',
                  'value': double.tryParse(
                          snapshot.data![index]['active']?.toString() ?? '') ??
                      0.0
                },
                {
                  'title': 'Today Cases',
                  'value': double.tryParse(
                          snapshot.data![index]['todayCases']?.toString() ??
                              '') ??
                      0.0
                },
                {
                  'title': 'One Case Per People',
                  'value': double.tryParse(snapshot.data![index]
                                  ['oneCasePerPeople']
                              ?.toString() ??
                          '') ??
                      0.0
                },
                {
                  'title': 'Cases Per Million',
                  'value': double.tryParse(snapshot.data![index]
                                  ['casesPerOneMillion']
                              ?.toString() ??
                          '') ??
                      0.0
                },
                {
                  'title': 'Total Deaths',
                  'value': double.tryParse(
                          snapshot.data![index]['deaths']?.toString() ?? '') ??
                      0.0
                },
                {
                  'title': 'Today Deaths',
                  'value': double.tryParse(
                          snapshot.data![index]['todayDeaths']?.toString() ??
                              '') ??
                      0.0
                },
                {
                  'title': 'Deaths Per Million',
                  'value': double.tryParse(snapshot.data![index]
                                  ['deathsPerOneMillion']
                              ?.toString() ??
                          '') ??
                      0.0
                },
                {
                  'title': 'One Deaths Per People',
                  'value': double.tryParse(snapshot.data![index]
                                  ['oneDeathPerPeople']
                              ?.toString() ??
                          '') ??
                      0.0
                },
                {
                  'title': 'Recovered',
                  'value': double.tryParse(
                          snapshot.data![index]['recovered']?.toString() ??
                              '') ??
                      0.0
                },
                {
                  'title': 'Today Recovered',
                  'value': double.tryParse(
                          snapshot.data![index]['todayRecovered']?.toString() ??
                              '') ??
                      0.0
                },
                {
                  'title': 'Recovered Per Million',
                  'value': double.tryParse(snapshot.data![index]
                                  ['recoveredPerOneMillion']
                              ?.toString() ??
                          '') ??
                      0.0
                },
                {
                  'title': 'Active Per Million',
                  'value': double.tryParse(snapshot.data![index]
                                  ['activePerOneMillion']
                              ?.toString() ??
                          '') ??
                      0.0
                },
                {
                  'title': 'Critical Cases',
                  'value': double.tryParse(
                          snapshot.data![index]['critical']?.toString() ??
                              '') ??
                      0.0
                },
                {
                  'title': 'Critical Per Million',
                  'value': double.tryParse(snapshot.data![index]
                                  ['criticalPerOneMillion']
                              ?.toString() ??
                          '') ??
                      0.0
                },
                {
                  'title': 'Tests',
                  'value': double.tryParse(
                          snapshot.data![index]['tests']?.toString() ?? '') ??
                      0.0
                },
                {
                  'title': 'Tests Per Million',
                  'value': double.tryParse(snapshot.data![index]
                                  ['testsPerOneMillion']
                              ?.toString() ??
                          '') ??
                      0.0
                },
                {
                  'title': 'One Tests Per People',
                  'value': double.tryParse(snapshot.data![index]
                                  ['oneTestPerPeople']
                              ?.toString() ??
                          '') ??
                      0.0
                },
                {
                  'title': 'Population',
                  'value': double.tryParse(
                          snapshot.data![index]['population']?.toString() ??
                              '') ??
                      0.0
                },
              ],
            ),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            snapshot.data![index]['countryInfo']['flag'],
          ),
        ),
        title: Text(snapshot.data![index]['country']),
        subtitle: Text(snapshot.data![index]['cases'].toString()),
      ),
    );
  }

  Widget _buildCountrySearchFormField(BuildContext context) {
    return TextFormField(
      controller: _searchTEController,
      cursorColor: Colors.grey.shade700,
      style:
          Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
      decoration: const InputDecoration(
        hintText: "Search Country",
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (value) => setState(() {}),
    );
  }

  AppBar _buildAppBarWithBackButton(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}
