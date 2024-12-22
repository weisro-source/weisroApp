import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/data/service_repo/service_repo.dart';
import 'package:weisro/generated/l10n.dart';

part 'add_service_state.dart';

class AddServiceCubit extends Cubit<AddServiceState> {
  AddServiceCubit() : super(AddServiceInitial());
  static AddServiceCubit get(context) => BlocProvider.of(context);
  TextEditingController pricePerHourController = TextEditingController();
  TextEditingController pricePerDayController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController serviceNameController = TextEditingController();
  List<String> days = [];
  DateTime startDateTime = DateTime.now();
  DateTime endDateTime = DateTime.now().add(const Duration(hours: 5));
  String? errorMessage;
  String? categoryId;
  Map<String, Map<String, TimeOfDay?>> serviceDaysState = {};

  /// Format the startDateTime to 'hh:mm'
  String get formattedStartTime {
    return DateFormat('hh:mm a').format(startDateTime);
  }

  /// Format the endDateTime to 'hh:mm'
  String get formattedEndTime {
    return DateFormat('hh:mm a').format(endDateTime);
  }

  final List<String> imagePaths = []; // Store image paths
  String selectedRentTime = Constants.bothKey; // Default rent time
  String? selectedLocationName; // Store the name of the selected location
  Location? selectedLocation; // Store latitude and longitude
  void updateRentTime(String rentTime) {
    selectedRentTime = rentTime;
    emit(AddServiceStateChanged());
  }

  void updateLocation(String locationName, Location location) {
    selectedLocationName = locationName;
    selectedLocation = location;
    emit(AddServiceStateChanged());
  }

  /// Dynamically create a new ServiceModel instance
  ServiceModel get newService {
    List<Day> formattedDays = serviceDaysState.entries.map((entry) {
      final day = entry.key; // The day name, e.g., "Sunday"
      final times = entry.value; // The time map with "start" and "end"
      return Day(
        day: day,
        start: times['start']?.toString(),
        end: times['end']?.toString(),
      );
    }).toList();
    return ServiceModel(
        service: Service(
            dailyPrice: num.tryParse(pricePerDayController.text) ?? 0,
            hourlyPrice: num.tryParse(pricePerHourController.text) ?? 0,
            images: imagePaths,
            description: descriptionController.text,
            days: formattedDays,
            name: serviceNameController.text,
            location: const Location(latitude: 20, longitude: 30),
            time: Time(start: formattedStartTime, end: formattedEndTime)));
  }

  /// Validate all inputs and return a boolean
  bool validateInputs(BuildContext context) {
    // Reset the error message
    errorMessage = null;

    List<String> errors = [];
    if (serviceNameController.text.isEmpty) {
      errors.add(S.of(context).service_name_missing);
    }
    if (selectedRentTime == Constants.dailyKey ||
        selectedRentTime == Constants.bothKey) {
      if (pricePerDayController.text.isEmpty ||
          num.tryParse(pricePerDayController.text) == null) {
        errors.add(S.of(context).daily_price_invalid);
      }
    }

    if (selectedRentTime == Constants.hoursKey ||
        selectedRentTime == Constants.bothKey) {
      if (pricePerHourController.text.isEmpty ||
          num.tryParse(pricePerHourController.text) == null) {
        errors.add(S.of(context).hourly_price_invalid);
      }
    }

    if (descriptionController.text.isEmpty) {
      errors.add(S.of(context).description_missing);
    }

    if (serviceDaysState.isEmpty) {
      errors.add(S.of(context).days_missing);
    }
    if (imagePaths.isEmpty) {
      errors.add(S.of(context).images_missing);
    }

    // If there are any errors, set the error message and return false
    if (errors.isNotEmpty) {
      errorMessage = errors.join("\n"); // Combine all errors into one message
      return false;
    }

    // If all fields are valid, return true
    return true;
  }

  /// Validate Inputs and Return API Data
  Map<String, dynamic>? prepareApiData(BuildContext context) {
    // Compile data for API

    // Format days as a list of objects with day, start, and end
    List<Map<String, String?>> formattedDays =
        serviceDaysState.entries.map((entry) {
      final dayKey = entry.key;
      final timeMap = entry.value;
      return {
        "day": dayKey,
        "start": timeMap['start']?.format(context),
        "end": timeMap['end']?.format(context),
      };
    }).toList();
    return {
      "description": descriptionController.text,
      "name": serviceNameController.text,
      "time": {
        "start": formattedStartTime,
        "end": formattedEndTime,
      },
      "category_id": categoryId,
      "location": {
        "latitude": selectedLocation?.latitude ?? "52.517669999",
        "longitude": selectedLocation?.longitude ?? "13.405537999",
      },
      "days": formattedDays,
      "daily_price": num.tryParse(pricePerDayController.text) ?? 0,
      "hourly_price": num.tryParse(pricePerHourController.text) ?? 0,
      "images": imagePaths,
    };
  }

  Future<FormData> prepareFormData(Map<String, dynamic> apiData) async {
    // Prepare FormData
    FormData formData = FormData();

    apiData.forEach((key, value) {
      if (value is String || value is num) {
        formData.fields.add(MapEntry(key, value.toString()));
      } else if (key == "time") {
        formData.fields.add(MapEntry("time[start]", value["start"]));
        formData.fields.add(MapEntry("time[end]", value["end"]));
      } else if (key == "location") {
        formData.fields
            .add(MapEntry("location[latitude]", value["latitude"].toString()));
        formData.fields.add(
            MapEntry("location[longitude]", value["longitude"].toString()));
      } else if (key == "days") {
        List<Map<String, String?>> days =
            List<Map<String, String?>>.from(value);
        for (int i = 0; i < days.length; i++) {
          formData.fields.add(MapEntry("days[$i][day]", days[i]["day"] ?? ""));
          formData.fields
              .add(MapEntry("days[$i][start]", days[i]["start"] ?? ""));
          formData.fields.add(MapEntry("days[$i][end]", days[i]["end"] ?? ""));
        }
      }
    });

    if (apiData["images"] != null) {
      List<String> images = apiData["images"];
      for (String imagePath in images) {
        formData.files.add(
          MapEntry(
            "images",
            await MultipartFile.fromFile(imagePath,
                filename: imagePath.split('/').last),
          ),
        );
      }
    }

    return formData;
  }

  bool isDaily() {
    return selectedRentTime == Constants.dailyKey ||
        selectedRentTime == Constants.bothKey;
  }

  bool isHourly() {
    return selectedRentTime == Constants.hoursKey ||
        selectedRentTime == Constants.bothKey;
  }

  Future<void> addServiceCallApi(BuildContext context) async {
    emit(AddServiceStateLoading());
    FormData formData = await prepareFormData(prepareApiData(context) ?? {});
    if (context.mounted) {
      var result =
          await getIt.get<ServiceRepository>().addService(context, formData);
      result.fold(
        (errorInAddService) {
          emit(AddServiceStateFailure(error: errorInAddService));
        },
        (serviceAdded) {
          emit(AddServiceStateSuccess());
        },
      );
    }
  }
}
