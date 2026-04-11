import '../../../../../core/core.dart';
import '../../data.dart';

class LocationTrackerLocalDatasource {
  LocationTrackerLocalDatasource(this.dbSqfliteHelper);

  final DbSqfliteHelper dbSqfliteHelper;

  Future<TrackedLocationDataModel?> insertTrackedLocationData(TrackedLocationDataModel data) async {
    try {
      final id = await dbSqfliteHelper.execRawInsert(
        '''
          INSERT INTO tracked_location (
            started_time,
            stopped_time,
            duration
          ) VALUES (?, ?, ?)
         ''',
        [data.startedTime, data.stoppedTime, data.duration],
      );

      return data.copyWith(id: id);
    } catch (e, stackTrace) {
      return null;
    }
  }

  Future<int> updateTrackedLocationData({required int id, required String stoppedTime, required int duration}) async {
    int result;
    try {
      result = await dbSqfliteHelper.execRawInsert(
        '''
          UPDATE tracked_location
          SET stopped_time = ?, duration = ?
          WHERE id = ?
          ''',
        [stoppedTime, duration, id],
      );
    } catch (e) {
      result = -1;
    }
    return result;
  }

  Future<int> insertTrackedLocationDataDetail(TrackedLocationDataDetailModel data) async {
    int result;
    try {
      result = await dbSqfliteHelper.execRawInsert('''
        INSERT INTO tracked_location_detail (
          parent_id,
          latitude,
          longitude,
          timestamp,
          accuracy
        ) VALUES (?, ?, ?, ?, ?)
        ''', data.toMap().values.toList());
    } catch (e) {
      result = -1;
    }
    return result;
  }
}
