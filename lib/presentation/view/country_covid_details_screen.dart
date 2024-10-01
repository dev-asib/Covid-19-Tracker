import 'package:covid_insight/presentation/widgets/covid_data_row.dart';
import 'package:flutter/material.dart';

class CountryCovidDetailsScreen extends StatefulWidget {
  const CountryCovidDetailsScreen({
    super.key,
    required this.countryName,
    required this.flag,
    required this.covidStatesCountryData,
  });

  final String countryName;
  final String flag;
  final List<Map<String, dynamic>> covidStatesCountryData;

  @override
  State<CountryCovidDetailsScreen> createState() =>
      _CountryCovidDetailsScreenState();
}

class _CountryCovidDetailsScreenState extends State<CountryCovidDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarWithBackButton(
        context: context,
        title: widget.countryName,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildCovidDataList(),
            Positioned(
              child: _buildFlagSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlagSection() {
    return Container(
      height: 120,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          opacity: 0.5,
          image: NetworkImage(widget.flag),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildCovidDataList() {
    return ListView.builder(
      itemCount: widget.covidStatesCountryData.length,
      itemBuilder: (context, index) {
        return CovidDataRow(
          title: widget.covidStatesCountryData[index]['title'],
          value: widget.covidStatesCountryData[index]['value'].toString(),
        );
      },
    );
  }

  AppBar _buildAppBarWithBackButton({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(title),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
