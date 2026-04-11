init: clean get build-runner l10n asset-gen

pods-clean:
	rm -Rf ios/Pods ; \
	rm -Rf ios/.symlinks ; \
	rm -Rf ios/Flutter/Flutter.framework ; \
	rm -Rf ios/Flutter/Flutter.podspec ; \
	rm ios/Podfile.lock ; \

clean:
	echo "Cleaning the project" ; \
	flutter clean ; \

get:
	echo "Updating dependencies" ; \
	flutter pub get ; \

fix:
	echo "Cleaning Problems" ;\
	dart fix --apply ;\

build-runner:
	echo "Generating needed codes (Build-Runner)" ; \
	dart run build_runner build --delete-conflicting-outputs ; \

l10n:
	echo "Generating localized texts" ; \
	flutter gen-l10n ; \

asset-gen:
	echo "Generating assets flutter_gen" ; \
	fluttergen -c pubspec.yaml ; \

run:
	flutter run --dart-define-from-file=.env -v -t lib/main.dart;\

release-ios:
	flutter build ipa --dart-define-from-file=.env -t lib/main.dart --obfuscate --split-debug-info=build/app/outputs/symbols ; \

release-android:
	flutter build appbundle --dart-define-from-file=.env -t lib/main.dart --obfuscate --split-debug-info=build/app/outputs/symbols ; \