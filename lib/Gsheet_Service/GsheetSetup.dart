import 'package:gsheets/gsheets.dart';

var sheetId = '1Vtf7fAlGr3GHxFRCO6grUJ63Y8OBFeaMwmTt40RTDR8';

var credentials = r'''
{
  "type": "service_account",
  "project_id": "solar-study-199309",
  "private_key_id": "25cac94a402d9c58ca85166f256a977f708344c7",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCztYe4gvQbpKal\nI0Vw9sBbuE5xnSX5NibbC/cZNOSRTZmpK98a0IyWJI6FHrFKJwz+fQBnJy8OGcYd\nrZ2Q/Q7X7x7/AcdaOFx83Af+0RurUw/F/Tl/mOuosgrjjrAqjWfUdL1M/TdKwEGA\nHVQ739kXFbPxfOYd3huSoSoFMU4Ua5QtrEIllgrTY/rg8oDgGQs/kdahhQW+rKxN\nhecg7X3+a9Qc71IJXOEjUJhi0AhC1uCqaBDYVv60QyS349UpB5bUnG7q9qrHg/df\nsr4x7nU4JZF1x2ehajT/SHs52urMvmaLfWiThs7LqYEhA7RptdttueJRLX6JMb/l\ngTT/BwxbAgMBAAECggEAH9Fmv8zz0oci+D8X9unBYhvuS6Bizk5/r63dKKncRDvE\nlpbNcC53jcfYMgqeoj3qx44zSZA+/RSkJrIMIVUk0SelycmzVa5/9Z1xjvTQHNPe\niZQNn6FgLCSl1+d2Gnqh5RRsRdrZdNM4ZaoLtXQrODKgAwQ1rBkcsaf2TCgQJn4f\nr6H31DugjxmcCRwyufUsCpwGqLN0+kXCdL945wdMrU3HvhD80enXCBTFIsPpgZgi\nFIGWRzxaU/xsEKKZ7xdKtga0tJOFMtmaChi2vmzTAjfhbk0xvVg83StxVtZnB/xN\niQV+35QWLvvyvJ8NG8jPU5BJN6nHDxCSQzsbRZeq9QKBgQDY27VSSxxgKtj125UM\nXi4Z3xoTxoC+VFSF5ee3oQldR9R+s9IxJtErFXObF6UeskZRGNgVoOW55806Q9Lx\n+XEFCgdQPftKIg8TMshRo7nzODv8Igp792qD8F8a03wsxji6w+RNyuqsOp9w9/+g\n+Kf21hkXVftn1sD4KQSkueQANQKBgQDUJUj3Js/TFSFIcxY4Ml0BSd/g2B++GwZt\nGm87z3F/n34rqTuZWOrjoCbZaJNcQWbs5m60f++yBY1maMFflHlf2KYoaPV4RFIX\nKDX63YdUyDJO9JHG3P8O6dFwUpujHKeAy4681zdN81XD2y9NTbv78rLmXJb/K8qZ\nhSVq2RaMTwKBgG+3cAe/DhU0vaSaxIQkmJdXafW6E2T5yLlaIS9mVI6rjHrhZG1R\n0/vgBzhky/muWa85n0g1JWPKWN2lRyzFFkZETlQ2OhiMxztas/vq3sa/t5dCaihG\n46ao1DXbsWLXky4T8K9q0856PN1TxWtF7jGpRi/Rabyq06qEZxH9ecnpAoGBAIT+\nXtC6Hx1IKNZfd7WBNTcClfxB4Rxvmsa5BLStJo0IcrNyY2+OA6rxkolG+uKiCaFI\nEGzNq3mh63QhBeEiljiU/A1nR0O/KOtlhPmg+R8YZhmDTwQpNSinQmo1D2bhJs0i\nT3hpPz155/FhrjS7H7ch/i9WKj8Lt/YoNz3VnEIXAoGAcvtoL1Y5+nL5DXu8J0ec\nxvHqkG68MyqHR6HxAXJbkhcTpfATmLBrnoY2E4ZLcb3pqimnJ5u5d2tvDglU4ppK\nNH5dk40zXB9SA7hV1OEfKPYrx0j81eoZ4TCFzaYLyjI3j2gqpI0BlsWlxZaYyulU\nVZaa6miqgPIHaIzVWd2P85M=\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheet@solar-study-199309.iam.gserviceaccount.com",
  "client_id": "103848334329145741483",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheet%40solar-study-199309.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';

final gsheetinit = GSheets(credentials);

var GsheetController;

Worksheet? gsheetCrudUserDetails;

GsheetIntit() async {
  GsheetController = await gsheetinit.spreadsheet(sheetId);

  gsheetCrudUserDetails = await GsheetController.worksheetByTitle('My Notes');
}
