enum DbStatus {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == DbStatus.idle;

  bool get isLoading => this == DbStatus.loading;

  bool get isSuccess => this == DbStatus.success;

  bool get isError => this == DbStatus.error;
}
