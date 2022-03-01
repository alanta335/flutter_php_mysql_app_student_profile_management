import 'package:http/http.dart' as http;

class url_create{
    static Uri uri_cr(String php_file)
    {
        Uri url = Uri(
        scheme: "http",
        host: '192.168.0.101',
        path: '/flutter/$php_file');
        return url;
    }
}