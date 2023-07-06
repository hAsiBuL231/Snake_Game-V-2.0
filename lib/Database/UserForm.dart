import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:snake_game_v2/Database/UserProfile.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey<FormState> formKey5 = GlobalKey<FormState>();

  final userName = FirebaseAuth.instance.currentUser?.displayName;
  final userEmail = FirebaseAuth.instance.currentUser?.email;
  String? userImage = FirebaseAuth.instance.currentUser?.photoURL;

  String _message = 'Personal information saved successfully!';
  String error = '';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _professionController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _languageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _professionController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _dobController.dispose();
    _languageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (formKey5.currentState!.validate()) {
      try {
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');
        DateTime now = DateTime.now();
        DateTime date = DateTime(now.year, now.month, now.day);
        // Add the user data to Firestore
        await users
            .doc('$userEmail')
            .set({
              'name': _nameController.text,
              'email': userEmail.toString(),
              'profession': _professionController.text,
              'phone': _phoneController.text,
              'location': _locationController.text,
              'dob': _dobController.text,
              'language': _languageController.text,
              'joined': date,
            })
            .then((value) => SnackBar(content: Text('Data added')))
            .catchError((error) => SnackBar(content: Text('Error: $error')));

        FirebaseAuth.instance.currentUser!
            .updateDisplayName(_nameController.text);

        // Clear the form fields
        _nameController.clear();
        _professionController.clear();
        _phoneController.clear();
        _locationController.clear();
        _dobController.clear();
        _languageController.clear();
      } on FirebaseException catch (e) {
        setState(() {
          error = e.message.toString();
        });
      }

      // Show a success dialog
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  title: Text('Success'),
                  content: Text('$_message'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          //Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfile()));
                        },
                        child: Text('OK'))
                  ]));
    }
  }

  Future<void> _selectPhoto() async {
    List<Media>? pickedFile =
        await ImagesPicker.pick(count: 1, pickType: PickType.image);
    var image = pickedFile?.first;
    //final pickedFile =
    //    await ImagePicker().pickImage(source: ImageSource.gallery);
    //XFile image = await ImagePickerAndroid.pickImage(source: Images);

    if (pickedFile != null) {
      try {
        Reference ref = FirebaseStorage.instance.ref().child('profile.jpg');
        await ref.putString(image!.path);
        ref.getDownloadURL().then((value) {
          print(value);
          setState(() {
            FirebaseAuth.instance.currentUser?.updatePhotoURL(value);
            userImage = FirebaseAuth.instance.currentUser?.photoURL;
          });
        });
      } catch (e) {
        setState(() {
          error = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Information'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey5,
          child: Column(
            children: [
              Image.asset(
                'images/cover.png',
                height: 150.0,
              ),
              SizedBox(height: 16.0),
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('$userImage'),
              ),
              TextButton(
                  onPressed: () {
                    _selectPhoto();
                  },
                  child: Text('Select Image')),
              SizedBox(height: 10.0),
              Text('$error'),
              TextFormField(
                validator: (value) {
                  if (value == '')
                    return 'Please enter your Name!';
                  else
                    return null;
                },
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle, color: Colors.blue),
                  labelText: 'Name',
                  hintText: '$userName',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value == '')
                    return 'Please enter your Profession!';
                  else
                    return null;
                },
                controller: _professionController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.work, color: Colors.blue),
                  labelText: 'Profession',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value!.length < 11)
                    return 'Please enter a valid number!';
                  else
                    return null;
                },
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  prefixIcon: Icon(Icons.phone, color: Colors.blue),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value == '')
                    return 'Please enter a location!';
                  else
                    return null;
                },
                controller: _locationController,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  labelText: 'Location',
                  prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value == '')
                    return 'Please enter your Date of Birth!';
                  else
                    return null;
                },
                controller: _dobController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: 'Date of Birth',
                  prefixIcon: Icon(Icons.date_range, color: Colors.blue),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value == '')
                    return 'Please enter a language!';
                  else
                    return null;
                },
                controller: _languageController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  labelText: 'Languages',
                  prefixIcon: Icon(Icons.language, color: Colors.blue),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                onPressed: _submitForm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
