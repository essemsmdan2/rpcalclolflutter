import 'package:flutter/material.dart';
import 'firebase/send_and_get_firebasestore.dart';
import 'components/list_builder.dart';

var _arrayResultFromShuffle = [];

FireBaseHandler updateStatus = FireBaseHandler();
double rpPrice = 0;

class Calculator {
  void updateArrayResult() async {
    //usar a linha a baixo apenas em ambiente de desenvolvimento
    //await FireBaseHandler().sendUpdatePaymentTypes();
    arrayTiposPag = await updateStatus.getUpdatePaymentTypes();
  }

  sendRpPrice(String inputRp) {
    if (inputRp.isNotEmpty) {
      toggleShowList(true);

      rpPrice = double.parse(inputRp);
    } else {
      toggleShowList(false);
    }
  }

  getResults() {
    criaResultadosArray();

    return _arrayResultFromShuffle;
  }

  criaResultadosArray() {
    //faz um for em todas as opções de objMetodoPag e verifica os que são compativeis com o valor digitado e retorna o  "arrayResult" com os valores compatíveis, intercalados em 2 indexs
    if (_arrayResultFromShuffle.isNotEmpty) {
      _arrayResultFromShuffle = [];
    }
    var rp = rpPrice;

    for (var index = 0; index < arrayTiposPag.length; index++) {
      var mapMetodoPag = arrayTiposPag[index];

      var arrayObjprecos = mapMetodoPag.values.single;

      for (var index = 0; index < arrayObjprecos.length; index++) {
        var objPreco = arrayObjprecos[index];

        if (objPreco['RP']! >= rp && objPreco['RP']! <= rp * 2) {
          var _MapResult = Map();
          _MapResult["NomePagamento"] = mapMetodoPag.keys;
          _MapResult["PreçoRp"] = objPreco['RP'];
          _MapResult["PreçoMoeda"] = objPreco['R\$'].toStringAsFixed(2);
          _arrayResultFromShuffle.add(_MapResult);
        }
      }
    }
  }

  var arrayTiposPag = [];
}
