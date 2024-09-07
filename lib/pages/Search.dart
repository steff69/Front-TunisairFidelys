import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/Models%202/FoodModel.dart';
import 'package:travel_app/controller/searchController.dart';
import 'package:travel_app/controller/testControl.dart';
import 'package:travel_app/pages/tourist_details_page.dart';
import 'package:travel_app/widgets/distance.dart';
import 'package:travel_app/widgets/nearby_places.dart';
import 'package:travel_app/widgets/tourist_places.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final c = Get.put(SerchController());

    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Container(
          width: 400,
          child: TextField(
            controller: searchController,
            onChanged: (value) {
              c.getSearchData(searchdata: searchController.text);
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        SizedBox(height: 5),
        Obx(
          () => c.dataSearch.length > 0
              ? Expanded(
                  child: SingleChildScrollView(
                    child: SearchPlaces(data: c.dataSearch),
                  ),
                )
              : Expanded(
                  child: Center(
                      child: Image.asset(
                    'assets/illustration.png',
                    fit: BoxFit.cover,
                  )),
                ),
        )
      ],
    )));
  }
}

class SearchPlaces extends StatelessWidget {
  const SearchPlaces({
    super.key,
    required this.data,
  });

  final List<Datum> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(data.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: SizedBox(
            height: 135,
            width: double.maxFinite,
            child: Card(
              elevation: 0.4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TouristDetailsPage(
                          image: data[index].image,
                          descirption: data[index].description,
                          name: data[index].name,
                        ),
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          data[index].image,
                          height: double.maxFinite,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text("Portic Team"),
                            const SizedBox(height: 10),
                            // DISTANCE WIDGET
                            const Distance(),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                  size: 14,
                                ),
                                const Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const Spacer(),
                                RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      text: "\$22",
                                      children: const [
                                        TextSpan(
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                            text: "/ Person")
                                      ]),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
