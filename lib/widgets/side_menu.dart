import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: 280.0,
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //? Pq não funcionou?
          children: [
            //* Inserindo e arrumando Logo do SPOTIFY
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/spotify_logo.png', //´ Carregando Imagem
                    height: 55.0, //´ Definindo Altura
                    filterQuality: FilterQuality.high, //´ Arrumando Qualidade
                  ),
                ),
              ],
            ),
            //* Icones e nome das Abas principais abaixo do Logo
            //nota: Foi criado um widget novo, semelhante uma função, para construir cada botão com icone e nome(title)
            _SideMenuIconTab(
              iconData: Icons.home,
              title: 'Home',
              onTap: () {},
            ),
            _SideMenuIconTab(
              iconData: Icons.search,
              title: 'Search',
              onTap: () {},
            ),
            _SideMenuIconTab(
              iconData: Icons.audiotrack,
              title: 'Radio',
              onTap: () {},
            ),
            _LibraryPlaylists(),
          ],
        ));
  }
}

//! Widget Add
//- Construção de botões com icones e nomes(title)
class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  @override
  __LibraryPlaylistsState createState() => __LibraryPlaylistsState();
}

class __LibraryPlaylistsState extends State<_LibraryPlaylists> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              children: [
                //* Primeiro item da lista do usuário ->> SUA BIBLIOTECA
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'YOU LIBRARY',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                //? Que droga ele fez aqui?
                ...yourLibrary.map((e) => ListTile(
                      dense: true,
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {},
                    ))
              ],
            ),
            const SizedBox(height: 24.0),
            Column(
              children: [
                //* Primeiro item da lista do usuário ->> SUAS PLAYLISTS
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Text(
                    'PLAYLISTS',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map((e) => ListTile(
                      dense: true,
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {},
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
