import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/buisniss_logic/cubit/cubit/character_cubit.dart';
import 'package:rickandmorty/constans/colors.dart';
import 'package:rickandmorty/data/models/characters_model.dart';
import 'package:rickandmorty/presntion/widgets/character_item.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Charactersmodel? character;
  bool isSearching = false;
  late List<Charactersmodel> allcharacters;
  late List<Charactersmodel> searchedForCharacters;
  final searchtextcontroler = TextEditingController();
  Widget buildCharactersTextfeild() {
    return TextField(
      controller: searchtextcontroler,
      cursorColor: Appcolors.gray,
      decoration: InputDecoration(
        hintText: 'Find character....',
        border: InputBorder.none,
      ),
      onChanged: (searchedCharacters) {
        addsearcheditemstosearchedlist(searchedCharacters);
      },
    );
  }

  void addsearcheditemstosearchedlist(String searchedCharacters) {
    searchedForCharacters = allcharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacters))
        .toList();
    setState(() {});
  }

  List<Widget> buildappbaractions() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              clearsearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              startsearching();
            },
            icon: Icon(
              Icons.search,
            ))
      ];
    }
  }

  void startsearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopsearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopsearching() {
    clearsearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearsearch() {
    setState(() {
      searchtextcontroler.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).getallcharacters();
  }

  Widget buildblocwidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharactersLoading) {
          return loadingindecator();
        } else if (state is Characterssucsses) {
          allcharacters = state.characters;
          return buildcharacterslist();
        } else if (state is CharactersError) {
          return Center(
            child: Text(
              'Error: ${state.message}',
              style: TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
      },
    );
  }

  Widget loadingindecator() {
    return Center(
      child: CircularProgressIndicator(
        color: Appcolors.green,
      ),
    );
  }

  Widget buildloadedlistwidget() {
    return ListView(children: [
      Container(
          color: Appcolors.gray,
          child: Column(
            children: [
              buildcharacterslist(),
            ],
          )),
    ]);
  }

  Widget buildcharacterslist() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 0.5,
          mainAxisSpacing: 0.5),
      itemCount: searchtextcontroler.text.isEmpty
          ? allcharacters.length
          : searchedForCharacters.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return CharacterItem(
            charcter: searchtextcontroler.text.isEmpty
                ? allcharacters[index]
                : searchedForCharacters[index]);
      },
    );
  }

  Widget buildAppbartitle() {
    return Center(child: Text('Characters'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: buildappbaractions(),
            backgroundColor: Appcolors.yellow,
            title:
                isSearching ? buildCharactersTextfeild() : buildAppbartitle()),
        body: buildblocwidget());
  }
}
