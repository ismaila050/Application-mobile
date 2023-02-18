import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer_null_safe/full_pdf_viewer_scaffold.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class DocumentPage extends StatefulWidget {
  final int entityId;
  final String entityType;

  const DocumentPage({
    required this.entityId,
    required this.entityType,
  });

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  final String _fileUrl =
      'https://dolibarr-documentation-5-0.readthedocs.io/en/5.0.6/_downloads/facture.pdf';
  bool _isDownloading = false;
  String _downloadMessage = '';
  double _downloadProgress = 0.0;

  Future<String?> _downloadFile(String url) async {
    final fileName = path.basename(url);
    final Directory? directory = await getExternalStorageDirectory();
    final String filePath = '${directory?.path}/$fileName';
    try {
      Dio dio = Dio();
      Response response = await dio.get(url,
          onReceiveProgress: (received, total) {
            setState(() {
              _isDownloading = true;
              _downloadMessage = 'Downloading file...';
              _downloadProgress = received / total;
            });
          }, options: Options(responseType: ResponseType.bytes));
      File file = File(filePath);
      await file.writeAsBytes(response.data, flush: true);
      setState(() {
        _isDownloading = false;
        _downloadMessage = 'Download complete.';
      });
      return fileName;
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _downloadMessage = 'Download failed.';
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.insert_drive_file),
              onPressed: () async {
                String? fileName = await _downloadFile(_fileUrl);
                if (fileName != null) {
                  final Directory? directory =
                  await getExternalStorageDirectory();
                  final String filePath =
                      '${directory?.path}/$fileName';
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DocumentViewerPage(
                        filePath: filePath,
                      ),
                    ),
                  );
                }
              },
            ),
            Text('Entity ID: ${widget.entityId}'),
            Text('Entity Type: ${widget.entityType}'),
          ],
        ),
      ),
    );
  }
}

class DocumentViewerPage extends StatelessWidget {
  final String filePath;

  const DocumentViewerPage({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Document Viewer'),
      ),
      body: Center(
        child: filePath != null
            ? PDFViewerScaffold(
          path: filePath,
        )
            : Text('File not found.'),
      ),
    );
  }
}

