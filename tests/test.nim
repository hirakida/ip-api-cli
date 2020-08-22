import unittest
import uri
include ipapi

suite "buildUri tests":
  test "no params":
    let uri = buildUri("", "")
    check $uri == "http://ip-api.com/json"

  test "query":
    let uri = buildUri("127.0.0.1", "")
    check $uri == "http://ip-api.com/json/127.0.0.1"

  test "lang":
    let uri = buildUri("", "ja")
    check $uri == "http://ip-api.com/json?lang=ja"

  test "query and lang":
    let uri = buildUri("127.0.0.1", "ja")
    check $uri == "http://ip-api.com/json/127.0.0.1?lang=ja"
