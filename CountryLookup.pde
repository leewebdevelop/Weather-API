String lookupCountry(float lat, float lon) {
  final String GEO_CODING_URL = "https://api.bigdatacloud.net/data/reverse-geocode-client?";
  
  String where = "latitude=" + lat + "&longitude=" + lon + "&localityLanguage=en";
  
  JSONObject result = loadJSONObject(GEO_CODING_URL + where);
  
  return result.getString("countryName");
}
