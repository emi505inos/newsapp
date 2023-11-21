import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/tema.dart';

class ListNews extends StatelessWidget{
  
  final List<Article> noticia;

  const ListNews({super.key, required this.noticia});
  

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: noticia.length,
      itemBuilder: (BuildContext context, int index){
        return _Noticia(
          noticia: noticia[index], 
          index: index
        );
      });
  }
}

class _Noticia extends StatelessWidget{

  final Article noticia;
  final int index;

  const _Noticia({super.key, required this.noticia, required this.index});

  @override
  Widget build(BuildContext context){
    return  Column(
      children: <Widget>[
        _TarjetaTopBar(
          noticia: noticia,  
          index: index,),
          _TarjetaTitulo(noticia: noticia),
          _TarjetaImagen(noticia: noticia),
          _TarjetaBody(noticia: noticia),
          _TarjetaBotones(),
          SizedBox(height: 10,),
          Divider(),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.red,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),  
          ),
          SizedBox(width: 10),
          RawMaterialButton(
            onPressed: (){},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),  
          ),
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget{
  final Article noticia;

  const _TarjetaBody({required this.noticia});
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(noticia.description ??'' ),
    );
  }
  
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;

  const _TarjetaImagen({required this.noticia});
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: (noticia.urlToImage != null) 
            ? FadeInImage(
                placeholder: AssetImage('assets/img/giphy.gif'),
                image: NetworkImage(noticia.urlToImage??''),
              )
            : Image(image: AssetImage('assets/img/no-image.png'))
        ),
      ),
    );
}
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;

  const _TarjetaTitulo({required this.noticia});
  
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar({required this.noticia, required this.index});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}. ', style:  TextStyle(color:miTema.indicatorColor),),
          Text('${noticia.source.name}. ')
        ],
      ),
    );
  }
}