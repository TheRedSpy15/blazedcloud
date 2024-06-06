// ignore_for_file: non_constant_identifier_names

import 'package:blazedcloud/constants.dart';

class User {
  String id;
  String collectionId;
  String collectionName;
  String username;
  bool verified;
  bool emailVisibility;
  String email;
  String created;
  String updated;
  int capacity_gigs;
  bool prunable;
  bool stripe_active;
  String active_tier;

  User({
    this.id = "",
    this.collectionId = "",
    this.collectionName = "",
    this.username = "",
    this.verified = false,
    this.emailVisibility = false,
    this.email = "",
    this.created = "",
    this.updated = "",
    this.capacity_gigs = 5,
    this.prunable = false,
    this.stripe_active = false,
    this.active_tier = "",
  });

  // delete user
  Future<bool> deleteUser() async {
    await pb.collection('users').delete(id);
    return true;
  }

  // get single user
  Future<User> getUser(String id) async {
    final result = await pb.collection('users').getOne(id);

    return User(
      id: result.id,
      collectionId: result.getStringValue('collectionId'),
      collectionName: result.getStringValue('collectionName'),
      username: result.getStringValue('username'),
      verified: result.getBoolValue('verified'),
      emailVisibility: result.getBoolValue('emailVisibility'),
      email: result.getStringValue('email'),
      created: result.getStringValue('created'),
      updated: result.getStringValue('updated'),
      capacity_gigs: result.getIntValue('capacity_gigs'),
      prunable: result.getBoolValue('prunable'),
      stripe_active: result.getBoolValue('stripe_active'),
      active_tier: result.getStringValue('active_tier'),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'collectionId': collectionId,
        'collectionName': collectionName,
        'username': username,
        'verified': verified,
        'emailVisibility': emailVisibility,
        'email': email,
        'created': created,
        'updated': updated,
        'capacity_gigs': capacity_gigs,
        'prunable': prunable,
        'stripe_active': stripe_active,
        'active_tier': active_tier,
      };
}
