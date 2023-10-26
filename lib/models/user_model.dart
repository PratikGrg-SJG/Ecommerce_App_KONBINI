import 'package:firebase_auth/firebase_auth.dart';
import 'package:konbini/services/firebase_service.dart';

final FirebaseService _service = FirebaseService();

class UserModel {
  String? userName, userEmail;
  String? userAddress, userPhoneNumber, userImage;

  UserModel(
      {this.userName,
      this.userEmail,
      this.userAddress,
      this.userImage,
      this.userPhoneNumber});

  // Fetching user data using the UserModel class
  Future<UserModel?> fetchUserDataUsingModel() async {
    User? user = FirebaseAuth.instance.currentUser;

    String? userEmail;
    String? userName;
    String? userImage;

    try {
      var userSnapshot = await _service.user.doc(user!.uid).get();

      if (user.displayName != null && user.displayName!.isNotEmpty) {
        userName = user.displayName;
      } else if (userSnapshot.exists && userSnapshot["userName"] != null) {
        userName = userSnapshot['userName'];
      }

      userEmail = user.email;
      if (user.photoURL != null && user.photoURL!.isNotEmpty) {
        userImage = user.photoURL;
      } else if (userSnapshot.exists && userSnapshot['userImage'] != null) {
        userImage = userSnapshot['userImage'];
      }
      // else if (!userSnapshot.exists) {
      //   print("No image available");
      //   userImage = 'assets/icons/heart.png';
      // }

      return UserModel(
        userName: userName,
        userEmail: userEmail,
        userImage: userImage,
      );
    } catch (error) {
      print('Error fetching user data: $error');
      return null;
    }
  }
}
