import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_app/presentation/controllers/home_view_controller.dart';

class HomeView extends StatefulHookConsumerWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(homeViewProvider).getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final characters = ref.watch(homeViewProvider).characters;
    final isLoading = ref.watch(
      homeViewProvider.select((value) => value.isLoading),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green[400],
        appBar: AppBar(
          title: const Text('Soy un AppBar'),
          backgroundColor: Colors.green[500],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_circle_right_outlined),
          onPressed: () {
            ref.read(homeViewProvider).getCharacters();
          },
        ),
        body: Container(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        2, // This specifies the number of cards per row
                  ),
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.yellow[400],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 80,
                            child: Image.network(characters[index].image),
                          ),
                          const SizedBox(height: 3),
                          Text(characters[index].name),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
