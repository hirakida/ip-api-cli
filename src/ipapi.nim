import cligen
import httpClient
import json
import uri

const baseUrl = "http://ip-api.com/json"

proc buildUri(query: string = "", lang: string = ""): Uri =
  if query.len > 0 and lang.len > 0:
    return parseUri(baseUrl) / query ? {"lang": lang}
  elif query.len > 0:
    return parseUri(baseUrl) / query
  elif lang.len > 0:
    return parseUri(baseUrl) ? {"lang": lang}
  else:
    return parseUri(baseUrl)

proc main(query: string = "", lang: string = "") =
  let client = newHttpClient()
  let uri = buildUri(query, lang)
  let response = client.request($uri)
  echo response.body.parseJson.pretty

when isMainModule and not defined unitTest:
  dispatch(main,
           help = {"query": "IPv4/IPv6 address or a domain name",
                   "lang": "en(default), de, es, pt-BR, fr, ja, zh-CN, ru"})
