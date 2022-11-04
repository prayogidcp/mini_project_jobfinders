class JobsModel {
  List<JobsData>? data;
  Links? links;
  Meta? meta;

  JobsModel({this.data, this.links, this.meta});

  JobsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <JobsData>[];
      json['data'].forEach((v) {
        data!.add(JobsData.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class JobsData {
  String? slug;
  String? companyName;
  String? title;
  String? description;
  bool? remote;
  String? url;
  List<String>? tags;
  List<String>? jobTypes;
  String? location;
  int? createdAt;

  JobsData(
      {this.slug,
      this.companyName,
      this.title,
      this.description,
      this.remote,
      this.url,
      this.tags,
      this.jobTypes,
      this.location,
      this.createdAt});

  JobsData.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    companyName = json['company_name'];
    title = json['title'];
    description = json['description'];
    remote = json['remote'];
    url = json['url'];
    tags = json['tags'].cast<String>();
    jobTypes = json['job_types'].cast<String>();
    location = json['location'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['company_name'] = companyName;
    data['title'] = title;
    data['description'] = description;
    data['remote'] = remote;
    data['url'] = url;
    data['tags'] = tags;
    data['job_types'] = jobTypes;
    data['location'] = location;
    data['created_at'] = createdAt;
    return data;
  }
}


class Links {
  String? first;
  Null? last;
  Null? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  String? path;
  int? perPage;
  int? to;
  String? terms;
  String? info;

  Meta(
      {this.currentPage,
      this.from,
      this.path,
      this.perPage,
      this.to,
      this.terms,
      this.info});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    terms = json['terms'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['terms'] = terms;
    data['info'] = info;
    return data;
  }
}

// class MovieModel {
//   double? score;
//   Show? show;

//   MovieModel({this.score, this.show});

//   MovieModel.fromJson(Map<String, dynamic> json) {
//     score = json['score'];
//     show = json['show'] != null ? new Show.fromJson(json['show']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['score'] = this.score;
//     if (this.show != null) {
//       data['show'] = this.show!.toJson();
//     }
//     return data;
//   }
// }

// class Show {
//   int? id;
//   String? url;
//   String? name;
//   String? type;
//   String? language;
//   List<String>? genres;
//   String? status;
//   int? runtime;
//   int? averageRuntime;
//   String? premiered;
//   String? ended;
//   String? officialSite;
//   Schedule? schedule;
//   Rating? rating;
//   int? weight;
//   Network? network;
//   String? webChannel;
//   String? dvdCountry;
//   Externals? externals;
//   Image? image;
//   String? summary;
//   int? updated;
//   Links? lLinks;

//   Show(
//       {this.id,
//       this.url,
//       this.name,
//       this.type,
//       this.language,
//       this.genres,
//       this.status,
//       this.runtime,
//       this.averageRuntime,
//       this.premiered,
//       this.ended,
//       this.officialSite,
//       this.schedule,
//       this.rating,
//       this.weight,
//       this.network,
//       this.webChannel,
//       this.dvdCountry,
//       this.externals,
//       this.image,
//       this.summary,
//       this.updated,
//       this.lLinks});

//   Show.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     url = json['url'];
//     name = json['name'];
//     type = json['type'];
//     language = json['language'];
//     genres = json['genres'];
//     status = json['status'];
//     runtime = json['runtime'];
//     averageRuntime = json['averageRuntime'];
//     premiered = json['premiered'];
//     ended = json['ended'];
//     officialSite = json['officialSite'];
//     schedule = json['schedule'] != null
//         ? new Schedule.fromJson(json['schedule'])
//         : null;
//     rating =
//         json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
//     weight = json['weight'];
//     network =
//         json['network'] != null ? new Network.fromJson(json['network']) : null;
//     webChannel = json['webChannel'];
//     dvdCountry = json['dvdCountry'];
//     externals = json['externals'] != null
//         ? new Externals.fromJson(json['externals'])
//         : null;
//     image = json['image'] != null ? new Image.fromJson(json['image']) : null;
//     summary = json['summary'];
//     updated = json['updated'];
//     lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['url'] = this.url;
//     data['name'] = this.name;
//     data['type'] = this.type;
//     data['language'] = this.language;
//     data['genres'] = this.genres;
//     data['status'] = this.status;
//     data['runtime'] = this.runtime;
//     data['averageRuntime'] = this.averageRuntime;
//     data['premiered'] = this.premiered;
//     data['ended'] = this.ended;
//     data['officialSite'] = this.officialSite;
//     if (this.schedule != null) {
//       data['schedule'] = this.schedule!.toJson();
//     }
//     if (this.rating != null) {
//       data['rating'] = this.rating!.toJson();
//     }
//     data['weight'] = this.weight;
//     if (this.network != null) {
//       data['network'] = this.network!.toJson();
//     }
//     data['webChannel'] = this.webChannel;
//     data['dvdCountry'] = this.dvdCountry;
//     if (this.externals != null) {
//       data['externals'] = this.externals!.toJson();
//     }
//     if (this.image != null) {
//       data['image'] = this.image!.toJson();
//     }
//     data['summary'] = this.summary;
//     data['updated'] = this.updated;
//     if (this.lLinks != null) {
//       data['_links'] = this.lLinks!.toJson();
//     }
//     return data;
//   }
// }

// class Schedule {
//   String? time;
//   List<String>? days;

//   Schedule({this.time, this.days});

//   Schedule.fromJson(Map<String, dynamic> json) {
//     time = json['time'];
//     days = json['days'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['time'] = this.time;
//     data['days'] = this.days;
//     return data;
//   }
// }

// class Rating {
//   double? average;

//   Rating({this.average});

//   Rating.fromJson(Map<String, dynamic> json) {
//     average = json['average'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['average'] = this.average;
//     return data;
//   }
// }

// class Network {
//   int? id;
//   String? name;
//   Country? country;
//   String? officialSite;

//   Network({this.id, this.name, this.country, this.officialSite});

//   Network.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     country =
//         json['country'] != null ? new Country.fromJson(json['country']) : null;
//     officialSite = json['officialSite'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.country != null) {
//       data['country'] = this.country!.toJson();
//     }
//     data['officialSite'] = this.officialSite;
//     return data;
//   }
// }

// class Country {
//   String? name;
//   String? code;
//   String? timezone;

//   Country({this.name, this.code, this.timezone});

//   Country.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     code = json['code'];
//     timezone = json['timezone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['code'] = this.code;
//     data['timezone'] = this.timezone;
//     return data;
//   }
// }

// class Externals {
//   int? tvrage;
//   int? thetvdb;
//   String? imdb;

//   Externals({this.tvrage, this.thetvdb, this.imdb});

//   Externals.fromJson(Map<String, dynamic> json) {
//     tvrage = json['tvrage'];
//     thetvdb = json['thetvdb'];
//     imdb = json['imdb'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['tvrage'] = this.tvrage;
//     data['thetvdb'] = this.thetvdb;
//     data['imdb'] = this.imdb;
//     return data;
//   }
// }

// class Image {
//   String? medium;
//   String? original;

//   Image({this.medium, this.original});

//   Image.fromJson(Map<String, dynamic> json) {
//     medium = json['medium'];
//     original = json['original'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['medium'] = this.medium;
//     data['original'] = this.original;
//     return data;
//   }
// }

// class Links {
//   Self? self;
//   Self? previousepisode;

//   Links({this.self, this.previousepisode});

//   Links.fromJson(Map<String, dynamic> json) {
//     self = json['self'] != null ? new Self.fromJson(json['self']) : null;
//     previousepisode = json['previousepisode'] != null
//         ? new Self.fromJson(json['previousepisode'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.self != null) {
//       data['self'] = this.self!.toJson();
//     }
//     if (this.previousepisode != null) {
//       data['previousepisode'] = this.previousepisode!.toJson();
//     }
//     return data;
//   }
// }

// class Self {
//   String? href;

//   Self({this.href});

//   Self.fromJson(Map<String, dynamic> json) {
//     href = json['href'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['href'] = this.href;
//     return data;
//   }
// }
