enum AsyncStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == AsyncStatus.initial;
  bool get isLoading => this == AsyncStatus.loading;
  bool get isSuccess => this == AsyncStatus.success;
  bool get isFailure => this == AsyncStatus.failure;
}
