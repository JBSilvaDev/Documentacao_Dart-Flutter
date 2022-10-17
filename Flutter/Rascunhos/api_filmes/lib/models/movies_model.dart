class Movies {
  Movies({
    required this.createdBy,
    required this.description,
    required this.favoriteCount,
    required this.id,
    required this.items,
    required this.itemCount,
    required this.iso_639_1,
    required this.name,
    required this.posterPath,
  });
  late final String createdBy;
  late final String description;
  late final int favoriteCount;
  late final String id;
  late final List<Items> items;
  late final int itemCount;
  late final String iso_639_1;
  late final String name;
  late final String posterPath;
  
  Movies.fromJson(Map<String, dynamic> json){
    createdBy = json['created_by'];
    description = json['description'];
    favoriteCount = json['favorite_count'];
    id = json['id'];
    items = List.from(json['items']).map((e)=>Items.fromJson(e)).toList();
    itemCount = json['item_count'];
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
    posterPath = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['created_by'] = createdBy;
    _data['description'] = description;
    _data['favorite_count'] = favoriteCount;
    _data['id'] = id;
    _data['items'] = items.map((e)=>e.toJson()).toList();
    _data['item_count'] = itemCount;
    _data['iso_639_1'] = iso_639_1;
    _data['name'] = name;
    _data['poster_path'] = posterPath;
    return _data;
  }
}

class Items {
  Items({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String mediaType;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final int? voteAverage;
  late final int voteCount;
  
  Items.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['media_type'] = mediaType;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}