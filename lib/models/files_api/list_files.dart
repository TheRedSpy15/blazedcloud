class CommonPrefixes {
  String? prefix;

  CommonPrefixes({this.prefix});

  CommonPrefixes.fromJson(Map<String, dynamic> json) {
    prefix = json['Prefix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Prefix'] = prefix;
    return data;
  }
}

class Contents {
  String? checksumAlgorithm;
  String? eTag;
  String? key;
  String? lastModified;
  Owner? owner;
  RestoreStatus? restoreStatus;

  /// in bytes
  int? size;
  String? storageClass;

  Contents(
      {this.checksumAlgorithm,
      this.eTag,
      this.key,
      this.lastModified,
      this.owner,
      this.restoreStatus,
      this.size,
      this.storageClass});

  Contents.fromJson(Map<String, dynamic> json) {
    checksumAlgorithm = json['ChecksumAlgorithm'];
    eTag = json['ETag'];
    key = json['Key'];
    lastModified = json['LastModified'];
    owner = json['Owner'] != null ? Owner.fromJson(json['Owner']) : null;
    restoreStatus = json['RestoreStatus'] != null
        ? RestoreStatus.fromJson(json['RestoreStatus'])
        : null;
    size = json['Size'];
    storageClass = json['StorageClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ChecksumAlgorithm'] = checksumAlgorithm;
    data['ETag'] = eTag;
    data['Key'] = key;
    data['LastModified'] = lastModified;
    if (owner != null) {
      data['Owner'] = owner!.toJson();
    }
    if (restoreStatus != null) {
      data['RestoreStatus'] = restoreStatus!.toJson();
    }
    data['Size'] = size;
    data['StorageClass'] = storageClass;
    return data;
  }
}

class ListBucketResult {
  bool? isTruncated;
  List<Contents>? contents;
  String? name;
  String? prefix;
  String? delimiter;
  int? maxKeys;
  List<CommonPrefixes>? commonPrefixes;
  String? encodingType;
  int? keyCount;
  String? continuationToken;
  String? nextContinuationToken;
  String? startAfter;

  ListBucketResult(
      {this.isTruncated,
      this.contents,
      this.name,
      this.prefix,
      this.delimiter,
      this.maxKeys,
      this.commonPrefixes,
      this.encodingType,
      this.keyCount,
      this.continuationToken,
      this.nextContinuationToken,
      this.startAfter});

  ListBucketResult.fromJson(Map<String, dynamic> json) {
    isTruncated = json['IsTruncated'];
    if (json['Contents'] != null) {
      contents = <Contents>[];
      json['Contents'].forEach((v) {
        contents?.add(Contents.fromJson(v));
      });
    }
    name = json['Name'];
    prefix = json['Prefix'];
    delimiter = json['Delimiter'];
    maxKeys = json['MaxKeys'];
    if (json['CommonPrefixes'] != null) {
      commonPrefixes = <CommonPrefixes>[];
      json['CommonPrefixes'].forEach((v) {
        commonPrefixes?.add(CommonPrefixes.fromJson(v));
      });
    }
    encodingType = json['EncodingType'];
    keyCount = json['KeyCount'];
    continuationToken = json['ContinuationToken'];
    nextContinuationToken = json['NextContinuationToken'];
    startAfter = json['StartAfter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IsTruncated'] = isTruncated;
    if (contents != null) {
      data['Contents'] = contents!.map((v) => v.toJson()).toList();
    }
    data['Name'] = name;
    data['Prefix'] = prefix;
    data['Delimiter'] = delimiter;
    data['MaxKeys'] = maxKeys;
    if (commonPrefixes != null) {
      data['CommonPrefixes'] = commonPrefixes!.map((v) => v.toJson()).toList();
    }
    data['EncodingType'] = encodingType;
    data['KeyCount'] = keyCount;
    data['ContinuationToken'] = continuationToken;
    data['NextContinuationToken'] = nextContinuationToken;
    data['StartAfter'] = startAfter;
    return data;
  }
}

class Owner {
  String? displayName;
  String? iD;

  Owner({this.displayName, this.iD});

  Owner.fromJson(Map<String, dynamic> json) {
    displayName = json['DisplayName'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DisplayName'] = displayName;
    data['ID'] = iD;
    return data;
  }
}

class RestoreStatus {
  bool? isRestoreInProgress;
  String? restoreExpiryDate;

  RestoreStatus({this.isRestoreInProgress, this.restoreExpiryDate});

  RestoreStatus.fromJson(Map<String, dynamic> json) {
    isRestoreInProgress = json['IsRestoreInProgress'];
    restoreExpiryDate = json['RestoreExpiryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IsRestoreInProgress'] = isRestoreInProgress;
    data['RestoreExpiryDate'] = restoreExpiryDate;
    return data;
  }
}
