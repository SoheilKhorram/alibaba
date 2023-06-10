class Ticketmod {
  String departureTime;
  String arrivalTime;
  List<String> tags;
  int? price;
  int numberOfRemainingSeats;

  Ticketmod({
    required this.departureTime,
    required this.arrivalTime,
    required this.tags,
    required this.numberOfRemainingSeats,
    this.price,
  });
}
