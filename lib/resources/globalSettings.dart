import 'dart:ui';

class GlobalSettings{
  Color _color1 = new Color(0xff19203f);
  Color _color2 = new Color(0xffccad75);
  Color _color3 = new Color(0xfff1e8e2);
  Color _color4 = new Color(0xff606672);

  GlobalSettings();

  GlobalSettings.fromJson(Map<String, dynamic> json)
      : _color1 = json['color1'],
        _color2 = json['color2'],
        _color3 = json['color3'],
        _color4 = json['color4'];

  // Getters
  Color get color1 => _color1;
  Color get color2 => _color2;
  Color get color3 => _color3;
  Color get color4 => _color4;
}