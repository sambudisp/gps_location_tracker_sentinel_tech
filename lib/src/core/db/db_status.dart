enum RequestStatus {
  idle,
  loading,
  success,
  error,
  restored;

  bool get isIdle => this == RequestStatus.idle;

  bool get isLoading => this == RequestStatus.loading;

  bool get isSuccess => this == RequestStatus.success;

  bool get isError => this == RequestStatus.error;

  bool get isRestored => this == RequestStatus.restored;
}
