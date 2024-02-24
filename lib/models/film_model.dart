import 'package:bamabin/models/actor.dart';
import 'package:bamabin/models/release_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/colors.dart';
import '../widgets/movie_detail/movie_detail_small_item.dart';
import 'comment_model.dart';
import 'country_model.dart';
import 'genre_model.dart';
import 'language_model.dart';

class FilmModel {
  int? id;
  String? authorId;
  String? releaseYear;
  String? date;
  String? dateGmt;
  String? content;
  String? title;
  String? excerpt;
  String? status;
  String? commentStatus;
  String? pingStatus;
  String? password;
  String? name;
  String? toPing;
  String? pinged;
  String? modified;
  String? modifiedGmt;
  String? contentFiltered;
  int? parent;
  String? guid;
  int? menuOrder;
  String? postType;
  String? type;
  String? mimeType;
  String? commentCount;
  String? filter;
  String? thumbnail;
  String? bgThumbnail;
  String? link;
  String? authorName;
  String? authorEmail;
  String? authorAvatar;
  String? trailer_url;
  List<CommentModel>? comments;
  bool? isFinished;
  List<Country>? countries;
  List<Release>? release;
  List<Actor>? actors;
  List<Actor>? directors;
  // List<Null>? networks;
  List<Language>? languages;
  List<Genre>? genres;
  String? sEditLock;
  String? sThumbnailId;
  String? sEditLast;
  String? sYoastIndexnowLastPing;
  String? titleMovie;
  String? faTitleMovie;
  String? releaseMovie;
  String? countryMovie;
  String? languageMovie;
  String? genreMovie;
  String? imdbRateMovie;
  String? starsMovie;
  String? directorMovie;
  String? imdbidMovie;
  String? voteMovie;
  String? runtimeMovie;
  String? faPlotMovie;
  String? movieUpdateText;
  String? movieThumbBg;
  String? moviesDlbox;
  String? sYoastWpseoPrimaryMovieCats;
  String? sYoastWpseoPrimaryCollection;
  String? sYoastWpseoFocuskw;
  String? sYoastWpseoLinkdex;
  String? sYoastWpseoFocuskeywords;
  String? sYoastWpseoKeywordsynonyms;
  String? sYoastWpseoEstimatedReadingTimeMinutes;
  String? sYoastWpseoWordproofTimestamp;
  String? postViewsCount;
  String? postRates;
  String? playonlineActive;
  String? hasSubtitle;
  String? metacriticRate;
  String? dlboxSubtitle;
  String? dlboxAudio;
  String? importerPath;
  String? suggestedMovie;
  String? hasDubbed;
  String? ageMovie;
  String? summaryAwards;
  String? top250movie;
  String? malSiteId;
  String? malRateMovie;
  String? malVoteMovie;
  String? enPlotMovie;
  String? titles;
  String? enTitle;
  String? faTitle;
  String? enSummary;
  String? faSummary;
  String? updateDescription;
  String? ageRate;
  String? hasPlay;
  String? runtime;
  String? imdbId;
  String? imdbRate;
  String? imdbVoteCount;
  String? malRate;
  String? malVoteCount;
  bool? is_watchlist;
  like_info? likeInfo;
  List<String>? genresListForDetail;
  List<FilmModel>? collection_posts;
  List<FilmModel>? related_posts;

  FilmModel(
      {this.id,
      this.authorId,
      this.genresListForDetail,
      this.date,
      this.dateGmt,
      this.content,
      this.title,
      this.excerpt,
      this.status,
      this.commentStatus,
      this.pingStatus,
      this.is_watchlist,
      this.password,
      this.name,
      this.toPing,
      this.pinged,
      this.modified,
      this.modifiedGmt,
      this.contentFiltered,
      this.parent,
      this.guid,
      this.menuOrder,
      this.postType,
      this.type,
      this.collection_posts,
      this.related_posts,
      this.mimeType,
      this.commentCount,
      this.filter,
      this.thumbnail,
      this.bgThumbnail,
      this.link,
      this.authorName,
      this.authorEmail,
      this.authorAvatar,
      this.comments,
      this.isFinished,
      this.countries,
      this.trailer_url,
      this.release,
      this.actors,
      this.directors,
      // this.networks,
      this.languages,
      this.genres,
      this.sEditLock,
      this.sThumbnailId,
      this.sEditLast,
      this.sYoastIndexnowLastPing,
      this.titleMovie,
      this.faTitleMovie,
      this.releaseMovie,
      this.countryMovie,
      this.languageMovie,
      this.genreMovie,
      this.imdbRateMovie,
      this.starsMovie,
      this.directorMovie,
      this.imdbidMovie,
      this.voteMovie,
      this.runtimeMovie,
      this.faPlotMovie,
      this.movieUpdateText,
      this.movieThumbBg,
      this.moviesDlbox,
      this.sYoastWpseoPrimaryMovieCats,
      this.sYoastWpseoPrimaryCollection,
      this.sYoastWpseoFocuskw,
      this.sYoastWpseoLinkdex,
      this.sYoastWpseoFocuskeywords,
      this.sYoastWpseoKeywordsynonyms,
      this.sYoastWpseoEstimatedReadingTimeMinutes,
      this.sYoastWpseoWordproofTimestamp,
      this.postViewsCount,
      this.postRates,
      this.playonlineActive,
      this.hasSubtitle,
      this.metacriticRate,
      this.dlboxSubtitle,
      this.dlboxAudio,
      this.importerPath,
      this.suggestedMovie,
      this.hasDubbed,
      this.ageMovie,
      this.summaryAwards,
      this.top250movie,
      this.malSiteId,
      this.malRateMovie,
      this.malVoteMovie,
      this.enPlotMovie,
      this.titles,
      this.enTitle,
      this.faTitle,
      this.enSummary,
      this.faSummary,
      this.updateDescription,
      this.ageRate,
      this.hasPlay,
      this.runtime,
      this.imdbId,
      this.imdbRate,
      this.imdbVoteCount,
      this.likeInfo,
      this.malRate,
      this.malVoteCount});

  FilmModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    is_watchlist = json['is_watchlist'];
    authorId = json['author_id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    content = json['content'];
    title = json['title'];
    excerpt = json['excerpt'];
    status = json['status'];
    commentStatus = json['comment_status'];
    pingStatus = json['ping_status'];
    password = json['password'];
    trailer_url = json['trailer_url'];
    name = json['name'];
    toPing = json['to_ping'];
    pinged = json['pinged'];
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    contentFiltered = json['content_filtered'];
    parent = json['parent'];
    guid = json['guid'];
    menuOrder = json['menu_order'];
    postType = json['post_type'];
    type = json['type'];
    mimeType = json['mime_type'];
    commentCount = json['comment_count'];
    filter = json['filter'];
    thumbnail = json['thumbnail'];
    bgThumbnail = json['bg_thumbnail'];
    link = json['link'];
    authorName = json['author_name'];
    authorEmail = json['author_email'];
    authorAvatar = json['author_avatar'];
    if (json['comments'] != null) {
      comments = <CommentModel>[];
      json['comments'].forEach((v) {
        comments!.add(new CommentModel.fromJson(v));
      });
    }
    if (json['actors'] != null) {
      actors = <Actor>[];
      json['actors'].forEach((v) {
        actors!.add(new Actor.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      directors = <Actor>[];
      json['directors'].forEach((v) {
        directors!.add(new Actor.fromJson(v));
      });
    }
    if (json['collection_posts'] != null) {
      collection_posts = <FilmModel>[];
      json['collection_posts'].forEach((v) {
        collection_posts!.add(new FilmModel.fromJson(v));
      });
    }
    if (json['related_posts'] != null) {
      related_posts = <FilmModel>[];
      json['related_posts'].forEach((v) {
        related_posts!.add(new FilmModel.fromJson(v));
      });
    }
    isFinished = json['is_finished'];
    if (json['countries'] != null) {
      countries = <Country>[];
      json['countries'].forEach((v) {
        countries!.add(new Country.fromJson(v));
      });
    }
    if (json['release'] != null) {
      release = <Release>[];
      json['release'].forEach((v) {
        release!.add(new Release.fromJson(v));
      });
    }

    if (json['languages'] != null) {
      languages = <Language>[];
      json['languages'].forEach((v) {
        languages!.add(new Language.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = <Genre>[];
      json['genres'].forEach((v) {
        genres!.add(new Genre.fromJson(v));
      });
    }
    sEditLock = json['_edit_lock'];
    sThumbnailId = json['_thumbnail_id'];
    sEditLast = json['_edit_last'];
    sYoastIndexnowLastPing = json['_yoast_indexnow_last_ping'];
    titleMovie = json['title_movie'];
    faTitleMovie = json['fa_title_movie'];
    releaseMovie = json['release_movie'];
    countryMovie = json['country_movie'];
    languageMovie = json['language_movie'];
    genreMovie = json['genre_movie'];
    imdbRateMovie = json['imdb_rate_movie'];
    starsMovie = json['stars_movie'];
    directorMovie = json['director_movie'];
    imdbidMovie = json['imdbid_movie'];
    voteMovie = json['vote_movie'];
    runtimeMovie = json['runtime_movie'];
    faPlotMovie = json['fa_plot_movie'];
    movieUpdateText = json['movie_update_text'];
    movieThumbBg = json['movie_thumb_bg'];
    moviesDlbox = json['movies_dlbox'];
    sYoastWpseoPrimaryMovieCats = json['_yoast_wpseo_primary_movie_cats'];
    sYoastWpseoPrimaryCollection = json['_yoast_wpseo_primary_collection'];
    sYoastWpseoFocuskw = json['_yoast_wpseo_focuskw'];
    sYoastWpseoLinkdex = json['_yoast_wpseo_linkdex'];
    sYoastWpseoFocuskeywords = json['_yoast_wpseo_focuskeywords'];
    sYoastWpseoKeywordsynonyms = json['_yoast_wpseo_keywordsynonyms'];
    sYoastWpseoEstimatedReadingTimeMinutes =
        json['_yoast_wpseo_estimated-reading-time-minutes'];
    sYoastWpseoWordproofTimestamp = json['_yoast_wpseo_wordproof_timestamp'];
    postViewsCount = json['post_views_count'];
    postRates = json['post_rates'];
    playonlineActive = json['playonline_active'];
    hasSubtitle = json['has_subtitle'];
    metacriticRate = json['metacritic_rate'];
    dlboxSubtitle = json['dlbox_subtitle'];
    dlboxAudio = json['dlbox_audio'];
    importerPath = json['importer_path'];
    suggestedMovie = json['suggested_movie'];
    hasDubbed = json['has_dubbed'];
    ageMovie = json['age_movie'];
    summaryAwards = json['summary_awards'];
    top250movie = json['top250movie'];
    malSiteId = json['mal_site_id'];
    malRateMovie = json['mal_rate_movie'];
    malVoteMovie = json['mal_vote_movie'];
    enPlotMovie = json['en_plot_movie'];
    titles = json['titles'];
    enTitle = json['en_title'];
    faTitle = json['fa_title'];
    enSummary = json['en_summary'];
    faSummary = json['fa_summary'];
    updateDescription = json['update_description'];
    ageRate = json['age_rate'];
    hasPlay = json['has_play'];
    runtime = json['runtime'];
    imdbId = json['imdb_id'];
    imdbRate = json['imdb_rate'];
    imdbVoteCount = json['imdb_vote_count'];
    malRate = json['mal_rate'];
    malVoteCount = json['mal_vote_count'];
    likeInfo = json['like_info'] != null
        ? new like_info.fromJson(json['like_info'])
        : null;
    genresListForDetail = genreMovie?.split(',');
    if (releaseMovie != null) {
      if (releaseMovie!.contains(',')) {
        List tmp = releaseMovie!.split(',');
        releaseYear = tmp[0];
      } else {
        releaseYear = releaseMovie;
      }
    } else {
      releaseYear = '';
    }
  }

  // void sortCommentList(){

  // }

  List<Widget> generateSmallItemsList({required double fullWidth}) {
    List<Widget> list = [];
    double width = fullWidth / 4;
    list.add(_SmallItem(
      width: width,
      text: releaseYear,
      icon: Icons.calendar_month_rounded,
    ));
    list.addIf(
        countryMovie != null && countryMovie != '',
        _SmallItem(
          width: width,
          text: countryMovie,
          icon: Icons.public,
        ));
    list.addIf(
        languageMovie != null && languageMovie != '',
        _SmallItem(
          width: width,
          text: languageMovie,
          icon: Icons.language,
        ));
    list.addIf(
        runtimeMovie != null && runtimeMovie != '',
        _SmallItem(
          width: width,
          text: runtimeMovie,
          icon: Icons.timer,
        ));
    list.addIf(
        imdbRate != null && imdbRate != '',
        _SmallItem(
          width: width,
          text: imdbRate,
          image: 'assets/images/ic_imdb_circle.png',
        ));
    list.addIf(
        malRateMovie != null && malRateMovie != '',
        _SmallItem(
          width: width,
          text: malRateMovie,
          image: 'assets/images/ic_rotten.png',
        ));
    list.addIf(
        metacriticRate != null && metacriticRate != '',
        _SmallItem(
          width: width,
          text: metacriticRate,
          image: 'assets/images/ic_metacritic.png',
        ));
    return list;
  }
}

class like_info {
  int? likes;
  int? dislikes;
  int? likePercent;
  int? dislikePercent;
  int? total;

  like_info(
      {this.likes,
      this.dislikes,
      this.likePercent,
      this.dislikePercent,
      this.total});

  like_info.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    dislikes = json['dislikes'];
    likePercent = json['like_percent'];
    dislikePercent = json['dislike_percent'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['likes'] = this.likes;
    data['dislikes'] = this.dislikes;
    data['like_percent'] = this.likePercent;
    data['dislike_percent'] = this.dislikePercent;
    data['total'] = this.total;
    return data;
  }
}

class _SmallItem extends StatelessWidget {
  const _SmallItem({
    super.key,
    this.text,
    this.image,
    this.icon,
    required this.width,
  });

  final String? text;
  final String? image;
  final IconData? icon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //  Get.width / 4.22
      width: width,
      child: MovieItemSmallDetailWidget(
        icon: image != null
            ? SizedBox(height: 20, width: 20, child: Image.asset('${image}'))
            : Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  icon,
                  color: cW,
                  size: 19,
                ),
              ),
        title: '${text}',
      ),
    );
  }
}
