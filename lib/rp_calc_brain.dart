import 'package:flutter/material.dart';

import 'components/list_builder.dart';

var _arrayResult = [];

int rpPrice = 0;

class Calculator {
  sendRpPrice(String inputRp) {
    if (inputRp.isNotEmpty) {
      toggleShowList(true);

      rpPrice = int.parse(inputRp);
    } else {
      toggleShowList(false);
    }
  }

  getResults() {
    criaResultadosArray();

    return _arrayResult;
  }

  criaResultadosArray() {
    //faz um for em todas as opções de objMetodoPag e verifica os que são compativeis com o valor digitado e retorna o  "arrayResult" com os valores compatíveis, intercalados em 2 indexs
    if (_arrayResult.isNotEmpty) {
      _arrayResult = [];
    }
    var rp = rpPrice;

    for (var index = 0; index < arrayTiposPag.length; index++) {
      Map<String, List<Map<String, num>>> mapMetodoPag = arrayTiposPag[index];

      var arrayObjprecos = mapMetodoPag.values.single;

      for (var index = 0; index < arrayObjprecos.length; index++) {
        var objPreco = arrayObjprecos[index];

        if (objPreco['RP']! >= rp && objPreco['RP']! <= rp * 2) {
          var _MapResult = Map();
          _MapResult["NomePagamento"] = mapMetodoPag.keys;
          _MapResult["PreçoRp"] = objPreco['RP'];
          _MapResult["PreçoMoeda"] = objPreco['R\$']?.floor();
          _arrayResult.add(_MapResult);
        }
      }
    }
  }

  var arrayTiposPag = [
    {
      //Pg-Domestico - Boleto bancário - Gold,Paypal,Pagseguro - Itaú,Banco do Brasil,Bradesco, HSBC - VISA, MASTERCARD, HIPERCARD,AURA,ELO,DISCOVER,ALGUM OUTRO

      'Cartão/Boleto': [
        {'R\$': 13.65, 'RP': 650},
        {'R\$': 27.25, 'RP': 1300},
        {'R\$': 54.5, 'RP': 2600},
        {'R\$': 95.5, 'RP': 4550},
        {'R\$': 136.25, 'RP': 6500},
        {'R\$': 272.5, 'RP': 13000},
      ],
    },
    {
      'PaySafe': [
        {'R\$': 10.0, 'RP': 480},
        {'R\$': 20.0, 'RP': 960},
        {'R\$': 25.0, 'RP': 1200},
        {'R\$': 40.0, 'RP': 1920},
        {'R\$': 50.0, 'RP': 2400},
        {'R\$': 100.0, 'RP': 4800},
      ],
    },
    {
      'CelularSms': [
        {'R\$': 4.99, 'RP': 135},
        {'R\$': 9.99, 'RP': 275},
      ],
    },
  ];
}
