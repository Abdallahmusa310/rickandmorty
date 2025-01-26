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
  late List<Charactersmodel> allcharacters;
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
      itemCount: allcharacters.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return CharacterItem(charcter: allcharacters[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolors.yellow,
          title: Center(child: Text('Characters')),
        ),
        body: buildblocwidget());
  }
}
