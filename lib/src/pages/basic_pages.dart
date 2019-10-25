import 'package:disenos/src/models/historymodel.dart';
import 'package:disenos/src/models/petmodel.dart';
import 'package:disenos/src/models/tipomodel.dart';
import 'package:disenos/src/service/service.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';



class BasicPages extends StatelessWidget {
  final estiloTitulo = TextStyle( fontSize: 20.0, fontWeight: FontWeight.normal);
  final estiloSubtitulo = TextStyle( fontSize: 14.0, fontWeight: FontWeight.normal);

  final service = new Service();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial',style: TextStyle(fontSize: 25.0),),
        backgroundColor: Colors.brown,
      ),
      body:listarhistorial(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('adasdasdws');
          service.readall();
        },
      ),
    );
  }
  //Widget format
/*
  Widget viewTitulo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Row(
      children: <Widget>[
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('31/08/2019',style: estiloTitulo,),
                Text('Higiene',style: estiloTitulo,),
                
                SizedBox(height: 7.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('Cometario corto del tratamiento',style: estiloSubtitulo,),
                    Text('Comentario sobre la vacuna',style: estiloSubtitulo,),
                  ],
                ),
                SizedBox(height: 2.0,),
                Row(
                  children: <Widget>[
                    Badge(
                    badgeColor: Colors.orange,
                    shape: BadgeShape.square,
                    borderRadius: 10,
                    toAnimate: false,
                    badgeContent:
                    Text('Servicio', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10,),
                    Badge(
                    badgeColor: Colors.blueAccent,
                    shape: BadgeShape.square,
                    borderRadius: 10,
                    toAnimate: false,
                    badgeContent: Text('Vacuna', style: TextStyle(color: Colors.white)),
                    
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text('22/08/2019',style: estiloTitulo,),
                Text('Tratamiento Rabia I',style: estiloTitulo,),
                SizedBox(height: 7.0),
                Text('Cometario corto del tratamiento',style: estiloSubtitulo,),
                Text('Comentario sobre la vacuna',style: estiloSubtitulo,),
                SizedBox(height: 2.0,),
                Row(
                  children: <Widget>[
                    Badge(
                    badgeColor: Colors.orange,
                    shape: BadgeShape.square,
                    borderRadius: 10,
                    toAnimate: false,
                    badgeContent:
                    Text('Servicio', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10,),
                    Badge(
                    badgeColor: Colors.blueAccent,
                    shape: BadgeShape.square,
                    borderRadius: 10,
                    toAnimate: false,
                    badgeContent:
                    Text('Vacuna', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),   
              ],
            ),
          ),
        ],
      ),
    );
  }*/

  Widget listarhistorial(){
    
    return FutureBuilder<List<History>>(
      future: service.readAllHistory(),
      builder: (context, snapshot){
      if (!snapshot.hasData) return Container();
        List<History> posts = snapshot.data;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child:ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context,position){
              return Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text('${posts[position].fecha}',style: estiloTitulo,),
                      Text('${posts[position].titulo}',style: estiloTitulo,),
                
                      SizedBox(height: 7.0),
                      Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                      Text('${posts[position].descrpcion}',style: estiloSubtitulo,),
                      SizedBox(height: 10.0,),
                      _crearbagde(context,posts[position].tipo),

                      SizedBox(height: 20.0),
                      ],
                      ),
                      SizedBox(height: 2.0,),
                      ],
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              );
            },
          ),
        );
      },
    );
  }

  Widget _crearbagde(BuildContext context, List<Tipo> petsn) {
    
      return ListView.builder(
          shrinkWrap: true,
          itemCount: petsn.length,
          itemBuilder: (context,position){
          return Row(
          children: <Widget>[
            Badge(
            badgeColor: Colors.orange,
            shape: BadgeShape.square,
            borderRadius: 10,
            toAnimate: false,  
            badgeContent:
            Text('${petsn[position].nombreTipo}', style: TextStyle(color: Colors.white)),
            ),
            ],
          );
        }
    );
  }

}