import 'package:test/test.dart';
import 'dart:convert';
import 'package:user_microservice/account.dart';

void main() {
  group('Account', () {
    test('create', () {
      var now = DateTime.now();
      var account = Account(
        'USER NAME', 
        'PASSWORD',
        'EMAIL',
        ['GROUP 1', 'GROUP 2'],
        now,
      );
      
      expect(account.userName, 'USER NAME');
      expect(account.password, 'PASSWORD');
      expect(account.email, 'EMAIL');
      expect(account.groups, ['GROUP 1', 'GROUP 2']);
      expect(account.transactionDate, now);
    });
    test('to/from JSON', () {
      var now = DateTime.now();
      var nowString = now.toString().replaceAll(' ', 'T');
      var account = Account(
        'USER NAME', 
        'PASSWORD',
        'EMAIL',
        ['GROUP 1', 'GROUP 2'],
        now,
      );
      var accountJSON = account.toJson();
      var expected = {
        'userName': 'USER NAME',
        'password': 'PASSWORD',
        'email': 'EMAIL',
        'groups': ['GROUP 1', 'GROUP 2'],
        'transactionDate': nowString,
      };
      var expectedString = '{"userName":"USER NAME","password":"PASSWORD","email":"EMAIL","groups":["GROUP 1","GROUP 2"],"transactionDate":"$nowString"}';
            
      expect(accountJSON, expected);
      expect(jsonEncode(account), expectedString);

      expect(accountJSON, json.decode(expectedString));
      expect(accountJSON, jsonDecode(expectedString));

      var decodedAccount = Account.fromJson(accountJSON);
      expect(account.userName, decodedAccount.userName);
      expect(account.password, decodedAccount.password);
      expect(account.email, decodedAccount.email);
      expect(account.groups, decodedAccount.groups);
      expect(account.transactionDate, decodedAccount.transactionDate);
    });
  });
}