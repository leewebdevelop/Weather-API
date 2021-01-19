String CountryWeather(float lat, float lon, int day) {

  String pro = "civillight";
  //String GEO_WEATHER_URL = "http://www.7timer.info/bin/api.pl?lon=113.17&lat=23.09&product=astro&output=json";
  String Specific_Geo_Link = "http://www.7timer.info/bin/api.pl?lon=" +lon+"&lat=" +lat+ "&product=" +pro+ "&output=json";
  JSONObject result = loadJSONObject(Specific_Geo_Link);
  JSONArray allDays = result.getJSONArray("dataseries");
  JSONObject requestedDay = allDays.getJSONObject(day);
  
  int date = requestedDay.getInt("date");
  String dateStr = Integer.toString(date);
  String revisedDate = dateStr.substring(6,8)+"/"+dateStr.substring(4,6)+"/"+dateStr.substring(0,4);
  
  String condition = requestedDay.getString("weather");
  int wind = requestedDay.getInt("wind10m_max");
  
  JSONObject temp = requestedDay.getJSONObject("temp2m");
  int minTemp = temp.getInt("min");
  int maxTemp = temp.getInt("max");
  
  String country = lookupCountry(lat, lon);
  
  String report = country+"\n\nDate: "+revisedDate+"\nCondition: "+condition+"\nWind: "+wind+"km/h\nMin Temperature: "+minTemp+"°C\nMax Temperature: "+maxTemp+"°C";
  return report;

}
