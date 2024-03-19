
extension ExceptionExtension on Exception {
  toMessage() {
    return this.toString();
  }
}