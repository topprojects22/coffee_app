// You can pass any object to the arguments parameter.
// In this example, create a class that contains a customizable
// key and value.
class ScreenArguments<T> {

  ScreenArguments({this.key, this.value});
  final String? key;
  final T? value;
}

class ScreenArgumentKeys {
  ScreenArgumentKeys._();

  static const String bookingId = 'booking_id';
}
