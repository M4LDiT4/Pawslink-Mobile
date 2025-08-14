

import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:mobile_app_template/data/local_storage/isar/model/animal_model.dart';
import 'package:path_provider/path_provider.dart';

/// Sync Flow:
/// 1. Check for internet connection or listen for connection changes.
/// 2. If connected:
///    a. Check for new updates (e.g., from API or remote DB).
///    b. If updates exist:
///       i.   Fetch documents in batches of 50.
///       ii.  Save/update the documents in the local database (Isar).
///       iii. Extract and save image URLs in the local DB with reference to the documents.
///       iv.  Download images **one by one or in parallel (with rate-limiting)**.
///       v.   Save images to local storage (e.g., app directory).
///       vi.  Update the image paths (relative/local) in the database.
///    c. If no updates: Do nothing.
/// 3. If there's an error at any stage:
///    a. Log it (for diagnostics).
///    b. Optionally notify the user (non-blocking message/snackbar).

class AppSyncService {

  AppSyncService();

  Future<void> checkAndUpdateAnimals() async{

  }
}