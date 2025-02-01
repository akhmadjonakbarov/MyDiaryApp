class Zoo {
  final String fsqId;
  final String closedBucket;
  final int distance;
  final Geocodes geocodes;
  final String link;
  final Location location;
  final String name;
  final String timezone;
  List<String>? images;

  Zoo(
      {required this.fsqId,
      required this.closedBucket,
      required this.distance,
      required this.geocodes,
      required this.link,
      required this.location,
      required this.name,
      required this.timezone,
      this.images});

  factory Zoo.fromJson(Map<String, dynamic> json) {
    return Zoo(
      fsqId: json['fsq_id'] ?? '',
      closedBucket: json['closed_bucket'] ?? '',
      distance: json['distance'] ?? 0,
      geocodes: Geocodes.fromJson(json['geocodes'] ?? {}),
      link: json['link'] ?? '',
      location: Location.fromJson(json['location'] ?? {}),
      name: json['name'] ?? '',
      timezone: json['timezone'] ?? '',
    );
  }

  Zoo copyWith({
    String? fsqId,
    String? closedBucket,
    int? distance,
    Geocodes? geocodes,
    String? link,
    Location? location,
    String? name,
    String? timezone,
    List<String>? images,
  }) {
    return Zoo(
      fsqId: fsqId ?? this.fsqId,
      closedBucket: closedBucket ?? this.closedBucket,
      distance: distance ?? this.distance,
      geocodes: geocodes ?? this.geocodes,
      link: link ?? this.link,
      location: location ?? this.location,
      name: name ?? this.name,
      timezone: timezone ?? this.timezone,
      images: images ?? this.images,
    );
  }
}

class Geocodes {
  final Geocode main;
  final Geocode? roof;

  Geocodes({required this.main, this.roof});

  factory Geocodes.fromJson(Map<String, dynamic> json) {
    return Geocodes(
      main: Geocode.fromJson(json['main'] ?? {}),
      roof: json['roof'] != null ? Geocode.fromJson(json['roof']) : null,
    );
  }
}

class Geocode {
  final double latitude;
  final double longitude;

  Geocode({required this.latitude, required this.longitude});

  factory Geocode.fromJson(Map<String, dynamic> json) {
    return Geocode(
      latitude: (json['latitude'] ?? 0.0).toDouble(),
      longitude: (json['longitude'] ?? 0.0).toDouble(),
    );
  }
}

class Location {
  final String address;
  final String censusBlock;
  final String country;
  final String crossStreet;
  final String dma;
  final String formattedAddress;
  final String locality;
  final String postcode;
  final String region;

  Location({
    required this.address,
    required this.censusBlock,
    required this.country,
    required this.crossStreet,
    required this.dma,
    required this.formattedAddress,
    required this.locality,
    required this.postcode,
    required this.region,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'] ?? '',
      censusBlock: json['census_block'] ?? '',
      country: json['country'] ?? '',
      crossStreet: json['cross_street'] ?? '',
      dma: json['dma'] ?? '',
      formattedAddress: json['formatted_address'] ?? '',
      locality: json['locality'] ?? '',
      postcode: json['postcode'] ?? '',
      region: json['region'] ?? '',
    );
  }
}
