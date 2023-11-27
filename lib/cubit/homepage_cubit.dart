// ignore_for_file: camel_case_types

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_flutter_ornek/entity/person.dart';
import 'package:bloc_pattern_flutter_ornek/repository/persons_dao_repository.dart';


class AnasayfaCubit extends Cubit<List<Kisi>> {
  AnasayfaCubit() : super(<Kisi>[]);
  var kisidao = KisilerDaoRepository();
  Future<void> kisileriYukle() async {
    var liste = await kisidao.fetchAllPersons();
    // print(liste);
    emit(liste);
  }
}
