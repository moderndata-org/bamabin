import 'package:bamabin/api/api_handler.dart';
import 'package:bamabin/constant/classes.dart';
import 'package:bamabin/models/about_us_model.dart';
import 'package:bamabin/models/age_model.dart';
import 'package:bamabin/models/country_model.dart';
import 'package:bamabin/models/film_model.dart';
import 'package:bamabin/models/genre_model.dart';
import 'package:bamabin/widgets/MySncakBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PublicController extends GetxController {
  RxInt homeBannerIndex = 0.obs;
  ScrollController favoriteScrollController = ScrollController();
  RxBool isLoadingAboutUs = false.obs;
  RxBool hasSubscribe = false.obs;
  RxList<Genre> listGenre = <Genre>[].obs;
  RxList<AgeRate> listAge = <AgeRate>[].obs;
  RxList<Country> listCountry = <Country>[].obs;
  Rx<aboutUsModel> aboutUs = aboutUsModel().obs;
  //! Search Page
  RxBool isShowShimmerSearch = false.obs;
  RxBool isLoadingSearchResults = false.obs;
  RxBool isAdvancedSearch = false.obs;
  RxBool hasDubbed = false.obs;
  RxBool hasSubtitle = false.obs;
  late TextEditingController txtSearch;
  int page = 1;
  String searchText = '';
  RxList<FilmModel> listSearch = <FilmModel>[].obs;
  RxList<FilmModel> listSearchAdvanced = <FilmModel>[].obs;
  Rx<AdvancedSearchType> selectedType = AdvancedSearchType.none.obs;
  Rx<Genre> selectedGenre = Genre().obs;
  Rx<Country> selectedCountry = Country().obs;
  Rx<AgeRate> selectedAge = AgeRate().obs;
  //! Advanced Search
  TextEditingController txtFromYear = TextEditingController();
  TextEditingController txtToYear = TextEditingController();
  TextEditingController txtFromImdb = TextEditingController();
  TextEditingController txtToImdb = TextEditingController();
  AdvancedSearchType? lasttype;
  String? lastgenre;
  String? lastage;
  String? lastcountry;
  String? lastfromYear;
  String? lasttoYear;
  String? lastfromImdb;
  String? lasttoImdb;
  String? lastdubbed;
  String? lastsubtitle;
  //! End Advanced Search
  //! Search Page End

  void getAboutUs() {
    isLoadingAboutUs(true);
    ApiProvider().aboutUs().then((res) {
      isLoadingAboutUs(false);
      if (res.body != null) {
        if (res.body['status'] == true) {
          aboutUs(aboutUsModel.fromJson(res.body['result']));
        } else {
          getAboutUs();
        }
      } else {
        getAboutUs();
      }
    });
  }

  void clearAndOpenSearch() {
    selectedGenre(Genre());
    selectedAge(AgeRate());
    selectedCountry(Country());
    selectedType(AdvancedSearchType.none);
    isAdvancedSearch(false);
    isShowShimmerSearch(false);
    isLoadingSearchResults(false);
    hasDubbed(false);
    hasSubtitle(false);
    txtSearch.clear();
    searchText = '';
    listSearch.clear();

    Get.toNamed('/search');
  }

  void checkAndSendAdvancedSearch({
    String? FromYear,
    String? ToYear,
    String? FromImdb,
    String? ToImdb,
  }) {
    bool checkFromYear = true;
    bool checkToYear = true;
    bool checkFromImdb = true;
    bool checkToImdb = true;
    if (FromYear != null) {
      if (int.tryParse(FromYear)! < 1900) {
        checkFromYear = false;
      }
    }
    if (ToYear != null) {
      if (int.tryParse(ToYear)! < 1900) {
        checkToYear = false;
      }
    }
    if (FromImdb != null) {
      if (int.tryParse(FromImdb)! > 10) {
        checkFromImdb = false;
      }
    }
    if (ToImdb != null) {
      if (int.tryParse(ToImdb)! > 10) {
        checkToImdb = false;
      }
    }
    if (checkFromYear && checkToYear && checkFromImdb && checkToImdb) {
      advancedSearch(
          type: selectedType.value == AdvancedSearchType.none
              ? AdvancedSearchType.all
              : selectedType.value,
          age: '${selectedAge.value.id ?? ''}',
          country: '${selectedCountry.value.id ?? ''}',
          fromYear: FromYear ?? '',
          toYear: ToYear ?? '',
          fromImdb: FromImdb ?? '',
          toImdb: ToImdb ?? '',
          genre: '${selectedGenre.value.id ?? ''}');
    } else {
      if (checkFromYear == false || checkToYear == false) {
        showErrorMessage(message: 'لطفا سال را از 1900 به بالا وارد نمایید');
      }
    }
  }

  void showErrorMessage({required String message}) {
    MySnackBar(
      message: message,
      color: Colors.amber,
      icon: Icon(
        Icons.warning_rounded,
        color: Colors.amber,
      ),
    );
  }

  void getGenre() {
    ApiProvider().getGenres().then((res) {
      listGenre.clear();
      if (res.body != null && res.body['status'] == true) {
        List tmp = res.body['result'];
        tmp.forEach((element) {
          listGenre.add(Genre.fromJson(element));
        });
      } else {
        getGenre();
      }
    });
  }

  void getCountries() {
    ApiProvider().getCountries().then((res) {
      listCountry.clear();
      if (res.body != null && res.body['status'] == true) {
        List tmp = res.body['result'];
        tmp.forEach((element) {
          listCountry.add(Country.fromJson(element));
        });
      } else {
        getCountries();
      }
    });
  }

  void getAges() {
    ApiProvider().getAgeRates().then((res) {
      listAge.clear();
      if (res.body != null && res.body['status'] == true) {
        List tmp = res.body['result'];
        tmp.forEach((element) {
          listAge.add(AgeRate.fromJson(element));
        });
      } else {
        getAges();
      }
    });
  }

  void advanedSearchMore() {
    if (isLoadingSearchResults.isFalse) {
      page++;
      isLoadingSearchResults(true);
      ApiProvider()
          .advancedSearch(
        page: page,
        type: lasttype!,
        ageRates: lastage ?? '',
        countryId: lastcountry ?? '',
        fromImdb: lastfromImdb ?? '',
        toImdb: lasttoImdb ?? '',
        fromYear: lastfromYear ?? '',
        toYear: lasttoYear ?? '',
        genreId: lastgenre ?? '',
        isDubbed: lastgenre ?? '',
        isSubtitle: lastgenre ?? '',
      )
          .then((res) {
        isLoadingSearchResults(false);
        if (res.body != null && res.body['status'] == true) {
          List tmp = [];
          if (res.body['result']['movies'] != null) {
            tmp = res.body['result']['movies'];
          }
          if (res.body['result']['series'] != null) {
            tmp = res.body['result']['series'];
          }
          tmp.forEach((element) {
            listSearchAdvanced.add(FilmModel.fromJson(element));
          });
        }
      });
    }
  }

  void advancedSearch({
    required AdvancedSearchType type,
    String? genre,
    String? age,
    String? country,
    String? fromYear,
    String? toYear,
    String? fromImdb,
    String? toImdb,
  }) {
    lasttype = type;
    lastgenre = genre;
    lastage = age;
    lastcountry = country;
    lastfromYear = fromYear;
    lasttoYear = toYear;
    lastfromImdb = fromImdb;
    lasttoImdb = toImdb;
    isAdvancedSearch(true);
    lastdubbed = hasDubbed.isTrue ? 'on' : '';
    lastsubtitle = hasSubtitle.isTrue ? 'on' : '';
    isShowShimmerSearch(true);
    isLoadingSearchResults(true);
    Navigator.pop(Get.context!);
    txtSearch.clear();
    ApiProvider()
        .advancedSearch(
      page: 1,
      type: type,
      ageRates: age,
      countryId: country,
      fromImdb: fromImdb,
      toImdb: toImdb,
      fromYear: fromYear,
      toYear: toYear,
      genreId: genre,
      isDubbed: hasDubbed.isTrue ? 'on' : '',
      isSubtitle: hasSubtitle.isTrue ? 'on' : '',
    )
        .then((res) {
      isLoadingSearchResults(false);
      isShowShimmerSearch(false);
      listSearchAdvanced.clear();
      if (res.body != null && res.body['status'] == true) {
        List tmp = [];
        if (res.body['result']['movies'] != null) {
          tmp = res.body['result']['movies'];
        }
        if (res.body['result']['series'] != null) {
          tmp = res.body['result']['series'];
        }
        tmp.forEach((element) {
          listSearchAdvanced.add(FilmModel.fromJson(element));
        });
      }
    });
  }

  void search({required bool isFirstPage}) {
    if (isLoadingSearchResults.isFalse) {
      isAdvancedSearch(false);
      isLoadingSearchResults(true);
      if (isFirstPage) {
        searchText = txtSearch.text.trim();
        page = 1;
        isShowShimmerSearch(true);
        listSearch.clear();
      } else {
        page += 1;
      }
      ApiProvider().search(text: searchText, page: page).then((res) {
        print(res.body);
        if (res.body != null) {
          isLoadingSearchResults(false);
          isShowShimmerSearch(false);
          if (res.body['status'] == true) {
            List tmp = [];
            if (res.body['result']['movies'] != null) {
              tmp += res.body['result']['movies'];
            }
            if (res.body['result']['series'] != null) {
              tmp += res.body['result']['series'];
            }
            if (res.body['result']['animations'] != null) {
              tmp += res.body['result']['animations'];
            }
            if (res.body['result']['anime'] != null) {
              tmp += res.body['result']['anime'];
            }
            tmp.forEach((element) {
              listSearch.add(FilmModel.fromJson(element));
            });
          }
        }
      });
    }
  }

  @override
  void onInit() {
    txtSearch = TextEditingController();
    getGenre();
    getAges();
    getCountries();
    getAboutUs();
    super.onInit();
  }
}
