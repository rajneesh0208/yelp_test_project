// To parse this JSON data, do
//
//     final storeList = storeListFromJson(jsonString);

import 'dart:convert';

StoreList storeListFromJson(String str) => StoreList.fromJson(json.decode(str));

String storeListToJson(StoreList data) => json.encode(data.toJson());

class StoreList {
  final List<Business> businesses;
  final int total;
  final Region region;

  StoreList({
    required this.businesses,
    required this.total,
    required this.region,
  });

  factory StoreList.fromJson(Map<String, dynamic> json) => StoreList(
    businesses: List<Business>.from(json["businesses"].map((x) => Business.fromJson(x))),
    total: json["total"],
    region: Region.fromJson(json["region"]),
  );

  Map<String, dynamic> toJson() => {
    "businesses": List<dynamic>.from(businesses.map((x) => x.toJson())),
    "total": total,
    "region": region.toJson(),
  };
}

class Business {
  final String id;
  final String alias;
  final String name;
  final String imageUrl;
  final bool isClosed;
  final String url;
  final int reviewCount;
  final List<Category> categories;
  final double rating;
  final Center coordinates;
  final List<Transaction> transactions;
  dynamic price;
  final Location location;
  final String phone;
  final String displayPhone;
  final double distance;
  final List<BusinessHour> businessHours;
  final Attributes attributes;

  Business({
    required this.id,
    required this.alias,
    required this.name,
    required this.imageUrl,
    required this.isClosed,
    required this.url,
    required this.reviewCount,
    required this.categories,
    required this.rating,
    required this.coordinates,
    required this.transactions,
    required this.price,
    required this.location,
    required this.phone,
    required this.displayPhone,
    required this.distance,
    required this.businessHours,
    required this.attributes,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
    id: json["id"],
    alias: json["alias"],
    name: json["name"],
    imageUrl: json["image_url"],
    isClosed: json["is_closed"],
    url: json["url"],
    reviewCount: json["review_count"],
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    rating: json["rating"]?.toDouble(),
    coordinates: Center.fromJson(json["coordinates"]),
    transactions: List<Transaction>.from(json["transactions"].map((x) => transactionValues.map[x]!)),
    price: json["price"],
    location: Location.fromJson(json["location"]),
    phone: json["phone"],
    displayPhone: json["display_phone"],
    distance: json["distance"]?.toDouble(),
    businessHours: List<BusinessHour>.from(json["business_hours"].map((x) => BusinessHour.fromJson(x))),
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "alias": alias,
    "name": name,
    "image_url": imageUrl,
    "is_closed": isClosed,
    "url": url,
    "review_count": reviewCount,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "rating": rating,
    "coordinates": coordinates.toJson(),
    "transactions": List<dynamic>.from(transactions.map((x) => transactionValues.reverse[x])),
    "price": priceValues.reverse[price],
    "location": location.toJson(),
    "phone": phone,
    "display_phone": displayPhone,
    "distance": distance,
    "business_hours": List<dynamic>.from(businessHours.map((x) => x.toJson())),
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  final dynamic businessTempClosed;
  final String? menuUrl;
  final dynamic open24Hours;
  final bool? waitlistReservation;

  Attributes({
    required this.businessTempClosed,
    required this.menuUrl,
    required this.open24Hours,
    required this.waitlistReservation,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    businessTempClosed: json["business_temp_closed"],
    menuUrl: json["menu_url"],
    open24Hours: json["open24_hours"],
    waitlistReservation: json["waitlist_reservation"],
  );

  Map<String, dynamic> toJson() => {
    "business_temp_closed": businessTempClosed,
    "menu_url": menuUrl,
    "open24_hours": open24Hours,
    "waitlist_reservation": waitlistReservation,
  };
}

class BusinessHour {
  final List<Open> open;
  final HoursType hoursType;
  final bool isOpenNow;

  BusinessHour({
    required this.open,
    required this.hoursType,
    required this.isOpenNow,
  });

  factory BusinessHour.fromJson(Map<String, dynamic> json) => BusinessHour(
    open: List<Open>.from(json["open"].map((x) => Open.fromJson(x))),
    hoursType: hoursTypeValues.map[json["hours_type"]]!,
    isOpenNow: json["is_open_now"],
  );

  Map<String, dynamic> toJson() => {
    "open": List<dynamic>.from(open.map((x) => x.toJson())),
    "hours_type": hoursTypeValues.reverse[hoursType],
    "is_open_now": isOpenNow,
  };
}

enum HoursType {
  REGULAR
}

final hoursTypeValues = EnumValues({
  "REGULAR": HoursType.REGULAR
});

class Open {
  final bool isOvernight;
  final String start;
  final String end;
  final int day;

  Open({
    required this.isOvernight,
    required this.start,
    required this.end,
    required this.day,
  });

  factory Open.fromJson(Map<String, dynamic> json) => Open(
    isOvernight: json["is_overnight"],
    start: json["start"],
    end: json["end"],
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "is_overnight": isOvernight,
    "start": start,
    "end": end,
    "day": day,
  };
}

class Category {
  final String alias;
  final String title;

  Category({
    required this.alias,
    required this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    alias: json["alias"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "alias": alias,
    "title": title,
  };
}

class Center {
  final double latitude;
  final double longitude;

  Center({
    required this.latitude,
    required this.longitude,
  });

  factory Center.fromJson(Map<String, dynamic> json) => Center(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Location {
  final String address1;
  dynamic address2;
  final String? address3;
  dynamic city;
  final String zipCode;
  final Country country;
  dynamic state;
  final List<String> displayAddress;

  Location({
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.zipCode,
    required this.country,
    required this.state,
    required this.displayAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    address1: json["address1"],
    address2: json["address2"],
    address3: json["address3"],
    city: json["city"],
    zipCode: json["zip_code"],
    country: countryValues.map[json["country"]]!,
    state: json["state"],
    displayAddress: List<String>.from(json["display_address"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "address1": address1,
    "address2": address2Values.reverse[address2],
    "address3": address3,
    "city": cityValues.reverse[city],
    "zip_code": zipCode,
    "country": countryValues.reverse[country],
    "state": state,
    "display_address": List<dynamic>.from(displayAddress.map((x) => x)),
  };
}

enum Address2 {
  EMPTY,
  FL_60
}

final address2Values = EnumValues({
  "": Address2.EMPTY,
  "Fl 60": Address2.FL_60
});

enum City {
  BROOKLYN,
  NEW_YORK
}

final cityValues = EnumValues({
  "Brooklyn": City.BROOKLYN,
  "New York": City.NEW_YORK
});

enum Country {
  US
}

final countryValues = EnumValues({
  "US": Country.US
});

// enum State {
//   NY
// }
//
// final stateValues = EnumValues({
//   "NY": State.NY
// });

enum Price {
  EMPTY,
  FLUFFY,
  PRICE,
  PURPLE
}

final priceValues = EnumValues({
  "\u0024\u0024\u0024\u0024": Price.EMPTY,
  "\u0024": Price.FLUFFY,
  "\u0024\u0024": Price.PRICE,
  "\u0024\u0024\u0024": Price.PURPLE
});

enum Transaction {
  DELIVERY,
  PICKUP,
  RESTAURANT_RESERVATION
}

final transactionValues = EnumValues({
  "delivery": Transaction.DELIVERY,
  "pickup": Transaction.PICKUP,
  "restaurant_reservation": Transaction.RESTAURANT_RESERVATION
});

class Region {
  final Center center;

  Region({
    required this.center,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    center: Center.fromJson(json["center"]),
  );

  Map<String, dynamic> toJson() => {
    "center": center.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
