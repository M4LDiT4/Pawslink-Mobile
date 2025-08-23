import 'package:flutter/material.dart';
import 'package:mobile_app_template/core/dependency_injection/dependency_injection.dart';
import 'package:mobile_app_template/core/widgets/navigation/generic_appbar.dart';
import 'package:mobile_app_template/data/model/animal_profile_item.dart';
import 'package:mobile_app_template/domain/entities/animal_dto.dart';
import 'package:mobile_app_template/domain/services/animal%20database/animal_database_service.dart';
import 'package:mobile_app_template/features/animal_database/widgets/animal_profile_list_item.dart';

class SearchAnimalPage extends StatefulWidget {
  const SearchAnimalPage({super.key});

  @override
  State<SearchAnimalPage> createState() => _SearchAnimalPageState();
}

class _SearchAnimalPageState extends State<SearchAnimalPage> {
  final TextEditingController _controller = TextEditingController();
  String query = "";
  late final AnimalDatabaseService _service;

  @override
  void initState() {
    _service = getIt.get<AnimalDatabaseService>();
    super.initState();
  }

  Future<List<AnimalDTO>> searchWithRecommendations(String query) async {
    final result = await _service.searchAnimalByNameLocally(query);
    if (result.data == null) {
      throw Exception('Unexpected error occurred');
    }
    return result.data!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppbar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Search animals",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() => query = value);
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<AnimalDTO>>(
              future: searchWithRecommendations(query),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No results found"));
                }

                final results = snapshot.data!;
                return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final animal = results[index];
                    return AnimalProfileListItem(
                      profile: AnimalProfile(
                        name: animal.name, 
                        location: animal.location, 
                        sex: animal.sex, 
                        id: animal.remoteId!, 
                        status: animal.status, 
                        species: animal.species,
                        animalProfileLink: animal.profileImagePath
                      )
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
