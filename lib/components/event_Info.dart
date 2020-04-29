import 'event_type.dart';

class EventInfo {

  String reporter;
  String reportTime;
  String reportAddress;
  String image;
  EventType eventType;

  EventInfo(String reporter, String reportTime, String reportAddress, String image, EventType eventType){
    this.reporter = reporter;
    this.reportTime = reportTime;
    this.reportAddress = reportAddress;
    this.image = image;
    this.eventType = eventType;
  }



}