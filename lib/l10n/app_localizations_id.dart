// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appName => 'Location Tracker - Sentinel Tech';

  @override
  String get appNameTitle => 'Location Tracker';

  @override
  String get sentinelTech => 'Sentinel Tech';

  @override
  String get loadingLabel => 'Memuat';

  @override
  String get cancelLabel => 'Batal';

  @override
  String get yesLabel => 'Ya';

  @override
  String get okLabel => 'OK';

  @override
  String get trackNowLabel => 'Mulai Lacak';

  @override
  String get stopTrackLabel => 'Hentikan Pelacakan';

  @override
  String get locationHistoryLabel => 'Riwayat Lokasi';

  @override
  String get locationTrackingActiveLabel => 'Melacak lokasi Anda...';

  @override
  String get locationTrackingInstructionLabel =>
      'Ketuk \'Mulai Lacak\' untuk memulai pelacakan';

  @override
  String get locationTrackingStopConfirmation => 'Hentikan pelacakan lokasi?';

  @override
  String get locationTrackingSavedMessage => 'Lokasi tersimpan!';

  @override
  String get durationLabel => 'Durasi';

  @override
  String get sessionLabel => 'Sesi';

  @override
  String get deleteAllLabel => 'Hapus Semua';

  @override
  String get emptyStateTitle => 'Belum ada riwayat';

  @override
  String get emptyStateBody =>
      'Mulai pelacakan untuk melihat\nsesi lokasi Anda di sini.';

  @override
  String get settingLabel => 'Pengaturan';

  @override
  String get accuracyLabel => 'Akurasi';

  @override
  String trackedLocTitle(Object id) {
    return 'Lokasi $id';
  }

  @override
  String get startLabel => 'Mulai';

  @override
  String get endLabel => 'Selesai';

  @override
  String get ongoingLabel => 'Berlangsung';

  @override
  String get todayLabel => 'Hari ini';

  @override
  String get yesterdayLabel => 'Kemarin';

  @override
  String get deleteTrackedLocationConfirmationTitle => 'Yakin ingin menghapus?';

  @override
  String deleteTrackedLocationConfirmationBody(Object id) {
    return '\"Lokasi $id\" akan dihapus secara permanen.';
  }

  @override
  String get deleteAllDataConfirmationTitle =>
      'Yakin ingin menghapus semua data?';

  @override
  String get deleteAllDataConfirmationBody =>
      'Semua riwayat lokasi yang selesai akan dihapus secara permanen dan tidak dapat dikembalikan. Pelacakan yang sedang berlangsung akan tetap ada.';

  @override
  String get gpsAccuracyLabel => 'Akurasi GPS';

  @override
  String get gpsAccuracyDesc =>
      'Akurasi lebih tinggi menggunakan lebih banyak daya baterai';

  @override
  String get keepScreenOnLabel => 'Layar tetap menyala';

  @override
  String get keepScreenOnDesc =>
      'Mencegah layar mati saat pelacakan berlangsung';

  @override
  String get aboutLabel => 'Tentang';

  @override
  String get appVersionLabel => 'Versi aplikasi';

  @override
  String get intervalLabel => 'Interval';

  @override
  String get intervalDesc => 'Seberapa sering lokasi direkam';

  @override
  String get behaviourLabel => 'Perilaku Aplikasi';

  @override
  String get trackingLabel => 'Pelacakan';

  @override
  String get gpsNotActiveTitle => 'GPS Tidak Aktif';

  @override
  String get permissionIssueTitle => 'Permasalahan Izin';

  @override
  String get gpsNotActiveDesc =>
      'Aktifkan GPS/Layanan Lokasi di perangkat Anda untuk melanjutkan.';

  @override
  String get permissionDeniedForeverDesc =>
      'Izin lokasi ditolak secara permanen. Buka Pengaturan untuk mengaktifkannya.';

  @override
  String get permissionDeniedDesc =>
      'Aplikasi ini membutuhkan izin lokasi untuk berfungsi dengan baik.';

  @override
  String get notificationPermissionDeniedDesc =>
      'Izin notifikasi diperlukan untuk melacak lokasi di latar belakang. Aktifkan di Pengaturan.';

  @override
  String get settingTrackingWarningDesc =>
      '*Saat pelacakan berjalan, perubahan Pengaturan akan diterapkan pada sesi pelacakan berikutnya.';

  @override
  String get dataDeletedMessage => 'Data dihapus';

  @override
  String get recordsLabel => 'Lokasi';

  @override
  String get locationTrackingActiveTitle => 'Pelacakan Lokasi Aktif';

  @override
  String get saveFailedMessage => 'Gagal menyimpan lokasi';

  @override
  String get deleteFailedMessage => 'Gagal menghapus data';

  @override
  String get getDataFailedMessage => 'Gagal memuat data';

  @override
  String get saveSettingIntervalFailedMessage =>
      'Gagal menyimpan pengaturan Interval Pelacakan GPS';

  @override
  String get saveSettingAccuracyFailedMessage =>
      'Gagal menyimpan pengaturan Akurasi GPS';

  @override
  String get saveSettingKeepScreenOnFailedMessage =>
      'Gagal menyimpan pengaturan Layar Tetap Menyala';

  @override
  String get generalError => 'Terjadi kesalahan';
}
