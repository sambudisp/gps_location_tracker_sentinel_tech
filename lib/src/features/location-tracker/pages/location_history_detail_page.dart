import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_location_tracker_sentinel_tech/src/features/location-tracker/pages/widgets/location_history_detail/location_history_detail.dart';
import 'package:gps_location_tracker_sentinel_tech/src/shared/shared.dart';

import '../../../../assets/colors.gen.dart';
import '../../../core/core.dart';
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
        } else if (state.stateTrackedLocationHistoryDetail == RequestStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorCode?.toMessage(context) ?? context.l10n.generalError),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
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
                  CustomAppBar(title: context.l10n.trackedLocTitle(data.id.toString())),
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
                                  LocationHistoryDetailInformationBottomSheet(
                                    data: data,
                                    totalDetails: details.length,
                                    start: start,
                                    end: end,
                                    accuracy: lastAccuracy,
                                  ),
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
              final waypoints = details.map((e) => LatLng(e.latitude, e.longitude)).toList();
              _fitBounds(waypoints);
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
          Positioned(top: 12, left: 12, child: LocationHistoryDetailMapLegend()),
        ],
      ),
    );
  }
}
