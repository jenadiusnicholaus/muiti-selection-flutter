import 'package:flutter/material.dart';
import 'package:selecttechstacks/data.dart';
import 'package:selecttechstacks/models.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var indexs = [];
  int? selectedIndex;

  var futures;

  bool isSelected(index, List indexs) {
    if (indexs.contains(index)) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    futures = getTeckstack();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 800,
            // height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Color(0xff102733)),
            child: Column(
              children: [
                Text(
                  'Teck Stacks',
                  style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Select the tech stack that you are real good at,\n   ',
                  style: TextStyle(fontSize: 18, color: Colors.grey[350]),
                ),
                Text(
                  'What is you tech stacks',
                  style: TextStyle(fontSize: 18, color: Colors.grey[350]),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 450,
                    child: FutureBuilder<List<TechStacks>>(
                      future: futures, // async work
                      builder: (BuildContext context,
                          AsyncSnapshot<List<TechStacks>> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const Text('Loading....');
                          default:
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 1,
                                        // mainAxisExtent: 2,
                                        childAspectRatio: 2.0,
                                        crossAxisSpacing: 7,
                                        crossAxisCount: 3),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, int index) => InputChip(
                                  backgroundColor: isSelected(index, indexs)
                                      ? Theme.of(context).primaryColor
                                      : const Color(0xFF3E5561),
                                  avatar: isSelected(index, indexs)
                                      ? const Icon(
                                          Icons.check_box_rounded,
                                          size: 20,
                                        )
                                      : const Icon(Icons.add),
                                  label: Text(
                                    '${snapshot.data![index].name!},',
                                    style: isSelected(index, indexs)
                                        ? const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)
                                        : TextStyle(
                                            fontSize: 20,
                                            color: Colors.blueGrey[100],
                                            fontWeight: FontWeight.bold),
                                  ),
                                  onSelected: (bool value) {
                                    selectedIndex = index;
                                    setState(() {
                                      (indexs.contains(index)
                                          ? indexs.remove(index)
                                          : indexs.add(index));
                                    });
                                  },
                                ),
                              );
                            }
                        }
                      },
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
