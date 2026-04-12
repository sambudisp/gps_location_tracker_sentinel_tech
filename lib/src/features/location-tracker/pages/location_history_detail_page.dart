import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_location_tracker_sentinel_tech/src/core/utils/shared_value.dart';

import '../../../../assets/colors.gen.dart';
import '../../../core/core.dart';
import '../core/helpers/time_helper.dart';
import '../data/data.dart';
import '../managers/bloc.dart';

class LocationHistoryDetailPage extends StatefulWidget {
  final TrackedLocationDataModel trackedLocationData;

  const LocationHistoryDetailPage({super.key, required this.trackedLocationData});

  @override
  State<LocationHistoryDetailPage> createState() => _LocationHistoryDetailPageState();
}

class _LocationHistoryDetailPageState extends State<LocationHistoryDetailPage> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    context.read<LocationTrackerBloc>().add(
      LocationTrackerEvent.getTrackedLocationHistoryDetail(parentId: widget.trackedLocationData.id!),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  void _mapData(List<TrackedLocationDataDetailModel> details) {
    final l10n = context.l10n;
    if (details.isEmpty) return;
    final waypoints = details.map((e) => LatLng(e.latitude, e.longitude)).toList();

    _markers = {
      Marker(
        markerId: MarkerId(l10n.startLabel.toLowerCase()),
        position: waypoints.first,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow: InfoWindow(title: l10n.startLabel),
      ),
      Marker(
        markerId: MarkerId(l10n.endLabel.toLowerCase()),
        position: waypoints.last,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: l10n.endLabel),
      ),
    };

    _polylines = {
      Polyline(
        polylineId: const PolylineId('path'),
        points: waypoints,
        color: ColorName.primary,
        width: 4,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.round,
      ),
    };
  }

  LatLngBounds _getBounds(List<LatLng> waypoints) {
    final lats = waypoints.map((e) => e.latitude);
    final lngs = waypoints.map((e) => e.longitude);
    return LatLngBounds(
      southwest: LatLng(lats.reduce((a, b) => a < b ? a : b), lngs.reduce((a, b) => a < b ? a : b)),
      northeast: LatLng(lats.reduce((a, b) => a > b ? a : b), lngs.reduce((a, b) => a > b ? a : b)),
    );
  }

  void _fitBounds(List<LatLng> waypoints) {
    if (waypoints.length < 2) return;
    _mapController?.animateCamera(CameraUpdate.newLatLngBounds(_getBounds(waypoints), 60));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationTrackerBloc, LocationTrackerState>(
      listenWhen: (prev, curr) => prev.stateTrackedLocationHistoryDetail != curr.stateTrackedLocationHistoryDetail,
      listener: (context, state) {
        if (state.stateTrackedLocationHistoryDetail == RequestStatus.success) {
          setState(() {
            _mapData(state.trackedLocationHistoryDetail);
          });
        } else if (state.stateTrackedLocationHistoryDetail == RequestStatus.error) {}
      },
      builder: (context, state) {
        final data = widget.trackedLocationData;
        final start = DateTime.parse(data.startedTime);
        final end = data.stoppedTime != null ? DateTime.parse(data.stoppedTime!) : null;
        final details = state.trackedLocationHistoryDetail;
        final lastAccuracy = details.isNotEmpty ? details.last.accuracy : null;
        final isLoading = state.stateTrackedLocationHistoryDetail == RequestStatus.loading;

        return Scaffold(
          body: Container(
            decoration: AppDecorations.mainGradientBackground,
            child: SafeArea(
              child: Column(
                children: [
                  _appBar(data),
                  context.vWhitespace(4),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: context.borderRadius20pt,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        decoration: BoxDecoration(color: ColorName.grey, borderRadius: context.borderRadius20pt),
                        child: isLoading
                            ? Center(child: CircularProgressIndicator(color: ColorName.primary))
                            : Column(
                                children: [
                                  Expanded(child: _map(details)),
                                  _informationBottomSheet(data: data, start: start, end: end, accuracy: lastAccuracy),
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
      },
    );
  }

  Widget _appBar(TrackedLocationDataModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(color: ColorName.white.withValues(alpha: 0.15), shape: BoxShape.circle),
              child: const Icon(Icons.arrow_back, color: ColorName.white, size: 18),
            ),
          ),
          Expanded(
            child: Text(
              context.l10n.trackedLocTitle(data.id.toString()),
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorName.white, fontSize: 16, fontWeight: FontWeight.w800),
            ),
          ),
          context.hWhitespace(16),
        ],
      ),
    );
  }

  Widget _map(List<TrackedLocationDataDetailModel> details) {
    final initialTarget = details.isNotEmpty
        ? LatLng(details.first.latitude, details.first.longitude)
        : const LatLng(-6.2695696, 106.8293371);

    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: context.radius20pt),
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: initialTarget, zoom: 15),
            markers: _markers,
            polylines: _polylines,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapToolbarEnabled: false,
            onMapCreated: (controller) {
              _mapController = controller;
              WidgetsBinding.instance.addPostFrameCallback((_) {
                final waypoints = details.map((e) => LatLng(e.latitude, e.longitude)).toList();
                _fitBounds(waypoints);
              });
            },
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: GestureDetector(
              onTap: () {
                final waypoints = details.map((e) => LatLng(e.latitude, e.longitude)).toList();
                _fitBounds(waypoints);
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: ColorName.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: ColorName.black.withValues(alpha: 0.08), blurRadius: 6)],
                ),
                child: const Icon(Icons.my_location, color: ColorName.primary, size: 18),
              ),
            ),
          ),
          _buildMapLegend(),
        ],
      ),
    );
  }

  Widget _buildMapLegend() {
    final l10n = context.l10n;
    return Positioned(
      top: 12,
      left: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: context.borderRadius28pt,
          boxShadow: [BoxShadow(color: ColorName.black.withValues(alpha: 0.08), blurRadius: 6)],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _legendDot(ColorName.green),
            context.hWhitespace(4),
            Text(
              l10n.startLabel,
              style: const TextStyle(fontSize: 10, color: ColorName.black, fontWeight: FontWeight.w600),
            ),
            context.hWhitespace(10),
            _legendDot(ColorName.coralRed),
            context.hWhitespace(4),
            Text(
              l10n.endLabel,
              style: const TextStyle(fontSize: 10, color: ColorName.black, fontWeight: FontWeight.w600),
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

  Widget _informationBottomSheet({
    required TrackedLocationDataModel data,
    required DateTime start,
    required DateTime? end,
    required String? accuracy,
  }) {
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.vertical(bottom: context.radius20pt),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.trackedLocTitle(data.id.toString()),
            style: TextStyle(color: ColorName.black, fontSize: 14, fontWeight: FontWeight.w800),
          ),
          context.vWhitespace(2),
          Text(
            end != null
                ? '${TimeHelper().formatDate(start.toString())}  ·  ${TimeHelper().formatTime(start)} — ${TimeHelper().formatTime(end)}'
                : '${TimeHelper().formatDate(start.toString())}  ·  ${TimeHelper().formatTime(start)} — ongoing',
            style: TextStyle(color: ColorName.darkGrey, fontSize: 10),
          ),
          context.vWhitespace(14),
          Row(
            children: [
              _statItem(Icons.timer_outlined, TimeHelper().duration(data.duration), l10n.durationLabel),
              Container(width: 1, height: 36, color: ColorName.divGrey),
              _statItem(Icons.gps_fixed_sharp, accuracy.capitalizeWords() ?? '-', l10n.accuracyLabel),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statItem(IconData icon, String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: ColorName.primary, size: 16),
          context.vWhitespace(4),
          Text(
            value,
            style: const TextStyle(color: ColorName.black, fontSize: 12, fontWeight: FontWeight.w800),
          ),
          Text(label, style: TextStyle(color: ColorName.darkGrey, fontSize: 10)),
        ],
      ),
    );
  }
}
