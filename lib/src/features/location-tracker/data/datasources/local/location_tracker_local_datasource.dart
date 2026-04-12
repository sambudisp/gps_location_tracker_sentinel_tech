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
    } catch (e) {
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

  Future<List<TrackedLocationDataModel>> getTrackedLocationHistory() async {
    try {
      final result = await dbSqfliteHelper.execRawQuery('''
          SELECT * FROM tracked_location
          ORDER BY started_time DESC
        ''');
      return result.map((e) => TrackedLocationDataModel.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<TrackedLocationDataDetailModel>> getTrackedLocationHistoryDetail({required int? parentId}) async {
    try {
      final result = await dbSqfliteHelper.execRawQuery(
        '''
            SELECT * FROM tracked_location_detail
            WHERE parent_id = ?
            ORDER BY timestamp ASC
          ''',
        [parentId],
      );
      return result.map((e) => TrackedLocationDataDetailModel.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> deleteTrackedLocationHistory({required int? id}) async {
    try {
      await dbSqfliteHelper.execRawDelete(
        '''
          DELETE FROM tracked_location_detail
          WHERE parent_id = ?
        ''',
        [id],
      );
      final result = await dbSqfliteHelper.execRawDelete(
        '''
          DELETE FROM tracked_location
          WHERE id = ?
        ''',
        [id],
      );
      return result > 0;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteAllTrackedLocationHistory() async {
    try {
      await dbSqfliteHelper.execRawDelete('DELETE FROM tracked_location_detail');
      final result = await dbSqfliteHelper.execRawDelete('DELETE FROM tracked_location');
      return result > 0;
    } catch (e) {
      return false;
    }
  }

  Future<TrackedLocationDataModel?> getActiveTracking() async {
    try {
      final result = await dbSqfliteHelper.execRawQuery('''
        SELECT * FROM tracked_location
        WHERE stopped_time IS NULL
        LIMIT 1
      ''');
      if (result.isEmpty) return null;
      return TrackedLocationDataModel.fromMap(result.first);
    } catch (e) {
      return null;
    }
  }
}
