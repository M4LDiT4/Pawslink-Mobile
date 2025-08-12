
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
}
