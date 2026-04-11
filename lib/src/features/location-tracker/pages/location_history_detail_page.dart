import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/constants/app_decoration.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/utils/shared_value.dart';

// ─── Model ───────────────────────────────────────────────────────────────────

class LocationHistoryDetailModel {
  final String id;
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final List<LatLng> waypoints;

  const LocationHistoryDetailModel({
    required this.id,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.waypoints,
  });

  String get duration {
    final diff = endTime.difference(startTime);
    final h = diff.inHours;
    final m = diff.inMinutes % 60;
    if (h > 0) return '${h}h ${m}m';
    return '${m}m';
  }

  double get distanceKm {
    // TODO: hitung jarak real dari waypoints
    return 0.0;
  }
}

// ─── Dummy Data ───────────────────────────────────────────────────────────────

final _dummyDetail = LocationHistoryDetailModel(
  id: '1',
  title: 'Morning commute',
  startTime: DateTime(2026, 4, 11, 8, 12),
  endTime: DateTime(2026, 4, 11, 8, 47),
  waypoints: const [
    LatLng(-6.2000, 106.8180), // Start
    LatLng(-6.1985, 106.8165), // belok kiri
    LatLng(-6.1970, 106.8190), // belok kanan
    LatLng(-6.1958, 106.8175), // belok kiri
    LatLng(-6.1945, 106.8205), // belok kanan
    LatLng(-6.1930, 106.8185), // belok kiri
    LatLng(-6.1918, 106.8215), // belok kanan
    LatLng(-6.1905, 106.8200), // belok kiri
    LatLng(-6.1890, 106.8230), // belok kanan
    LatLng(-6.1878, 106.8210), // belok kiri
    LatLng(-6.1865, 106.8245), // belok kanan
    LatLng(-6.1850, 106.8225), // belok kiri
    LatLng(-6.1835, 106.8255), // belok kanan
    LatLng(-6.1820, 106.8270), // lurus sedikit
    LatLng(-6.1900, 106.8320), // End
  ],
);

// ─── Page ─────────────────────────────────────────────────────────────────────

class LocationHistoryDetailPage extends StatefulWidget {
  final LocationHistoryDetailModel? detail;

  const LocationHistoryDetailPage({super.key, this.detail});

  @override
  State<LocationHistoryDetailPage> createState() => _LocationHistoryDetailPageState();
}

class _LocationHistoryDetailPageState extends State<LocationHistoryDetailPage> {
  static const Color primary = Color(0xFF087dee);
  static const Color darkBlue = Color(0xFF2E2E6A);
  static const Color cardBg = Color(0xFFF0F4F8);

  GoogleMapController? _mapController;
  late final LocationHistoryDetailModel _detail;
  late final Set<Marker> _markers;
  late final Set<Polyline> _polylines;

  @override
  void initState() {
    super.initState();
    _detail = widget.detail ?? _dummyDetail;
    _markers = _buildMarkers();
    _polylines = _buildPolylines();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  // ─── Map Helpers ───────────────────────────────────────────────────────────

  Set<Marker> _buildMarkers() {
    if (_detail.waypoints.isEmpty) return {};
    return {
      Marker(
        markerId: const MarkerId('start'),
        position: _detail.waypoints.first,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: const InfoWindow(title: 'Start'),
      ),
      Marker(
        markerId: const MarkerId('end'),
        position: _detail.waypoints.last,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: const InfoWindow(title: 'End'),
      ),
    };
  }

  Set<Polyline> _buildPolylines() {
    if (_detail.waypoints.isEmpty) return {};
    return {
      Polyline(
        polylineId: const PolylineId('path'),
        points: _detail.waypoints,
        color: primary,
        width: 4,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.round,
      ),
    };
  }

  LatLngBounds _getBounds() {
    final lats = _detail.waypoints.map((e) => e.latitude);
    final lngs = _detail.waypoints.map((e) => e.longitude);
    return LatLngBounds(
      southwest: LatLng(lats.reduce((a, b) => a < b ? a : b), lngs.reduce((a, b) => a < b ? a : b)),
      northeast: LatLng(lats.reduce((a, b) => a > b ? a : b), lngs.reduce((a, b) => a > b ? a : b)),
    );
  }

  void _fitBounds() {
    if (_detail.waypoints.length < 2) return;
    _mapController?.animateCamera(CameraUpdate.newLatLngBounds(_getBounds(), 60));
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String _formatDate(DateTime dt) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${dt.day} ${months[dt.month - 1]} ${dt.year}';
  }

  // ─── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecorations.mainGradientBackground,
        child: SafeArea(
          child: Column(
            children: [
              _appBar(),
              const SizedBox(height: 4),
              Expanded(
                child: ClipRRect(
                  borderRadius: context.borderRadius20pt,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    decoration: BoxDecoration(color: cardBg, borderRadius: context.borderRadius20pt),
                    child: Column(
                      children: [
                        Expanded(child: _buildMap()),
                        _buildBottomSheet(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── App Bar ───────────────────────────────────────────────────────────────

  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), shape: BoxShape.circle),
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 18),
            ),
          ),
          Expanded(
            child: Text(
              _detail.title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
          context.hWhitespace(36),
        ],
      ),
    );
  }

  // ─── Map ───────────────────────────────────────────────────────────────────

  Widget _buildMap() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: context.radius20pt),
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _detail.waypoints.isNotEmpty ? _detail.waypoints.first : const LatLng(-6.2, 106.8),
              zoom: 15,
            ),
            markers: _markers,
            polylines: _polylines,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            onMapCreated: (controller) {
              _mapController = controller;
              WidgetsBinding.instance.addPostFrameCallback((_) => _fitBounds());
            },
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: GestureDetector(
              onTap: _fitBounds,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 6)],
                ),
                child: const Icon(Icons.my_location, color: primary, size: 18),
              ),
            ),
          ),
          _buildMapLegend(),
        ],
      ),
    );
  }

  Widget _buildMapLegend() {
    return Positioned(
      top: 12,
      left: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 6)],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _legendDot(const Color(0xFF08a85a)),
            const SizedBox(width: 4),
            const Text(
              'Start',
              style: TextStyle(fontSize: 11, color: darkBlue, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 10),
            _legendDot(const Color(0xFFe03030)),
            const SizedBox(width: 4),
            const Text(
              'End',
              style: TextStyle(fontSize: 11, color: darkBlue, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _legendDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  // ─── Bottom Sheet ──────────────────────────────────────────────────────────

  Widget _buildBottomSheet() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _detail.title,
                      style: const TextStyle(color: darkBlue, fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${_formatDate(_detail.startTime)}  ·  ${_formatTime(_detail.startTime)} — ${_formatTime(_detail.endTime)}',
                      style: const TextStyle(color: Colors.grey, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              _buildStatItem(Icons.location_on_outlined, '${_detail.waypoints.length}', 'waypoints'),
              _buildStatDivider(),
              _buildStatItem(Icons.timer_outlined, _detail.duration, 'duration'),
              _buildStatDivider(),
              _buildStatItem(Icons.route_outlined, '${_detail.distanceKm.toStringAsFixed(1)} km', 'distance'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: primary, size: 16),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(color: darkBlue, fontSize: 13, fontWeight: FontWeight.w800),
          ),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(width: 0.5, height: 36, color: const Color(0xFFEEEEEE));
  }
}
