enum Quality { FourK, FHD, HD, SD, Cam }

enum MovieType { Dubbed, Subtitle, Cam, None }

enum SubtitleType { HardSub, SoftSub }

enum ActionMethod { Play, Download }

enum LikeAction { like, dislike, notSelected }

enum FavoriteAction {
  Add,
  Remove,
}

enum DownloadState {
  play,
  pause,
  retry,
  failed,
}

enum OrderBy { none, newest, update, releaseDate, favorite, imdb }

enum BottomNavType { home, movies, series, animations, anime }

enum AdvancedSearchType { all, movies, series, animations, anime, none }
