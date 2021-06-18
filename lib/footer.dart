import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Built in Flutter',
          style: TextStyle(fontSize: 19),
        ),
        SizedBox(
          width: 8,
        ),
        Image.network(
          'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMkAAAD6CAMAAAA89pM0AAAAk1BMVEX///9F0f0CU5pg1/06ve7r+f972/1S1P0AT5hig7MARpRtjbhd1v1FxPI4z/30/P86vu4qzf0APJD3/f8Vba236v6v6P6n5v6e5P6U4f6G3v0TaaoAP5Ga4/6M3/42xvXS2+jT8v5QxvJbzfZg2/9wncbW9f/i+P9l0Pdz1PeC1/gkuO0AZarCzd7T3OhXfK+kttGUsWxyAAADO0lEQVR4nO3baW/TQBCA4W2do0DSBMJVelFuCLT8/19HS5Q2SX3sMdbMpO/72ZL1aGzZ2tWGoNdiJFZ1pegIs4PjA6FevtGFiAUECBAgQIAAAQIEyBOCvAUCBAgQIECAAAECBAgQIED+Q94BAQIECBAgQIAAAQIECBAgQID0CXkPBAgQIECAuIWInbrQhog5tCF7MxEgeww5BwLkoSEQIECAJHa8N5ATIECAAAECBAgQIECAAFGCXAABAgQIECBAgAABAgQIkDLIByBAgIhAFkO5dCHVWKx7iQ5kUsk0qRZAgPQDmQEB0jMkjMQkypAQKiGKOkSKYgAiQzEBkaAYgZRTzEBKKYYgZRQNyKQJUkIxBsmnmIPkUgxC8ijHI4OQHIpRSAiTRIpZSCrFMCSNYhqSQjEOiaeYh8RSHEDiKC4gMRQFSJUB6aZEQ8J0qgrpoiRABgMhSiaknZIEEaJkQ9ooiRARSgGkmRIP+TQYCFGKIE2UDEgxpRBST8mCFFKKIXWUTEgRZTLsvlsyJRtSQBGB7FIKINkUIcg2pQiSSRGDbFIKIVkUQcgDJQGyrJekU0Qha4oAJJkiDFlR4iGfmyGJlLE05I4iBEmi9AAJYSwFSaD0AgmL7ksiIdGUfiDRRUAiKR4gURQfkAiKF0gnRRnyIx7SQfEEaaX4grRQvEEaKf4gDRSPkFqKT0gNxSvkEcUvZIeiDKlKIFsUZcjPMsgGxfdENijeJ3JP0YYIOFaU/YDcUr64f0fWfVWFhKtLIcf89OzFXlDmp0eHz5Up3yQod5DDfaCsIP4p8zXEO2UDok/5XkCZTzcgnik7EL+U+fT1NkSfMsyi1EB8UmohFiip/2CP3hGvlEaIPmXWsuNbB6l9tPxRWiEGKPH7J+0QfcoiktIxEUeUbogTSgxEnxKx1ziPgjigxELMU+IhBihta/cpENOUNIhhSirELCUdYoBSt4Yf9x1xQMmDGKTkQsxR8iEGKL+WMhBTlDKIIUopxAylHGKAcrGUgRignCxlIAYo579lIAYof14JSaBAgQIFCpTbPkKBAgWKX8oZFChQnhjlGgoUKFCgQIFSTzkSSvsoTri+eSbUzd9/3M/0Z69nvLkAAAAASUVORK5CYII=',
          width: 25,
        )
      ],
    );
  }
}
