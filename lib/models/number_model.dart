class NumberModel {
  late String number, error;

  NumberModel(this.number);

  NumberModel.withError(String errorMessage) {
    error = errorMessage;
  }
}
