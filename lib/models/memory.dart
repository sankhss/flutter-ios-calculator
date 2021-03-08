class Memory {
  static const operations = const ['%', '/', 'x', '-', '+'];

  String _value = '0';
  List<double> _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String _currentOperation;
  bool _shouldClear = false;

  String get value => _value;

  void apply(String keyValue) {
    if (isAC(keyValue)) {
      _allClear();
    } else if (_isEnterResult(keyValue)) {
      _setValue();
    } else if (_isOperation(keyValue)) {
      _setOperation(keyValue);
    } else {
      _insert(keyValue);
      _updateBuffer();
    }

    print(_buffer);
  }

  void _insert(String value) {
    final isDot = _isDot(value);
    final shouldClear = (_isEmptyValue() && !isDot) || _shouldClear;

    if (isDot && _value.contains('.') && !shouldClear) {
      return;
    }

    final emptyValue = isDot ? '0' : '';
    var currentValue = shouldClear ? emptyValue : _value;
    _value = currentValue + value;
    _shouldClear = false;
  }

  void _updateBuffer() {
    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  void _setOperation(String value) {
    if (_bufferIndex == 0) {
      _bufferIndex = 1;
    } else {
      _setValue();
    }

    _currentOperation = value;
    _shouldClear = true;
    print('operação atual: ' + _currentOperation);
  }

  void _setValue() {
    _buffer[0] = _calculate();
    _buffer[1] = 0.0;

    _formatValue(_buffer[0]);
  }

  void _formatValue(double result) {
    var value = result.toString();
    _value = value.endsWith('.0') ? value.split('.')[0] : value;
  }

  double _calculate() {
    switch (_currentOperation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  void _allClear() {
    _value = '0';
    _buffer = [0.0, 0.0];
    _bufferIndex = 0;
    _currentOperation = null;
    _shouldClear = false;
  }

  bool _isOperation(String value) {
    return operations.contains(value);
  }

  bool _isEnterResult(String value) {
    return '=' == value;
  }

  bool isAC(String value) {
    return value == 'AC';
  }

  bool _isDot(String value) {
    return '.' == value;
  }

  bool _isEmptyValue() {
    return '0' == _value;
  }
}
