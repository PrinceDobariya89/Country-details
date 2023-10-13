import 'package:flutter/material.dart';
import 'package:practical_exam/model/country_model.dart';
import 'package:practical_exam/provider/country_provider.dart';
import 'package:practical_exam/widget/textbold.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Details'),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<CountryProvider>(context, listen: false)
                    .sortCountry();
              },
              icon: const Icon(Icons.sort_by_alpha_outlined))
        ],
      ),
      body: Consumer<CountryProvider>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.countryList.length,
          itemBuilder: (context, index) {
            CountryModel? data = value.countryList[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 6,horizontal: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const TextBold(text: 'Name : '),
                        TextBold(text: data.name?.common.toString() ?? ''),
                      ],
                    ),
                    Row(
                      children: [
                        const TextBold(text: 'Capital : '),
                        TextBold(text: data.capital?[0].toString() ?? ''),
                      ],
                    ),
                    Row(
                      children: [
                        const TextBold(text: 'Population : '),
                        TextBold(text: data.population.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            );
            // return ListTile(
            //   title:
            //       Text(data.name?.common.toString() ?? ''),
            //   subtitle:
            //       Text(data.capital?[0].toString() ?? ''),
            //   trailing: Text(data.population.toString()),
            // );
          },
        );
      }),
    );
  }
}
