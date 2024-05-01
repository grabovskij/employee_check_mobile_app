bool allTrue(List<bool> values) {
  var result = true;

  for (var element in values) {
    result = result && element;
  }

  return result;
}
