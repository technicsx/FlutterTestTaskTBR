import 'dart:convert';

class Country {
  final String flag;
  final String phoneCode;
  final String name;

  Country(this.flag, this.phoneCode, this.name);

  Country.fromJson(Map<String, dynamic> receivedJson)
      : flag = receivedJson['flag'],
        phoneCode =
            "${receivedJson['idd']['root'] ?? ""}${receivedJson['idd']['suffixes'] != null ? receivedJson['idd']['suffixes'][0] : ""}",
        name = receivedJson['name']['common'];
// phoneCode = "${jsonDecode(receivedJson['idd'])['root']}  ${jsonDecode(receivedJson['idd'])['suffixes'][0]}",
}
