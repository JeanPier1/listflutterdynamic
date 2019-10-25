import 'dart:convert';

import 'package:disenos/src/models/historymodel.dart';
import 'package:disenos/src/models/petmodel.dart';
import 'package:disenos/src/models/tipomodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Service{
  final String _url='https://hellow-bb692.firebaseio.com';



    Future<List<PetModel>> readAllPet() async{
      final url = '$_url/pets.json';
      final resp = await http.get(url);
      final Map<String,dynamic> decodata= json.decode(resp.body);
      List responseJson = json.decode(resp.body);

      final List<PetModel> pets = new List();

      if (decodata == null) return [];

      decodata.forEach((id ,pet){
        final petTemp= PetModel.fromJson(pet);
        petTemp.id=id;

        pets.add(petTemp);
      });

      return pets;
    }

    Future<List<History>> readAllHistory() async {
      final url = '$_url/pets.json';
      final resp = await http.get(url);
      final Map<String,dynamic> decodata= json.decode(resp.body);
      final List<PetModel> pets = new List();
      final List<History> hosti= new List();

      if (decodata == null) return [];

      decodata.forEach((id ,pet){
        final petTemp= PetModel.fromJson(pet);
        petTemp.id=id;
        print('${petTemp.history}');
        petTemp.history.forEach((fe){
          hosti.add(fe);
        });
        pets.add(petTemp);
      });
      print(hosti.length);


      return hosti;
    }

    Future<List<Tipo>> readall() async{
      final url = '$_url/pets.json';
      final resp = await http.get(url);
      final Map<String,dynamic> decodata= json.decode(resp.body);
      final List<PetModel> pets = new List();
      final List<History> hosti= new List();
      final List<Tipo> tipos= new List();

      if (decodata == null) return [];

      decodata.forEach((id ,pet){
        final petTemp= PetModel.fromJson(pet);
        petTemp.id=id;
        print('${petTemp.history}');
        petTemp.history.forEach((fe){
          hosti.add(fe);
          fe.tipo.forEach((f){
            tipos.add(f);
          });
        });
        pets.add(petTemp);
      });
      print(tipos.length);


      return tipos;
    }

}

