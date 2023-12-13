import 'package:blazedcloud/models/pocketbase/user.dart';

int getTotalGigCapacity(User user) {
  int total = 0;

  total += user.capacity_gigs;

  if (user.terabyte_active) {
    total += 1000;
  }

  return total;
}
