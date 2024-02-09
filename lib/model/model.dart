class HotelData {
  int? status;
  String? msg;
  Results? results;

  HotelData({this.status, this.msg, this.results});

  HotelData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }
}

class Results {
  List<Data>? data;
  Paging? paging;

  Results({this.data, this.paging});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    paging =
        json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (paging != null) {
      data['paging'] = paging!.toJson();
    }
    return data;
  }
}

class Data {
  String? locationId;
  String? name;
  String? latitude;
  String? longitude;
  String? numReviews;
  String? timezone;
  String? locationString;
  Photo? photo;
  String? apiDetailUrl;
  List<String>? awards;
  String? doubleclickZone;
  String? preferredMapEngine;
  String? rawRanking;
  String? rankingGeo;
  String? rankingGeoId;
  String? rankingPosition;
  String? rankingDenominator;
  String? rankingCategory;
  String? ranking;
  String? subcategoryType;
  String? subcategoryTypeLabel;
  int? distance;
  String? distanceString;
  String? bearing;
  String? rating;
  bool? isClosed;
  String? openNowText;
  bool? isLongClosed;
  String? priceLevel;
  String? price;
  List<NeighborhoodInfo>? neighborhoodInfo;
  String? hotelClass;
  String? hotelClassAttribution;
  BusinessListings? businessListings;
  SpecialOffers? specialOffers;
  String? description;
  String? webUrl;
  String? writeReview;
  List<Ancestors>? ancestors;
  Subcategory? category;
  List<Subcategory>? subcategory;
  String? parentDisplayName;
  bool? isJfyEnabled;
  List<String>? nearestMetroStation;
  String? phone;
  String? website;
  AddressObj? addressObj;
  String? address;
  bool? isCandidateForContactInfoSuppression;
  List<String>? amenities;
  String? ownerWebsite;
  String? email;

  Data(
      {this.locationId,
      this.name,
      this.latitude,
      this.longitude,
      this.numReviews,
      this.timezone,
      this.locationString,
      this.photo,
      this.apiDetailUrl,
      this.awards,
      this.doubleclickZone,
      this.preferredMapEngine,
      this.rawRanking,
      this.rankingGeo,
      this.rankingGeoId,
      this.rankingPosition,
      this.rankingDenominator,
      this.rankingCategory,
      this.ranking,
      this.subcategoryType,
      this.subcategoryTypeLabel,
      this.distance,
      this.distanceString,
      this.bearing,
      this.rating,
      this.isClosed,
      this.openNowText,
      this.isLongClosed,
      this.priceLevel,
      this.price,
      this.neighborhoodInfo,
      this.hotelClass,
      this.hotelClassAttribution,
      this.businessListings,
      this.specialOffers,
      this.description,
      this.webUrl,
      this.writeReview,
      this.ancestors,
      this.category,
      this.subcategory,
      this.parentDisplayName,
      this.isJfyEnabled,
      this.nearestMetroStation,
      this.phone,
      this.website,
      this.addressObj,
      this.address,
      this.isCandidateForContactInfoSuppression,
      this.amenities,
      this.ownerWebsite,
      this.email});

  Data.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    numReviews = json['num_reviews'];
    timezone = json['timezone'];
    locationString = json['location_string'];
    photo = json['photo'] != null ? Photo.fromJson(json['photo']) : null;
    apiDetailUrl = json['api_detail_url'];
    if (json['awards'] != null) {
      awards = <String>[];
      json['awards'].forEach((v) {
  
      });
    }
    doubleclickZone = json['doubleclick_zone'];
    preferredMapEngine = json['preferred_map_engine'];
    rawRanking = json['raw_ranking'];
    rankingGeo = json['ranking_geo'];
    rankingGeoId = json['ranking_geo_id'];
    rankingPosition = json['ranking_position'];
    rankingDenominator = json['ranking_denominator'];
    rankingCategory = json['ranking_category'];
    ranking = json['ranking'];
    subcategoryType = json['subcategory_type'];
    subcategoryTypeLabel = json['subcategory_type_label'];
    distance = json['distance'];
    distanceString = json['distance_string'];
    bearing = json['bearing'];
    rating = json['rating'];
    isClosed = json['is_closed'];
    openNowText = json['open_now_text'];
    isLongClosed = json['is_long_closed'];
    priceLevel = json['price_level'];
    price = json['price'];
    if (json['neighborhood_info'] != null) {
      neighborhoodInfo = <NeighborhoodInfo>[];
      json['neighborhood_info'].forEach((v) {
        neighborhoodInfo!.add(NeighborhoodInfo.fromJson(v));
      });
    }
    hotelClass = json['hotel_class'];
    hotelClassAttribution = json['hotel_class_attribution'];
    businessListings = json['business_listings'] != null
        ? BusinessListings.fromJson(json['business_listings'])
        : null;
    specialOffers = json['special_offers'] != null
        ? SpecialOffers.fromJson(json['special_offers'])
        : null;
    description = json['description'];
    webUrl = json['web_url'];
    writeReview = json['write_review'];
    if (json['ancestors'] != null) {
      ancestors = <Ancestors>[];
      json['ancestors'].forEach((v) {
        ancestors!.add(Ancestors.fromJson(v));
      });
    }
    category = json['category'] != null
        ? Subcategory.fromJson(json['category'])
        : null;
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(Subcategory.fromJson(v));
      });
    }
    parentDisplayName = json['parent_display_name'];
    isJfyEnabled = json['is_jfy_enabled'];
    if (json['nearest_metro_station'] != null) {
      nearestMetroStation = <String>[];
      json['nearest_metro_station'].forEach((v) {
      
      });
    }
    phone = json['phone'];
    website = json['website'];
    addressObj = json['address_obj'] != null
        ? AddressObj.fromJson(json['address_obj'])
        : null;
    address = json['address'];
    isCandidateForContactInfoSuppression =
        json['is_candidate_for_contact_info_suppression'];
    if (json['amenities'] != null) {
      amenities = <String>[];
      json['amenities'].forEach((v) {
        
      });
    }
    ownerWebsite = json['owner_website'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location_id'] = locationId;
    data['name'] = name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['num_reviews'] = numReviews;
    data['timezone'] = timezone;
    data['location_string'] = locationString;
    if (photo != null) {
      data['photo'] = photo!.toJson();
    }
    data['api_detail_url'] = apiDetailUrl;
    if (awards != null) {
    }
    data['doubleclick_zone'] = doubleclickZone;
    data['preferred_map_engine'] = preferredMapEngine;
    data['raw_ranking'] = rawRanking;
    data['ranking_geo'] = rankingGeo;
    data['ranking_geo_id'] = rankingGeoId;
    data['ranking_position'] = rankingPosition;
    data['ranking_denominator'] = rankingDenominator;
    data['ranking_category'] = rankingCategory;
    data['ranking'] = ranking;
    data['subcategory_type'] = subcategoryType;
    data['subcategory_type_label'] = subcategoryTypeLabel;
    data['distance'] = distance;
    data['distance_string'] = distanceString;
    data['bearing'] = bearing;
    data['rating'] = rating;
    data['is_closed'] = isClosed;
    data['open_now_text'] = openNowText;
    data['is_long_closed'] = isLongClosed;
    data['price_level'] = priceLevel;
    data['price'] = price;
    if (neighborhoodInfo != null) {
      data['neighborhood_info'] =
          neighborhoodInfo!.map((v) => v.toJson()).toList();
    }
    data['hotel_class'] = hotelClass;
    data['hotel_class_attribution'] = hotelClassAttribution;
    if (businessListings != null) {
      data['business_listings'] = businessListings!.toJson();
    }
    if (specialOffers != null) {
      data['special_offers'] = specialOffers!.toJson();
    }
    data['description'] = description;
    data['web_url'] = webUrl;
    data['write_review'] = writeReview;
    if (ancestors != null) {
      data['ancestors'] = ancestors!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subcategory != null) {
      data['subcategory'] = subcategory!.map((v) => v.toJson()).toList();
    }
    data['parent_display_name'] = parentDisplayName;
    data['is_jfy_enabled'] = isJfyEnabled;
    if (nearestMetroStation != null) {
      
    }
    data['phone'] = phone;
    data['website'] = website;
    if (addressObj != null) {
      data['address_obj'] = addressObj!.toJson();
    }
    data['address'] = address;
    data['is_candidate_for_contact_info_suppression'] =
        isCandidateForContactInfoSuppression;
    if (amenities != null) {
      
    }
    data['owner_website'] = ownerWebsite;
    data['email'] = email;
    return data;
  }
}

class Photo {
  Images? images;
  bool? isBlessed;
  String? uploadedDate;
  String? caption;
  String? id;
  String? helpfulVotes;
  String? publishedDate;
  User? user;

  Photo(
      {this.images,
      this.isBlessed,
      this.uploadedDate,
      this.caption,
      this.id,
      this.helpfulVotes,
      this.publishedDate,
      this.user});

  Photo.fromJson(Map<String, dynamic> json) {
    images =
        json['images'] != null ? Images.fromJson(json['images']) : null;
    isBlessed = json['is_blessed'];
    uploadedDate = json['uploaded_date'];
    caption = json['caption'];
    id = json['id'];
    helpfulVotes = json['helpful_votes'];
    publishedDate = json['published_date'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['is_blessed'] = isBlessed;
    data['uploaded_date'] = uploadedDate;
    data['caption'] = caption;
    data['id'] = id;
    data['helpful_votes'] = helpfulVotes;
    data['published_date'] = publishedDate;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Images {
  Small? small;
  Small? thumbnail;
  Small? original;
  Small? large;
  Small? medium;

  Images({this.small, this.thumbnail, this.original, this.large, this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? Small.fromJson(json['small']) : null;
    thumbnail = json['thumbnail'] != null
        ? Small.fromJson(json['thumbnail'])
        : null;
    original =
        json['original'] != null ? Small.fromJson(json['original']) : null;
    large = json['large'] != null ? Small.fromJson(json['large']) : null;
    medium = json['medium'] != null ? Small.fromJson(json['medium']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (small != null) {
      data['small'] = small!.toJson();
    }
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    if (original != null) {
      data['original'] = original!.toJson();
    }
    if (large != null) {
      data['large'] = large!.toJson();
    }
    if (medium != null) {
      data['medium'] = medium!.toJson();
    }
    return data;
  }
}

class Small {
  String? width;
  String? url;
  String? height;

  Small({this.width, this.url, this.height});

  Small.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    url = json['url'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['url'] = url;
    data['height'] = height;
    return data;
  }
}

class User {
  int? userId;
  String? memberId;
  String? type;

  User({this.userId, this.memberId, this.type});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    memberId = json['member_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['member_id'] = memberId;
    data['type'] = type;
    return data;
  }
}

class NeighborhoodInfo {
  String? locationId;
  String? name;

  NeighborhoodInfo({this.locationId, this.name});

  NeighborhoodInfo.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location_id'] = locationId;
    data['name'] = name;
    return data;
  }
}

class BusinessListings {
  List<String>? desktopContacts;
  List<MobileContacts>? mobileContacts;

  BusinessListings({this.desktopContacts, this.mobileContacts});

  BusinessListings.fromJson(Map<String, dynamic> json) {
    if (json['desktop_contacts'] != null) {
      desktopContacts = <String>[];
      json['desktop_contacts'].forEach((v) {
        
      });
    }
    if (json['mobile_contacts'] != null) {
      mobileContacts = <MobileContacts>[];
      json['mobile_contacts'].forEach((v) {
        mobileContacts!.add(MobileContacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (desktopContacts != null) {
      
    }
    if (mobileContacts != null) {
      data['mobile_contacts'] =
          mobileContacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MobileContacts {
  String? value;
  String? label;
  String? type;
  String? offerlessCommerceTrackUrl;

  MobileContacts(
      {this.value, this.label, this.type, this.offerlessCommerceTrackUrl});

  MobileContacts.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
    type = json['type'];
    offerlessCommerceTrackUrl = json['offerless_commerce_track_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    data['type'] = type;
    data['offerless_commerce_track_url'] = offerlessCommerceTrackUrl;
    return data;
  }
}

class SpecialOffers {
  List<String>? desktop;
  List<Mobile>? mobile;

  SpecialOffers({this.desktop, this.mobile});

  SpecialOffers.fromJson(Map<String, dynamic> json) {
    if (json['desktop'] != null) {
      desktop = <String>[];
      json['desktop'].forEach((v) {
       
      });
    }
    if (json['mobile'] != null) {
      mobile = <Mobile>[];
      json['mobile'].forEach((v) {
        mobile!.add(Mobile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (desktop != null) {
      
    }
    if (mobile != null) {
      data['mobile'] = mobile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mobile {
  String? headline;
  String? url;
  String? offerlessClickTrackingUrl;

  Mobile({this.headline, this.url, this.offerlessClickTrackingUrl});

  Mobile.fromJson(Map<String, dynamic> json) {
    headline = json['headline'];
    url = json['url'];
    offerlessClickTrackingUrl = json['offerless_click_tracking_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headline'] = headline;
    data['url'] = url;
    data['offerless_click_tracking_url'] = offerlessClickTrackingUrl;
    return data;
  }
}

class Ancestors {
  List<Subcategory>? subcategory;
  String? name;
  String? abbrv;
  String? locationId;

  Ancestors({this.subcategory, this.name, this.abbrv, this.locationId});

  Ancestors.fromJson(Map<String, dynamic> json) {
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(Subcategory.fromJson(v));
      });
    }
    name = json['name'];
    abbrv = json['abbrv'];
    locationId = json['location_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (subcategory != null) {
      data['subcategory'] = subcategory!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['abbrv'] = abbrv;
    data['location_id'] = locationId;
    return data;
  }
}

class Subcategory {
  String? key;
  String? name;

  Subcategory({this.key, this.name});

  Subcategory.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    return data;
  }
}

class AddressObj {
  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;
  String? postalcode;

  AddressObj(
      {this.street1,
      this.street2,
      this.city,
      this.state,
      this.country,
      this.postalcode});

  AddressObj.fromJson(Map<String, dynamic> json) {
    street1 = json['street1'];
    street2 = json['street2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    postalcode = json['postalcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street1'] = street1;
    data['street2'] = street2;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['postalcode'] = postalcode;
    return data;
  }
}

class Paging {
  String? previous;
  String? next;
  String? skipped;
  String? results;
  String? totalResults;

  Paging(
      {this.previous,
      this.next,
      this.skipped,
      this.results,
      this.totalResults});

  Paging.fromJson(Map<String, dynamic> json) {
    previous = json['previous'];
    next = json['next'];
    skipped = json['skipped'];
    results = json['results'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['previous'] = previous;
    data['next'] = next;
    data['skipped'] = skipped;
    data['results'] = results;
    data['total_results'] = totalResults;
    return data;
  }
}