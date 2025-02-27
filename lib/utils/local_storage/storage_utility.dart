import 'package:get_storage/get_storage.dart';

// it has a singleton pattern implemented ,so that only one instance can be used throughout
// wherever we are going to use this TLocalStorage in our design 

class TLocalStorage {
  late final GetStorage _storage;

  // Singleton instance

  //This line declares a static variable _instance of type TLocalStorage?.
  // This variable will hold the single instance of TLocalStorage once it's created.
static TLocalStorage? _instance;


//Here, _internal is a private constructor for TLocalStorage
  TLocalStorage._internal();

  // factory constructor ensures that only one instance of TLocalStorage is created
  factory TLocalStorage.instance() {
  //  If _instance is null, it assigns a new instance of TLocalStorage to it.
    _instance  ??= TLocalStorage._internal();
    return _instance!;
  }

  //This is a static method that initializes the local storage. It takes bucketName (a unique name) as a parameter
  // and uses it to set up the storage.
  static Future<void> init(String bucketName) async{
    await GetStorage.init(bucketName);
    _instance = TLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  // Generic method to save data
  // T : means that it is a generic type you can pass any type of value over here and when i pass the value this T will take that value type
  Future<void> writeData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}


/// *** *** *** *** *** Example *** *** *** *** *** ///

// LocalStorage localStorage = LocalStorage();
//
// // Save data
// localStorage.saveData('username', 'JohnDoe');
//
// // Read data
// String? username = localStorage.readData<String>('username');
// print('Username: $username'); // Output: Username: JohnDoe
//
// // Remove data
// localStorage.removeData('username');
//
// // Clear all data
// localStorage.clearAll();

