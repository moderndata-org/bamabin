import 'package:bamabin/models/actor.dart';
import 'package:bamabin/models/director.dart';
import 'package:bamabin/models/release_model.dart';

import 'comment_model.dart';
import 'country_model.dart';
import 'genre_model.dart';
import 'language_model.dart';

class FilmModel {
  int? id;
  String? authorId;
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
  List<Comment>? comments;
  bool? isFinished;
  List<Country>? countries;
  List<Release>? release;
  List<Actor>? actors;
  List<Director>? directors;
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
  List<String>? genresListForDetail;

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
      this.malRate,
      this.malVoteCount});

  FilmModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
      comments = <Comment>[];
      json['comments'].forEach((v) {
        comments!.add(new Comment.fromJson(v));
      });
    }
    if (json['actors'] != null) {
      actors = <Actor>[];
      json['actors'].forEach((v) {
        actors!.add(new Actor.fromJson(v));
      });
    }
    if (json['directors'] != null) {
      directors = <Director>[];
      json['directors'].forEach((v) {
        directors!.add(new Director.fromJson(v));
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

    genresListForDetail = genreMovie!.split(',');
  }
}
