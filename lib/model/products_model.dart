class Products {
  List<Data> data;

  Products({this.data});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String name;
  String images;
  List<Models> models;

  Data({this.id, this.name, this.images, this.models});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'];
    if (json['models'] != null) {
      models = new List<Models>();
      json['models'].forEach((v) {
        models.add(new Models.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['images'] = this.images;
    if (this.models != null) {
      data['models'] = this.models.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Models {
  int id;
  String modelName;
  String description;
  String howToUse;
  String driver;
  String type;
  String size;
  int checkTimes;
  List<Images> images;
  List<Features> features;

  Models(
      {this.id,
        this.modelName,
        this.description,
        this.howToUse,
        this.driver,
        this.type,
        this.size,
        this.checkTimes,
        this.images,
        this.features});

  Models.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    modelName = json['model_name'];
    description = json['description'];
    howToUse = json['how_to_use'];
    driver = json['driver'];
    type = json['type'];
    size = json['size'];
    checkTimes = json['checkTimes'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    if (json['features'] != null) {
      features = new List<Features>();
      json['features'].forEach((v) {
        features.add(new Features.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model_name'] = this.modelName;
    data['description'] = this.description;
    data['how_to_use'] = this.howToUse;
    data['driver'] = this.driver;
    data['type'] = this.type;
    data['size'] = this.size;
    data['checkTimes'] = this.checkTimes;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    if (this.features != null) {
      data['features'] = this.features.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int id;
  String images;

  Images({this.id, this.images});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    images = json['images'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['images'] = this.images;
    return data;
  }
}

class Features {
  int id;
  String feature;

  Features({this.id, this.feature});

  Features.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    feature = json['feature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['feature'] = this.feature;
    return data;
  }
}