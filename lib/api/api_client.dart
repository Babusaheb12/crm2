import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:http_parser/http_parser.dart'; // For MediaType

import 'package:get/get_connect/http/src/request/request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:http/http.dart' as Http;

import '../util/app_constants.dart';
import 'api.dart';

class ApiClient extends GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static final String noInternetMessage = 'connection_to_api_server_failed'.tr;
  final int timeoutInSeconds = 30;

  String? token;
  Map<String, String>? _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppContants.token);
    if(Foundation.kDebugMode) {
      print('Token: $token');
    }

    if(token != null) {
      updateHeader(token!);
    }
    else
    {
      updateHeader("");
    }
  }

  void updateHeader(String token) {
    Map<String, String> _header = {
      'Content-Type': 'application/json',
      'Access-Token':'$token',


    };

    _mainHeaders = _header;
  }

  Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      Http.Response _response = await Http.get(
        Uri.parse(appBaseUrl+uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      print('------------${e.toString()}');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> getDataOther(String uri, {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      print('API Request: GET $uri');
      Http.Response _response = await Http.get(
        Uri.parse(uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      print('API Response: ${_response.statusCode} for $uri');
      return handleResponse(_response, uri);
    } catch (e) {
      print('API Error: ${e.toString()} for $uri');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postDataOther(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: ${body}');
      }
      print('API Request: POST $uri with body: ${body}');
      
      // Set the content type based on headers
      Map<String, String> requestHeaders = {
        ...?_mainHeaders,
        ...?headers,
      };
      
      // Determine request body format based on content type
      dynamic requestBody;
      if (requestHeaders['Content-Type'] == 'application/json') {
        requestBody = jsonEncode(body);
      } else {
        // Default to form-encoded if not specified as JSON
        String formBody = _encodeFormData(body);
        requestBody = formBody;
        // Set form-encoded content type if not already set
        if (requestHeaders['Content-Type'] == null || 
            requestHeaders['Content-Type'] != 'application/json') {
          requestHeaders['Content-Type'] = 'application/x-www-form-urlencoded';
        }
      }
      
      Http.Response _response = await Http.post(
        Uri.parse(uri),
        body: requestBody,
        headers: requestHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      print('API Response: ${_response.statusCode} for $uri');
      return handleResponse(_response, uri);
    } catch (e) {
      print('API Error: ${e.toString()} for $uri');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }
  
  String _encodeFormData(Map<String, dynamic> body) {
    return body.entries
        .map((entry) => '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value.toString())}')
        .join('&');
  }

  Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: ${appBaseUrl!+uri}\nHeader: $_mainHeaders');
        print('====> API Body: ${jsonEncode(body)}');
      }
      Http.Response _response = await Http.post(
        Uri.parse(appBaseUrl!+uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> facePost(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body');
      }
      Http.Response _response = await Http.post(
        Uri.parse("https://test.peaksender.com/"+uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }


  Future<Response> putData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body');
      }
      Http.Response _response = await Http.put(
        Uri.parse(appBaseUrl!+uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> updateCandidateStatus(String candidateId, String status) async {
    try {
      final String uri = '${appBaseUrl}${ApiUrls.updateCandidate}';
      final Map<String, dynamic> body = {
        'candidate_id': candidateId,
        'status': status,
      };
      
      if(Foundation.kDebugMode) {
        print('====> Update Candidate Status API Call: $uri');
        print('====> Request Body: ${jsonEncode(body)}');
        print('====> Headers: $_mainHeaders');
      }
      
      Http.Response _response = await Http.post(
        Uri.parse(uri),
        body: jsonEncode(body),
        headers: _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      
      return handleResponse(_response, uri);
    } catch (e) {
      if(Foundation.kDebugMode) {
        print('Update Candidate Status API Error: ${e.toString()}');
      }
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body');
      }
      Http.Response _response = await Http.delete(
        Uri.parse(appBaseUrl!+uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteCandidate(String candidateId) async {
    try {
      final String uri = '${appBaseUrl}${ApiUrls.deleteCandidate}';
      final Map<String, dynamic> body = {
        'candidate_id': candidateId,
      };
      
      if(Foundation.kDebugMode) {
        print('====> Delete Candidate API Call: $uri');
        print('====> Request Body: ${jsonEncode(body)}');
        print('====> Headers: $_mainHeaders');
      }
      
      Http.Response _response = await Http.post(
        Uri.parse(uri),
        body: jsonEncode(body),
        headers: _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      
      return handleResponse(_response, uri);
    } catch (e) {
      if(Foundation.kDebugMode) {
        print('Delete Candidate API Error: ${e.toString()}');
      }
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body with ${multipartBody.length} picture');
      }
      Http.MultipartRequest _request = Http.MultipartRequest('POST', Uri.parse(appBaseUrl!+uri));
      _request.headers.addAll(headers ?? _mainHeaders!);

      print("file => ${multipartBody.length}");

      if(multipartBody.isNotEmpty && multipartBody.length !=0) {
        for(MultipartBody multipart in multipartBody) {
          if(multipart.file != null) {
            Uint8List _list = await multipart.file.readAsBytes();
            _request.files.add(Http.MultipartFile(
              multipart.key, multipart.file.readAsBytes().asStream(), _list.length,
              filename: '${DateTime.now().toString()}.png',
              contentType: MediaType('image', 'png'),
            ));

          }
        }
      }

      _request.fields.addAll(body);

      Http.Response _response = await Http.Response.fromStream(await _request.send());
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipart1Data(String uri, Map<String, String> body, List<MultipartBody> multipartBody, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body with ${multipartBody.length} video');
      }
      Http.MultipartRequest _request = Http.MultipartRequest('POST', Uri.parse(appBaseUrl!+uri));
      _request.headers.addAll(headers ?? _mainHeaders!);

      print("file => ${multipartBody.length}");

      if(multipartBody.isNotEmpty && multipartBody.length !=0) {
        for(MultipartBody multipart in multipartBody) {
          if(multipart.file != null) {
            Uint8List _list = await multipart.file.readAsBytes();
            _request.files.add(Http.MultipartFile(
              multipart.key, multipart.file.readAsBytes().asStream(), _list.length,
              filename: '${DateTime.now().toString()}.mp4',
              contentType: MediaType('video', 'mp4'),
            ));

          }
        }
      }

      _request.fields.addAll(body);

      Http.Response _response = await Http.Response.fromStream(await _request.send());
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }
  
  Future<Response> uploadFile(String uri, String filePath, String fieldName, {Map<String, String>? headers, String? contentType}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> File Upload API Call: $uri\nHeader: $_mainHeaders\nField: $fieldName');
      }
      
      Http.MultipartRequest _request = Http.MultipartRequest('POST', Uri.parse(appBaseUrl!+uri));
      
      // Set proper headers for multipart request, overriding the default JSON content type
      Map<String, String> requestHeaders = {
        ...?_mainHeaders,
        ...?headers,
      };
      // Remove Content-Type if it's set to JSON since multipart will set its own
      if (requestHeaders['Content-Type']?.contains('application/json') == true) {
        requestHeaders.remove('Content-Type');
      }
      _request.headers.addAll(requestHeaders);
      
      // Add the file to the request
      File file = File(filePath);
      Uint8List _list = await file.readAsBytes();
      String fileName = file.path.split('/').last;
      
      _request.files.add(Http.MultipartFile(
        fieldName, 
        file.readAsBytes().asStream(), 
        _list.length,
        filename: fileName,
        contentType: contentType != null ? MediaType.parse(contentType) : null,
      ));
      
      Http.Response _response = await Http.Response.fromStream(await _request.send());
      print('File Upload Response: ${_response.statusCode} for $uri');
      return handleResponse(_response, uri);
    } catch (e) {
      print('File Upload Error: ${e.toString()} for $uri');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }
  
  Future<Response> uploadImage(String uri, String imagePath, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> Image Upload API Call: $uri\nHeader: $_mainHeaders');
      }
      
      Http.MultipartRequest _request = Http.MultipartRequest('POST', Uri.parse(appBaseUrl!+uri));
      
      // Set proper headers for multipart request, overriding the default JSON content type
      Map<String, String> requestHeaders = {
        ...?_mainHeaders,
        ...?headers,
      };
      // Remove Content-Type if it's set to JSON since multipart will set its own
      if (requestHeaders['Content-Type']?.contains('application/json') == true) {
        requestHeaders.remove('Content-Type');
      }
      _request.headers.addAll(requestHeaders);
      
      // Add the image file to the request
      File imageFile = File(imagePath);
      Uint8List _list = await imageFile.readAsBytes();
      String fileName = imageFile.path.split('/').last;
      
      _request.files.add(Http.MultipartFile(
        'image', 
        imageFile.readAsBytes().asStream(), 
        _list.length,
        filename: fileName,
        contentType: MediaType('image', 'jpeg'),
      ));
      
      Http.Response _response = await Http.Response.fromStream(await _request.send());
      print('Image Upload Response: ${_response.statusCode} for $uri');
      return handleResponse(_response, uri);
    } catch (e) {
      print('Image Upload Error: ${e.toString()} for $uri');
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> faceVerifyPostData(String uri, Map<String, String> body, List<MultipartBody> multipartBody, {Map<String, String>? headers}) async {
    try {
      if(Foundation.kDebugMode) {
        print('====> API Call: $uri\nHeader: $_mainHeaders');
        print('====> API Body: $body with ${multipartBody.length} picture');
      }
      Http.MultipartRequest _request = Http.MultipartRequest('POST', Uri.parse("https://test.peaksender.com/"+uri));
      _request.headers.addAll(headers ?? _mainHeaders!);

      print("file => ${multipartBody.length}");

      if(multipartBody.isNotEmpty && multipartBody.length !=0) {
        for(MultipartBody multipart in multipartBody) {
          if(multipart.file != null) {
            Uint8List _list = await multipart.file.readAsBytes();
            _request.files.add(Http.MultipartFile(
              multipart.key, multipart.file.readAsBytes().asStream(), _list.length,
              filename: '${DateTime.now().toString()}.png',
            ));
          }
        }
      }

      _request.fields.addAll(body);

      Http.Response _response = await Http.Response.fromStream(await _request.send());
      return handleResponse(_response, uri);
    } catch (e) {
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }


  Response handleResponse(Http.Response response, String uri) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    }catch(e) {}
    Response _response = Response(
      body: _body != null ? _body : response.body, bodyString: response.body.toString(),
      request: Request(headers: response.request!.headers, method: response.request!.method, url: response.request!.url),
      headers: response.headers, statusCode: response.statusCode, statusText: response.reasonPhrase,
    );
    if(_response.statusCode != 200 && _response.body != null && _response.body is !String) {
      if(_response.body.toString().startsWith('{errors: [{code:')) {
        dynamic _errorResponse = jsonDecode(_response.body);
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _errorResponse.errors[0].message);
      }else if(_response.body.toString().startsWith('{message')) {
        _response = Response(statusCode: _response.statusCode, body: _response.body, statusText: _response.body['message']);
      }
    }else if(_response.statusCode != 200 && _response.body == null) {
      _response = Response(statusCode: 0, statusText: noInternetMessage);
    }
    if(Foundation.kDebugMode) {
      print('====> API Response: [${_response.statusCode}] $uri\n${_response.body}');
    }
    return _response;
  }
}

class MultipartBody {
  String key;
  XFile file;

  MultipartBody(this.key, this.file);
}
