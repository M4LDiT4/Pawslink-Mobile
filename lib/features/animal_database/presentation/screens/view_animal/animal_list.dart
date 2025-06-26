import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/enums/animal_sex.dart';
import 'package:mobile_app_template/core/enums/animal_status.dart';
import 'package:mobile_app_template/data/model/animal_profile_item.dart';
import 'package:mobile_app_template/features/animal_database/presentation/widgets/animal_profile_list_item.dart';

class AnimalListScreen extends StatefulWidget {
  const AnimalListScreen({
    super.key
  });

  @override
  AnimalListScreenState createState() => AnimalListScreenState();
}

class AnimalListScreenState extends State<AnimalListScreen> {
  List<AnimalProfile> items = [
    AnimalProfile(
      animalPofileLink: 'https://example.com/images/dog1.jpg',
      name: 'Max',
      location: 'New York, NY',
      sex: AnimalSex.male,
      status: AnimalStatus.onCampus,
      id: 'dog001',
    ),
    AnimalProfile(
      animalPofileLink: 'https://example.com/images/cat1.jpg',
      name: 'Luna',
      location: 'San Francisco, CA',
      sex: AnimalSex.female,
      status: AnimalStatus.adopted,
      id: 'cat001',
    ),
    AnimalProfile(
      animalPofileLink: 'https://example.com/images/dog2.jpg',
      name: 'Charlie',
      location: 'Chicago, IL',
      sex: AnimalSex.male,
      status: AnimalStatus.adopted,
      id: 'dog002',
    ),
    AnimalProfile(
      animalPofileLink: 'https://example.com/images/cat2.jpg',
      name: 'Bella',
      location: 'Austin, TX',
      sex: AnimalSex.female,
      status: AnimalStatus.rainbowBridge,
      id: 'cat002',
    ),
    AnimalProfile(
      animalPofileLink: 'https://example.com/images/dog3.jpg',
      name: 'Cooper',
      location: 'Seattle, WA',
      sex: AnimalSex.male,
      status: AnimalStatus.adopted,
      id: 'dog003',
    ),
  ]; // Initial 20 items
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        // Near the bottom
        if (!isLoading) {
          loadMoreItems();
        }
      }
    });
  }

  Future<void> loadMoreItems() async {
    setState(() {
      isLoading = true;
    });

    // Simulate a delay like fetching data from network
    await Future.delayed(const Duration(seconds: 2));

    // Add 20 more items
    final nextItems = [
      AnimalProfile(
        animalPofileLink: 'https://example.com/images/dog1.jpg',
        name: 'Max',
        location: 'New York, NY',
        sex: AnimalSex.male,
        status: AnimalStatus.onCampus,
        id: 'dog001',
      ),
      AnimalProfile(
        animalPofileLink: 'https://example.com/images/cat1.jpg',
        name: 'Luna',
        location: 'San Francisco, CA',
        sex: AnimalSex.female,
        status: AnimalStatus.adopted,
        id: 'cat001',
      ),
      AnimalProfile(
        animalPofileLink: 'https://example.com/images/dog2.jpg',
        name: 'Charlie',
        location: 'Chicago, IL',
        sex: AnimalSex.male,
        status: AnimalStatus.adopted,
        id: 'dog002',
      ),
      AnimalProfile(
        animalPofileLink: 'https://example.com/images/cat2.jpg',
        name: 'Bella',
        location: 'Austin, TX',
        sex: AnimalSex.female,
        status: AnimalStatus.rainbowBridge,
        id: 'cat002',
      ),
      AnimalProfile(
        animalPofileLink: 'https://example.com/images/dog3.jpg',
        name: 'Cooper',
        location: 'Seattle, WA',
        sex: AnimalSex.male,
        status: AnimalStatus.adopted,
        id: 'dog003',
      ),
    ];
    setState(() {
      items.addAll(nextItems);
      isLoading = false;
    });
  }



  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: items.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == items.length) {
          // Show loading indicator at the bottom
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return AnimalProfileListItem(profile: items[index]);
      },
    );
  }
}
