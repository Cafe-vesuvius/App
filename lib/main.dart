import 'package:app/data_theme.dart';
import 'package:app/features/displayMenuItems/presentation/providers/template_provider.dart';
import 'package:app/features/user/presentation/pages/login_page.dart';
import 'package:app/features/user/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/pokemon/presentation/providers/pokemon_provider.dart';
import 'features/pokemon/presentation/providers/selected_pokemon_item_provider.dart';
import 'features/skeleton/providers/selected_page_provider.dart';
import 'features/skeleton/skeleton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectedPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PokemonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectedPokemonItemProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MenuItemTypesProvider(),
        ),
      ],
      child: MaterialApp(
        theme: CustomTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        title: 'Café Vesuvius',
        home: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    SelectedPokemonItemProvider selectedPokemonItem =
        Provider.of<SelectedPokemonItemProvider>(context, listen: false);

    Provider.of<PokemonProvider>(context, listen: false).eitherFailureOrPokemon(
      value: (selectedPokemonItem.number + 1).toString(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // login logic
    if (Provider.of<UserProvider>(context, listen: true).user == null) {
      return const LoginPage();
    } else {
      return const Skeleton();
    }
  }
}
