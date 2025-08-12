
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:file_magic_number/file_magic_number.dart';
import 'package:mobile_app_template/core/utils/file/file_utility.dart';

void main() {
  group('TFileUtility', () {
    test('fileExtensionFromMagic returns correct extension', () {
      expect(TFileUtility.fileExtensionFromMagic(FileMagicNumberType.png), 'png');
      expect(TFileUtility.fileExtensionFromMagic(FileMagicNumberType.mp3), 'mp3');
      expect(TFileUtility.fileExtensionFromMagic(FileMagicNumberType.zip), 'zip');
      expect(TFileUtility.fileExtensionFromMagic(FileMagicNumberType.unknown), isNull);
    });

    test('isFileNameTextFile returns true for text-based extensions', () {
      expect(TFileUtility.isFileNameTextFile('notes.txt'), true);
      expect(TFileUtility.isFileNameTextFile('data.csv'), true);
      expect(TFileUtility.isFileNameTextFile('image.png'), false);
    });

    test('loadFileInIsolate reads file correctly', () async {
      // Create a temp file
      final tempFile = File('${Directory.systemTemp.path}/testfile.txt');
      const content = 'Hello from isolate!';
      await tempFile.writeAsString(content);

      final response = await TFileUtility.loadFileInIsolate(
        'testField',
        tempFile.path,
      );

      expect(response.error, isNull);
      expect(response.bytes, isNotNull);
      expect(String.fromCharCodes(response.bytes!), equals(content));
      expect(response.fileName, equals('testfile.txt'));
      expect(response.fieldName, equals('testField'));

      // Cleanup
      await tempFile.delete();
    });

    test('loadFileInIsolate handles file read error', () async {
      // Pass a non-existing file path
      final response = await TFileUtility.loadFileInIsolate(
        'testField',
        '/path/to/nonexistent/file.txt',
      );

      expect(response.error, isNotNull);
      expect(response.bytes, isNull);
    });
  });

    test('loadFileInIsolate reads a list of files correctly', () async {
    // Create multiple temp files
    final tempDir = Directory.systemTemp.createTempSync();
    final filesData = {
      'file1.txt': 'Content of file 1',
      'file2.txt': 'Content of file 2',
      'file3.txt': 'Content of file 3',
    };

    final filePaths = <String>[];
    for (final entry in filesData.entries) {
      final file = File('${tempDir.path}/${entry.key}');
      await file.writeAsString(entry.value);
      filePaths.add(file.path);
    }

    // Load files in parallel
    final responses = await Future.wait(
      filePaths.map((path) =>
          TFileUtility.loadFileInIsolate('testField', path)),
    );

    // Assertions
    for (int i = 0; i < responses.length; i++) {
      final response = responses[i];
      final fileName = filePaths[i].split(Platform.pathSeparator).last;
      final expectedContent = filesData[fileName];

      expect(response.error, isNull);
      expect(response.bytes, isNotNull);
      expect(String.fromCharCodes(response.bytes!), equals(expectedContent));
      expect(response.fileName, equals(fileName));
      expect(response.fieldName, equals('testField'));
    }

    // Cleanup
    await tempDir.delete(recursive: true);
  });

}
