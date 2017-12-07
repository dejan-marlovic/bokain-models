// GENERATED CODE - DO NOT MODIFY BY HAND

part of model_base;

// **************************************************************************
// Generator: SerializableGenerator
// **************************************************************************

abstract class _$ConsultationSerializable extends SerializableMap {
  bool get area_face;
  bool get area_chest;
  bool get area_back;
  bool get area_other;
  String get skin_type_id;
  String get customer_id;
  String get salon_id;
  String get service_id;
  String get user_id;
  String get comments_internal;
  String get description;
  List<String> get zones;
  List<String> get image_uris;
  List<ProductRoutinePair> get product_routines;
  SymptomMap get symptoms;
  bool get has_poke_habits;
  String get poke_habits_frequency;
  List<String> get poke_habits_how;
  String get poke_habits_result;
  List<String> get poke_habits_consciously;
  String get poke_habits_consciously_other;
  List<String> get poke_habits_unconsciously;
  String get poke_habits_unconsciously_other;
  bool get is_stressed;
  List<String> get stress_causes;
  String get stress_causes_other;
  bool get has_insomnia;
  int get has_insomnia_hours_sleep;
  String get has_insomnia_bedtime;
  String get has_insomnia_time_rise;
  bool get does_exercise;
  String get does_exercise_description;
  bool get is_climate_sensitive;
  String get is_climate_sensitive_description;
  String get is_climate_sensitive_sun_effect;
  List<String> get touching_objects;
  String get touching_objects_other;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set area_face(bool v);
  void set area_chest(bool v);
  void set area_back(bool v);
  void set area_other(bool v);
  void set skin_type_id(String v);
  void set customer_id(String v);
  void set salon_id(String v);
  void set service_id(String v);
  void set user_id(String v);
  void set comments_internal(String v);
  void set description(String v);
  void set zones(List<String> v);
  void set image_uris(List<String> v);
  void set product_routines(List<ProductRoutinePair> v);
  void set symptoms(SymptomMap v);
  void set has_poke_habits(bool v);
  void set poke_habits_frequency(String v);
  void set poke_habits_how(List<String> v);
  void set poke_habits_result(String v);
  void set poke_habits_consciously(List<String> v);
  void set poke_habits_consciously_other(String v);
  void set poke_habits_unconsciously(List<String> v);
  void set poke_habits_unconsciously_other(String v);
  void set is_stressed(bool v);
  void set stress_causes(List<String> v);
  void set stress_causes_other(String v);
  void set has_insomnia(bool v);
  void set has_insomnia_hours_sleep(int v);
  void set has_insomnia_bedtime(String v);
  void set has_insomnia_time_rise(String v);
  void set does_exercise(bool v);
  void set does_exercise_description(String v);
  void set is_climate_sensitive(bool v);
  void set is_climate_sensitive_description(String v);
  void set is_climate_sensitive_sun_effect(String v);
  void set touching_objects(List<String> v);
  void set touching_objects_other(String v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  Map<dynamic, dynamic> toMap();
  String toString();

  operator [](Object __key) {
    switch (__key) {
      case 'area_face':
        return area_face;
      case 'area_chest':
        return area_chest;
      case 'area_back':
        return area_back;
      case 'area_other':
        return area_other;
      case 'skin_type_id':
        return skin_type_id;
      case 'customer_id':
        return customer_id;
      case 'salon_id':
        return salon_id;
      case 'service_id':
        return service_id;
      case 'user_id':
        return user_id;
      case 'comments_internal':
        return comments_internal;
      case 'description':
        return description;
      case 'zones':
        return zones;
      case 'image_uris':
        return image_uris;
      case 'product_routines':
        return product_routines;
      case 'symptoms':
        return symptoms;
      case 'has_poke_habits':
        return has_poke_habits;
      case 'poke_habits_frequency':
        return poke_habits_frequency;
      case 'poke_habits_how':
        return poke_habits_how;
      case 'poke_habits_result':
        return poke_habits_result;
      case 'poke_habits_consciously':
        return poke_habits_consciously;
      case 'poke_habits_consciously_other':
        return poke_habits_consciously_other;
      case 'poke_habits_unconsciously':
        return poke_habits_unconsciously;
      case 'poke_habits_unconsciously_other':
        return poke_habits_unconsciously_other;
      case 'is_stressed':
        return is_stressed;
      case 'stress_causes':
        return stress_causes;
      case 'stress_causes_other':
        return stress_causes_other;
      case 'has_insomnia':
        return has_insomnia;
      case 'has_insomnia_hours_sleep':
        return has_insomnia_hours_sleep;
      case 'has_insomnia_bedtime':
        return has_insomnia_bedtime;
      case 'has_insomnia_time_rise':
        return has_insomnia_time_rise;
      case 'does_exercise':
        return does_exercise;
      case 'does_exercise_description':
        return does_exercise_description;
      case 'is_climate_sensitive':
        return is_climate_sensitive;
      case 'is_climate_sensitive_description':
        return is_climate_sensitive_description;
      case 'is_climate_sensitive_sun_effect':
        return is_climate_sensitive_sun_effect;
      case 'touching_objects':
        return touching_objects;
      case 'touching_objects_other':
        return touching_objects_other;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toMap':
        return toMap;
      case 'toString':
        return toString;
    }
    throwFieldNotFoundException(__key, 'Consultation');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'area_face':
        area_face = __value;
        return;
      case 'area_chest':
        area_chest = __value;
        return;
      case 'area_back':
        area_back = __value;
        return;
      case 'area_other':
        area_other = __value;
        return;
      case 'skin_type_id':
        skin_type_id = __value;
        return;
      case 'customer_id':
        customer_id = __value;
        return;
      case 'salon_id':
        salon_id = __value;
        return;
      case 'service_id':
        service_id = __value;
        return;
      case 'user_id':
        user_id = __value;
        return;
      case 'comments_internal':
        comments_internal = __value;
        return;
      case 'description':
        description = __value;
        return;
      case 'zones':
        zones = __value;
        return;
      case 'image_uris':
        image_uris = __value;
        return;
      case 'product_routines':
        product_routines = __value;
        return;
      case 'symptoms':
        symptoms = __value;
        return;
      case 'has_poke_habits':
        has_poke_habits = __value;
        return;
      case 'poke_habits_frequency':
        poke_habits_frequency = __value;
        return;
      case 'poke_habits_how':
        poke_habits_how = __value;
        return;
      case 'poke_habits_result':
        poke_habits_result = __value;
        return;
      case 'poke_habits_consciously':
        poke_habits_consciously = __value;
        return;
      case 'poke_habits_consciously_other':
        poke_habits_consciously_other = __value;
        return;
      case 'poke_habits_unconsciously':
        poke_habits_unconsciously = __value;
        return;
      case 'poke_habits_unconsciously_other':
        poke_habits_unconsciously_other = __value;
        return;
      case 'is_stressed':
        is_stressed = __value;
        return;
      case 'stress_causes':
        stress_causes = __value;
        return;
      case 'stress_causes_other':
        stress_causes_other = __value;
        return;
      case 'has_insomnia':
        has_insomnia = __value;
        return;
      case 'has_insomnia_hours_sleep':
        has_insomnia_hours_sleep = __value;
        return;
      case 'has_insomnia_bedtime':
        has_insomnia_bedtime = __value;
        return;
      case 'has_insomnia_time_rise':
        has_insomnia_time_rise = __value;
        return;
      case 'does_exercise':
        does_exercise = __value;
        return;
      case 'does_exercise_description':
        does_exercise_description = __value;
        return;
      case 'is_climate_sensitive':
        is_climate_sensitive = __value;
        return;
      case 'is_climate_sensitive_description':
        is_climate_sensitive_description = __value;
        return;
      case 'is_climate_sensitive_sun_effect':
        is_climate_sensitive_sun_effect = __value;
        return;
      case 'touching_objects':
        touching_objects = __value;
        return;
      case 'touching_objects_other':
        touching_objects_other = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Consultation');
  }

  Iterable<String> get keys => const [
        'area_face',
        'area_chest',
        'area_back',
        'area_other',
        'skin_type_id',
        'customer_id',
        'salon_id',
        'service_id',
        'user_id',
        'comments_internal',
        'description',
        'zones',
        'image_uris',
        'product_routines',
        'symptoms',
        'has_poke_habits',
        'poke_habits_frequency',
        'poke_habits_how',
        'poke_habits_result',
        'poke_habits_consciously',
        'poke_habits_consciously_other',
        'poke_habits_unconsciously',
        'poke_habits_unconsciously_other',
        'is_stressed',
        'stress_causes',
        'stress_causes_other',
        'has_insomnia',
        'has_insomnia_hours_sleep',
        'has_insomnia_bedtime',
        'has_insomnia_time_rise',
        'does_exercise',
        'does_exercise_description',
        'is_climate_sensitive',
        'is_climate_sensitive_description',
        'is_climate_sensitive_sun_effect',
        'touching_objects',
        'touching_objects_other',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$CustomerSerializable extends SerializableMap {
  int get age;
  String get belongs_to;
  String get care_of;
  String get comments_external;
  String get comments_internal;
  String get consultationId;
  String get city;
  String get country;
  String get email;
  String get emailShop;
  String get firstname;
  String get lastname;
  String get phone;
  String get postal_code;
  String get language;
  String get social_number;
  String get street;
  String get password;
  String get sex;
  List<String> get booking_ids;
  List<String> get journal_entry_ids;
  String get afterImageUrl;
  String get beforeImageUrl;
  String get customerId;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set age(int v);
  void set belongs_to(String v);
  void set care_of(String v);
  void set comments_external(String v);
  void set comments_internal(String v);
  void set consultationId(String v);
  void set city(String v);
  void set country(String v);
  void set email(String v);
  void set emailShop(String v);
  void set firstname(String v);
  void set lastname(String v);
  void set phone(String v);
  void set postal_code(String v);
  void set language(String v);
  void set social_number(String v);
  void set street(String v);
  void set password(String v);
  void set sex(String v);
  void set booking_ids(List<String> v);
  void set journal_entry_ids(List<String> v);
  void set afterImageUrl(String v);
  void set beforeImageUrl(String v);
  void set customerId(String v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'age':
        return age;
      case 'belongs_to':
        return belongs_to;
      case 'care_of':
        return care_of;
      case 'comments_external':
        return comments_external;
      case 'comments_internal':
        return comments_internal;
      case 'consultationId':
        return consultationId;
      case 'city':
        return city;
      case 'country':
        return country;
      case 'email':
        return email;
      case 'emailShop':
        return emailShop;
      case 'firstname':
        return firstname;
      case 'lastname':
        return lastname;
      case 'phone':
        return phone;
      case 'postal_code':
        return postal_code;
      case 'language':
        return language;
      case 'social_number':
        return social_number;
      case 'street':
        return street;
      case 'password':
        return password;
      case 'sex':
        return sex;
      case 'booking_ids':
        return booking_ids;
      case 'journal_entry_ids':
        return journal_entry_ids;
      case 'afterImageUrl':
        return afterImageUrl;
      case 'beforeImageUrl':
        return beforeImageUrl;
      case 'customerId':
        return customerId;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'Customer');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'age':
        age = __value;
        return;
      case 'belongs_to':
        belongs_to = __value;
        return;
      case 'care_of':
        care_of = __value;
        return;
      case 'comments_external':
        comments_external = __value;
        return;
      case 'comments_internal':
        comments_internal = __value;
        return;
      case 'consultationId':
        consultationId = __value;
        return;
      case 'city':
        city = __value;
        return;
      case 'country':
        country = __value;
        return;
      case 'email':
        email = __value;
        return;
      case 'emailShop':
        emailShop = __value;
        return;
      case 'firstname':
        firstname = __value;
        return;
      case 'lastname':
        lastname = __value;
        return;
      case 'phone':
        phone = __value;
        return;
      case 'postal_code':
        postal_code = __value;
        return;
      case 'language':
        language = __value;
        return;
      case 'social_number':
        social_number = __value;
        return;
      case 'street':
        street = __value;
        return;
      case 'password':
        password = __value;
        return;
      case 'sex':
        sex = __value;
        return;
      case 'booking_ids':
        booking_ids = __value;
        return;
      case 'journal_entry_ids':
        journal_entry_ids = __value;
        return;
      case 'afterImageUrl':
        afterImageUrl = __value;
        return;
      case 'beforeImageUrl':
        beforeImageUrl = __value;
        return;
      case 'customerId':
        customerId = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Customer');
  }

  Iterable<String> get keys => const [
        'age',
        'belongs_to',
        'care_of',
        'comments_external',
        'comments_internal',
        'consultationId',
        'city',
        'country',
        'email',
        'emailShop',
        'firstname',
        'lastname',
        'phone',
        'postal_code',
        'language',
        'social_number',
        'street',
        'password',
        'sex',
        'booking_ids',
        'journal_entry_ids',
        'afterImageUrl',
        'beforeImageUrl',
        'customerId',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$IngredientSerializable extends SerializableMap {
  String get name;
  SimpleModel get type;
  SimpleModel get grade;
  String get added_by;
  String get status;
  DateTime get created;
  String get id;
  void set name(String v);
  void set type(SimpleModel v);
  void set grade(SimpleModel v);
  void set added_by(String v);
  void set status(String v);
  void set created(DateTime v);
  void set id(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'type':
        return type;
      case 'grade':
        return grade;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'created':
        return created;
      case 'id':
        return id;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'Ingredient');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'type':
        type = __value;
        return;
      case 'grade':
        grade = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'id':
        id = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Ingredient');
  }

  Iterable<String> get keys =>
      const ['name', 'type', 'grade', 'added_by', 'status', 'created', 'id'];
}

abstract class _$IngredientPhrasesSerializable extends SerializableMap {
  String get name;
  String get name_inci;
  String get category;
  List<String> get benefits;
  List<String> get effects;
  List<String> get sideEffects;
  String get origin;
  String get trivia;
  void set name(String v);
  void set name_inci(String v);
  void set category(String v);
  void set benefits(List<String> v);
  void set effects(List<String> v);
  void set sideEffects(List<String> v);
  void set origin(String v);
  void set trivia(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'name_inci':
        return name_inci;
      case 'category':
        return category;
      case 'benefits':
        return benefits;
      case 'effects':
        return effects;
      case 'sideEffects':
        return sideEffects;
      case 'origin':
        return origin;
      case 'trivia':
        return trivia;
    }
    throwFieldNotFoundException(__key, 'IngredientPhrases');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'name_inci':
        name_inci = __value;
        return;
      case 'category':
        category = __value;
        return;
      case 'benefits':
        benefits = __value;
        return;
      case 'effects':
        effects = __value;
        return;
      case 'sideEffects':
        sideEffects = __value;
        return;
      case 'origin':
        origin = __value;
        return;
      case 'trivia':
        trivia = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'IngredientPhrases');
  }

  Iterable<String> get keys => const [
        'name',
        'name_inci',
        'category',
        'benefits',
        'effects',
        'sideEffects',
        'origin',
        'trivia'
      ];
}

abstract class _$ProductSerializable extends SerializableMap {
  List<String> get ingredient_ids;
  List<String> get related_product_ids;
  List<String> get sub_product_ids;
  List<String> get product_routine_ids;
  String get name;
  String get article_no;
  int get buy_price_sek;
  String get image_uri;
  num get price_eur;
  num get price_sek;
  num get price_usd;
  String get product_category_id;
  int get search_rank;
  int get score;
  int get stock;
  String get type;
  String get url_name;
  int get vat;
  int get volume;
  int get weight;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set ingredient_ids(List<String> v);
  void set related_product_ids(List<String> v);
  void set sub_product_ids(List<String> v);
  void set product_routine_ids(List<String> v);
  void set name(String v);
  void set article_no(String v);
  void set buy_price_sek(int v);
  void set image_uri(String v);
  void set price_eur(num v);
  void set price_sek(num v);
  void set price_usd(num v);
  void set product_category_id(String v);
  void set search_rank(int v);
  void set score(int v);
  void set stock(int v);
  void set type(String v);
  void set url_name(String v);
  void set vat(int v);
  void set volume(int v);
  void set weight(int v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'ingredient_ids':
        return ingredient_ids;
      case 'related_product_ids':
        return related_product_ids;
      case 'sub_product_ids':
        return sub_product_ids;
      case 'product_routine_ids':
        return product_routine_ids;
      case 'name':
        return name;
      case 'article_no':
        return article_no;
      case 'buy_price_sek':
        return buy_price_sek;
      case 'image_uri':
        return image_uri;
      case 'price_eur':
        return price_eur;
      case 'price_sek':
        return price_sek;
      case 'price_usd':
        return price_usd;
      case 'product_category_id':
        return product_category_id;
      case 'search_rank':
        return search_rank;
      case 'score':
        return score;
      case 'stock':
        return stock;
      case 'type':
        return type;
      case 'url_name':
        return url_name;
      case 'vat':
        return vat;
      case 'volume':
        return volume;
      case 'weight':
        return weight;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'Product');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'ingredient_ids':
        ingredient_ids = __value;
        return;
      case 'related_product_ids':
        related_product_ids = __value;
        return;
      case 'sub_product_ids':
        sub_product_ids = __value;
        return;
      case 'product_routine_ids':
        product_routine_ids = __value;
        return;
      case 'name':
        name = __value;
        return;
      case 'article_no':
        article_no = __value;
        return;
      case 'buy_price_sek':
        buy_price_sek = __value;
        return;
      case 'image_uri':
        image_uri = __value;
        return;
      case 'price_eur':
        price_eur = __value;
        return;
      case 'price_sek':
        price_sek = __value;
        return;
      case 'price_usd':
        price_usd = __value;
        return;
      case 'product_category_id':
        product_category_id = __value;
        return;
      case 'search_rank':
        search_rank = __value;
        return;
      case 'score':
        score = __value;
        return;
      case 'stock':
        stock = __value;
        return;
      case 'type':
        type = __value;
        return;
      case 'url_name':
        url_name = __value;
        return;
      case 'vat':
        vat = __value;
        return;
      case 'volume':
        volume = __value;
        return;
      case 'weight':
        weight = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Product');
  }

  Iterable<String> get keys => const [
        'ingredient_ids',
        'related_product_ids',
        'sub_product_ids',
        'product_routine_ids',
        'name',
        'article_no',
        'buy_price_sek',
        'image_uri',
        'price_eur',
        'price_sek',
        'price_usd',
        'product_category_id',
        'search_rank',
        'score',
        'stock',
        'type',
        'url_name',
        'vat',
        'volume',
        'weight',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$ProductPhrasesSerializable extends SerializableMap {
  String get name;
  String get description_long;
  String get description_short;
  String get usage_instructions;
  String get meta_description;
  String get meta_keywords;
  void set name(String v);
  void set description_long(String v);
  void set description_short(String v);
  void set usage_instructions(String v);
  void set meta_description(String v);
  void set meta_keywords(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'description_long':
        return description_long;
      case 'description_short':
        return description_short;
      case 'usage_instructions':
        return usage_instructions;
      case 'meta_description':
        return meta_description;
      case 'meta_keywords':
        return meta_keywords;
    }
    throwFieldNotFoundException(__key, 'ProductPhrases');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'description_long':
        description_long = __value;
        return;
      case 'description_short':
        description_short = __value;
        return;
      case 'usage_instructions':
        usage_instructions = __value;
        return;
      case 'meta_description':
        meta_description = __value;
        return;
      case 'meta_keywords':
        meta_keywords = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ProductPhrases');
  }

  Iterable<String> get keys => const [
        'name',
        'description_long',
        'description_short',
        'usage_instructions',
        'meta_description',
        'meta_keywords'
      ];
}

abstract class _$ProductCategorySerializable extends SerializableMap {
  String get name;
  String get image_uri;
  int get search_rank;
  String get url_name;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set name(String v);
  void set image_uri(String v);
  void set search_rank(int v);
  void set url_name(String v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'image_uri':
        return image_uri;
      case 'search_rank':
        return search_rank;
      case 'url_name':
        return url_name;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'ProductCategory');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'image_uri':
        image_uri = __value;
        return;
      case 'search_rank':
        search_rank = __value;
        return;
      case 'url_name':
        url_name = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ProductCategory');
  }

  Iterable<String> get keys => const [
        'name',
        'image_uri',
        'search_rank',
        'url_name',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$ProductCategoryPhrasesSerializable extends SerializableMap {
  String get name;
  String get description;
  String get meta_description;
  String get meta_keywords;
  void set name(String v);
  void set description(String v);
  void set meta_description(String v);
  void set meta_keywords(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'description':
        return description;
      case 'meta_description':
        return meta_description;
      case 'meta_keywords':
        return meta_keywords;
    }
    throwFieldNotFoundException(__key, 'ProductCategoryPhrases');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'description':
        description = __value;
        return;
      case 'meta_description':
        meta_description = __value;
        return;
      case 'meta_keywords':
        meta_keywords = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ProductCategoryPhrases');
  }

  Iterable<String> get keys =>
      const ['name', 'description', 'meta_description', 'meta_keywords'];
}

abstract class _$ProductRoutineSerializable extends SerializableMap {
  String get name;
  String get product_id;
  String get state;
  String get daily_routine_morning;
  String get daily_routine_mid_day;
  String get daily_routine_evening;
  String get weekly_routine;
  int get day_step;
  List<StartupDay> get startupDays;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set name(String v);
  void set product_id(String v);
  void set state(String v);
  void set daily_routine_morning(String v);
  void set daily_routine_mid_day(String v);
  void set daily_routine_evening(String v);
  void set weekly_routine(String v);
  void set day_step(int v);
  void set startupDays(List<StartupDay> v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'product_id':
        return product_id;
      case 'state':
        return state;
      case 'daily_routine_morning':
        return daily_routine_morning;
      case 'daily_routine_mid_day':
        return daily_routine_mid_day;
      case 'daily_routine_evening':
        return daily_routine_evening;
      case 'weekly_routine':
        return weekly_routine;
      case 'day_step':
        return day_step;
      case 'startupDays':
        return startupDays;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'ProductRoutine');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'product_id':
        product_id = __value;
        return;
      case 'state':
        state = __value;
        return;
      case 'daily_routine_morning':
        daily_routine_morning = __value;
        return;
      case 'daily_routine_mid_day':
        daily_routine_mid_day = __value;
        return;
      case 'daily_routine_evening':
        daily_routine_evening = __value;
        return;
      case 'weekly_routine':
        weekly_routine = __value;
        return;
      case 'day_step':
        day_step = __value;
        return;
      case 'startupDays':
        startupDays = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ProductRoutine');
  }

  Iterable<String> get keys => const [
        'name',
        'product_id',
        'state',
        'daily_routine_morning',
        'daily_routine_mid_day',
        'daily_routine_evening',
        'weekly_routine',
        'day_step',
        'startupDays',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$RoomSerializable extends SerializableMap {
  String get name;
  List<String> get service_ids;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set name(String v);
  void set service_ids(List<String> v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'service_ids':
        return service_ids;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'Room');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'service_ids':
        service_ids = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Room');
  }

  Iterable<String> get keys =>
      const ['name', 'service_ids', 'id', 'created', 'added_by', 'status'];
}

abstract class _$SalonSerializable extends SerializableMap {
  String get name;
  String get email;
  String get phone;
  String get street;
  String get postal_code;
  String get city;
  Map<String, String> get logo_uris;
  List<String> get room_ids;
  List<String> get user_ids;
  List<String> get booking_ids;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set name(String v);
  void set email(String v);
  void set phone(String v);
  void set street(String v);
  void set postal_code(String v);
  void set city(String v);
  void set logo_uris(Map<String, String> v);
  void set room_ids(List<String> v);
  void set user_ids(List<String> v);
  void set booking_ids(List<String> v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'email':
        return email;
      case 'phone':
        return phone;
      case 'street':
        return street;
      case 'postal_code':
        return postal_code;
      case 'city':
        return city;
      case 'logo_uris':
        return logo_uris;
      case 'room_ids':
        return room_ids;
      case 'user_ids':
        return user_ids;
      case 'booking_ids':
        return booking_ids;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'Salon');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'email':
        email = __value;
        return;
      case 'phone':
        phone = __value;
        return;
      case 'street':
        street = __value;
        return;
      case 'postal_code':
        postal_code = __value;
        return;
      case 'city':
        city = __value;
        return;
      case 'logo_uris':
        logo_uris = __value;
        return;
      case 'room_ids':
        room_ids = __value;
        return;
      case 'user_ids':
        user_ids = __value;
        return;
      case 'booking_ids':
        booking_ids = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Salon');
  }

  Iterable<String> get keys => const [
        'name',
        'email',
        'phone',
        'street',
        'postal_code',
        'city',
        'logo_uris',
        'room_ids',
        'user_ids',
        'booking_ids',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$ServiceSerializable extends SerializableMap {
  String get name;
  String get category;
  String get description;
  String get color;
  Duration get duration;
  Duration get after_margin;
  num get price;
  List<String> get room_ids;
  List<String> get user_ids;
  List<String> get service_addon_ids;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set name(String v);
  void set category(String v);
  void set description(String v);
  void set color(String v);
  void set duration(Duration v);
  void set after_margin(Duration v);
  void set price(num v);
  void set room_ids(List<String> v);
  void set user_ids(List<String> v);
  void set service_addon_ids(List<String> v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'category':
        return category;
      case 'description':
        return description;
      case 'color':
        return color;
      case 'duration':
        return duration;
      case 'after_margin':
        return after_margin;
      case 'price':
        return price;
      case 'room_ids':
        return room_ids;
      case 'user_ids':
        return user_ids;
      case 'service_addon_ids':
        return service_addon_ids;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'Service');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'category':
        category = __value;
        return;
      case 'description':
        description = __value;
        return;
      case 'color':
        color = __value;
        return;
      case 'duration':
        duration = __value;
        return;
      case 'after_margin':
        after_margin = __value;
        return;
      case 'price':
        price = __value;
        return;
      case 'room_ids':
        room_ids = __value;
        return;
      case 'user_ids':
        user_ids = __value;
        return;
      case 'service_addon_ids':
        service_addon_ids = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Service');
  }

  Iterable<String> get keys => const [
        'name',
        'category',
        'description',
        'color',
        'duration',
        'after_margin',
        'price',
        'room_ids',
        'user_ids',
        'service_addon_ids',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$ServiceAddonSerializable extends SerializableMap {
  String get description;
  String get name;
  num get price;
  Duration get duration;
  List<String> get service_ids;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set description(String v);
  void set name(String v);
  void set price(num v);
  void set duration(Duration v);
  void set service_ids(List<String> v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'description':
        return description;
      case 'name':
        return name;
      case 'price':
        return price;
      case 'duration':
        return duration;
      case 'service_ids':
        return service_ids;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'ServiceAddon');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'description':
        description = __value;
        return;
      case 'name':
        name = __value;
        return;
      case 'price':
        price = __value;
        return;
      case 'duration':
        duration = __value;
        return;
      case 'service_ids':
        service_ids = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'ServiceAddon');
  }

  Iterable<String> get keys => const [
        'description',
        'name',
        'price',
        'duration',
        'service_ids',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$SettingsSerializable extends SerializableMap {
  List<List<ProductRoutinePair>> get spr;
  int get latest_cancel_booking_hours_before;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set spr(List<List<ProductRoutinePair>> v);
  void set latest_cancel_booking_hours_before(int v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  Map<dynamic, dynamic> toMap();
  String toString();

  operator [](Object __key) {
    switch (__key) {
      case 'spr':
        return spr;
      case 'latest_cancel_booking_hours_before':
        return latest_cancel_booking_hours_before;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toMap':
        return toMap;
      case 'toString':
        return toString;
    }
    throwFieldNotFoundException(__key, 'Settings');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'spr':
        spr = __value;
        return;
      case 'latest_cancel_booking_hours_before':
        latest_cancel_booking_hours_before = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Settings');
  }

  Iterable<String> get keys => const [
        'spr',
        'latest_cancel_booking_hours_before',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$UserSerializable extends SerializableMap {
  String get profile_image_uri;
  String get city;
  String get email;
  String get firstname;
  String get lastname;
  String get phone;
  String get postal_code;
  String get social_number;
  String get street;
  String get password;
  int get booking_rank;
  List<String> get customer_ids;
  List<String> get salon_ids;
  List<String> get service_ids;
  List<String> get booking_ids;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set profile_image_uri(String v);
  void set city(String v);
  void set email(String v);
  void set firstname(String v);
  void set lastname(String v);
  void set phone(String v);
  void set postal_code(String v);
  void set social_number(String v);
  void set street(String v);
  void set password(String v);
  void set booking_rank(int v);
  void set customer_ids(List<String> v);
  void set salon_ids(List<String> v);
  void set service_ids(List<String> v);
  void set booking_ids(List<String> v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'profile_image_uri':
        return profile_image_uri;
      case 'city':
        return city;
      case 'email':
        return email;
      case 'firstname':
        return firstname;
      case 'lastname':
        return lastname;
      case 'phone':
        return phone;
      case 'postal_code':
        return postal_code;
      case 'social_number':
        return social_number;
      case 'street':
        return street;
      case 'password':
        return password;
      case 'booking_rank':
        return booking_rank;
      case 'customer_ids':
        return customer_ids;
      case 'salon_ids':
        return salon_ids;
      case 'service_ids':
        return service_ids;
      case 'booking_ids':
        return booking_ids;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'User');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'profile_image_uri':
        profile_image_uri = __value;
        return;
      case 'city':
        city = __value;
        return;
      case 'email':
        email = __value;
        return;
      case 'firstname':
        firstname = __value;
        return;
      case 'lastname':
        lastname = __value;
        return;
      case 'phone':
        phone = __value;
        return;
      case 'postal_code':
        postal_code = __value;
        return;
      case 'social_number':
        social_number = __value;
        return;
      case 'street':
        street = __value;
        return;
      case 'password':
        password = __value;
        return;
      case 'booking_rank':
        booking_rank = __value;
        return;
      case 'customer_ids':
        customer_ids = __value;
        return;
      case 'salon_ids':
        salon_ids = __value;
        return;
      case 'service_ids':
        service_ids = __value;
        return;
      case 'booking_ids':
        booking_ids = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'User');
  }

  Iterable<String> get keys => const [
        'profile_image_uri',
        'city',
        'email',
        'firstname',
        'lastname',
        'phone',
        'postal_code',
        'social_number',
        'street',
        'password',
        'booking_rank',
        'customer_ids',
        'salon_ids',
        'service_ids',
        'booking_ids',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$WebshopContentSerializable extends SerializableMap {
  String get name;
  String get logo_uri;
  String get favicon_uri;
  String get id;
  DateTime get created;
  String get added_by;
  String get status;
  void set name(String v);
  void set logo_uri(String v);
  void set favicon_uri(String v);
  void set id(String v);
  void set created(DateTime v);
  void set added_by(String v);
  void set status(String v);
  String toString();
  Map<dynamic, dynamic> toMap();

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'logo_uri':
        return logo_uri;
      case 'favicon_uri':
        return favicon_uri;
      case 'id':
        return id;
      case 'created':
        return created;
      case 'added_by':
        return added_by;
      case 'status':
        return status;
      case 'toString':
        return toString;
      case 'toMap':
        return toMap;
    }
    throwFieldNotFoundException(__key, 'WebshopContent');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'logo_uri':
        logo_uri = __value;
        return;
      case 'favicon_uri':
        favicon_uri = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'WebshopContent');
  }

  Iterable<String> get keys => const [
        'name',
        'logo_uri',
        'favicon_uri',
        'id',
        'created',
        'added_by',
        'status'
      ];
}

abstract class _$WebshopContentPhrasesSerializable extends SerializableMap {
  String get title;
  String get meta_description;
  String get meta_keywords;
  String get frontpage_header;
  String get frontpage_text;
  String get about_header;
  String get about_text;
  String get customer_service_header;
  String get customerServiceText;
  String get faq_header;
  String get faq_text;
  String get skin_consultation_header;
  String get skin_consultation_text;
  String get standard_terms_header;
  String get standard_terms_text;
  void set title(String v);
  void set meta_description(String v);
  void set meta_keywords(String v);
  void set frontpage_header(String v);
  void set frontpage_text(String v);
  void set about_header(String v);
  void set about_text(String v);
  void set customer_service_header(String v);
  void set customerServiceText(String v);
  void set faq_header(String v);
  void set faq_text(String v);
  void set skin_consultation_header(String v);
  void set skin_consultation_text(String v);
  void set standard_terms_header(String v);
  void set standard_terms_text(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'title':
        return title;
      case 'meta_description':
        return meta_description;
      case 'meta_keywords':
        return meta_keywords;
      case 'frontpage_header':
        return frontpage_header;
      case 'frontpage_text':
        return frontpage_text;
      case 'about_header':
        return about_header;
      case 'about_text':
        return about_text;
      case 'customer_service_header':
        return customer_service_header;
      case 'customerServiceText':
        return customerServiceText;
      case 'faq_header':
        return faq_header;
      case 'faq_text':
        return faq_text;
      case 'skin_consultation_header':
        return skin_consultation_header;
      case 'skin_consultation_text':
        return skin_consultation_text;
      case 'standard_terms_header':
        return standard_terms_header;
      case 'standard_terms_text':
        return standard_terms_text;
    }
    throwFieldNotFoundException(__key, 'WebshopContentPhrases');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'title':
        title = __value;
        return;
      case 'meta_description':
        meta_description = __value;
        return;
      case 'meta_keywords':
        meta_keywords = __value;
        return;
      case 'frontpage_header':
        frontpage_header = __value;
        return;
      case 'frontpage_text':
        frontpage_text = __value;
        return;
      case 'about_header':
        about_header = __value;
        return;
      case 'about_text':
        about_text = __value;
        return;
      case 'customer_service_header':
        customer_service_header = __value;
        return;
      case 'customerServiceText':
        customerServiceText = __value;
        return;
      case 'faq_header':
        faq_header = __value;
        return;
      case 'faq_text':
        faq_text = __value;
        return;
      case 'skin_consultation_header':
        skin_consultation_header = __value;
        return;
      case 'skin_consultation_text':
        skin_consultation_text = __value;
        return;
      case 'standard_terms_header':
        standard_terms_header = __value;
        return;
      case 'standard_terms_text':
        standard_terms_text = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'WebshopContentPhrases');
  }

  Iterable<String> get keys => const [
        'title',
        'meta_description',
        'meta_keywords',
        'frontpage_header',
        'frontpage_text',
        'about_header',
        'about_text',
        'customer_service_header',
        'customerServiceText',
        'faq_header',
        'faq_text',
        'skin_consultation_header',
        'skin_consultation_text',
        'standard_terms_header',
        'standard_terms_text'
      ];
}

abstract class _$BookingSerializable extends SerializableMap {
  DateTime get start_time;
  DateTime get end_time;
  Duration get duration;
  String get customer_id;
  String get service_id;
  String get user_id;
  String get room_id;
  String get salon_id;
  String get day_id;
  List<String> get service_addon_ids;
  bool get noshow;
  bool get invoice_sent;
  String get comments;
  num get total_duration;
  num get total_price;
  String get cancel_code;
  String get added_by;
  DateTime get created;
  String get id;
  String get status;
  void set start_time(DateTime v);
  void set end_time(DateTime v);
  void set duration(Duration v);
  void set customer_id(String v);
  void set service_id(String v);
  void set user_id(String v);
  void set room_id(String v);
  void set salon_id(String v);
  void set day_id(String v);
  void set service_addon_ids(List<String> v);
  void set noshow(bool v);
  void set invoice_sent(bool v);
  void set comments(String v);
  void set total_duration(num v);
  void set total_price(num v);
  void set cancel_code(String v);
  void set added_by(String v);
  void set created(DateTime v);
  void set id(String v);
  void set status(String v);
  Map<dynamic, dynamic> toMap();
  String toString();

  operator [](Object __key) {
    switch (__key) {
      case 'start_time':
        return start_time;
      case 'end_time':
        return end_time;
      case 'duration':
        return duration;
      case 'customer_id':
        return customer_id;
      case 'service_id':
        return service_id;
      case 'user_id':
        return user_id;
      case 'room_id':
        return room_id;
      case 'salon_id':
        return salon_id;
      case 'day_id':
        return day_id;
      case 'service_addon_ids':
        return service_addon_ids;
      case 'noshow':
        return noshow;
      case 'invoice_sent':
        return invoice_sent;
      case 'comments':
        return comments;
      case 'total_duration':
        return total_duration;
      case 'total_price':
        return total_price;
      case 'cancel_code':
        return cancel_code;
      case 'added_by':
        return added_by;
      case 'created':
        return created;
      case 'id':
        return id;
      case 'status':
        return status;
      case 'toMap':
        return toMap;
      case 'toString':
        return toString;
    }
    throwFieldNotFoundException(__key, 'Booking');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'start_time':
        start_time = __value;
        return;
      case 'end_time':
        end_time = __value;
        return;
      case 'duration':
        duration = __value;
        return;
      case 'customer_id':
        customer_id = __value;
        return;
      case 'service_id':
        service_id = __value;
        return;
      case 'user_id':
        user_id = __value;
        return;
      case 'room_id':
        room_id = __value;
        return;
      case 'salon_id':
        salon_id = __value;
        return;
      case 'day_id':
        day_id = __value;
        return;
      case 'service_addon_ids':
        service_addon_ids = __value;
        return;
      case 'noshow':
        noshow = __value;
        return;
      case 'invoice_sent':
        invoice_sent = __value;
        return;
      case 'comments':
        comments = __value;
        return;
      case 'total_duration':
        total_duration = __value;
        return;
      case 'total_price':
        total_price = __value;
        return;
      case 'cancel_code':
        cancel_code = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Booking');
  }

  Iterable<String> get keys => const [
        'start_time',
        'end_time',
        'duration',
        'customer_id',
        'service_id',
        'user_id',
        'room_id',
        'salon_id',
        'day_id',
        'service_addon_ids',
        'noshow',
        'invoice_sent',
        'comments',
        'total_duration',
        'total_price',
        'cancel_code',
        'added_by',
        'created',
        'id',
        'status'
      ];
}

abstract class _$DaySerializable extends SerializableMap {
  List<Increment> get increments;
  DateTime get start_time;
  DateTime get end_time;
  String get salon_id;
  String get id;
  String get added_by;
  DateTime get created;
  String get status;
  void set increments(List<Increment> v);
  void set start_time(DateTime v);
  void set end_time(DateTime v);
  void set salon_id(String v);
  void set id(String v);
  void set added_by(String v);
  void set created(DateTime v);
  void set status(String v);
  bool isPopulated(String salonId, String userId);
  bool hasBookings(String user_id);
  Map<dynamic, dynamic> toMap();
  String toString();

  operator [](Object __key) {
    switch (__key) {
      case 'increments':
        return increments;
      case 'start_time':
        return start_time;
      case 'end_time':
        return end_time;
      case 'salon_id':
        return salon_id;
      case 'id':
        return id;
      case 'added_by':
        return added_by;
      case 'created':
        return created;
      case 'status':
        return status;
      case 'isPopulated':
        return isPopulated;
      case 'hasBookings':
        return hasBookings;
      case 'toMap':
        return toMap;
      case 'toString':
        return toString;
    }
    throwFieldNotFoundException(__key, 'Day');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'increments':
        increments = __value;
        return;
      case 'start_time':
        start_time = __value;
        return;
      case 'end_time':
        end_time = __value;
        return;
      case 'salon_id':
        salon_id = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Day');
  }

  Iterable<String> get keys => const [
        'increments',
        'start_time',
        'end_time',
        'salon_id',
        'id',
        'added_by',
        'created',
        'status'
      ];
}

abstract class _$JournalEntrySerializable extends SerializableMap {
  String get comments_external;
  String get comments_internal;
  String get customer_id;
  List<String> get image_uris;
  String get id;
  String get added_by;
  DateTime get created;
  String get status;
  void set comments_external(String v);
  void set comments_internal(String v);
  void set customer_id(String v);
  void set image_uris(List<String> v);
  void set id(String v);
  void set added_by(String v);
  void set created(DateTime v);
  void set status(String v);
  Map<dynamic, dynamic> toMap();
  String toString();

  operator [](Object __key) {
    switch (__key) {
      case 'comments_external':
        return comments_external;
      case 'comments_internal':
        return comments_internal;
      case 'customer_id':
        return customer_id;
      case 'image_uris':
        return image_uris;
      case 'id':
        return id;
      case 'added_by':
        return added_by;
      case 'created':
        return created;
      case 'status':
        return status;
      case 'toMap':
        return toMap;
      case 'toString':
        return toString;
    }
    throwFieldNotFoundException(__key, 'JournalEntry');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'comments_external':
        comments_external = __value;
        return;
      case 'comments_internal':
        comments_internal = __value;
        return;
      case 'customer_id':
        customer_id = __value;
        return;
      case 'image_uris':
        image_uris = __value;
        return;
      case 'id':
        id = __value;
        return;
      case 'added_by':
        added_by = __value;
        return;
      case 'created':
        created = __value;
        return;
      case 'status':
        status = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'JournalEntry');
  }

  Iterable<String> get keys => const [
        'comments_external',
        'comments_internal',
        'customer_id',
        'image_uris',
        'id',
        'added_by',
        'created',
        'status'
      ];
}
