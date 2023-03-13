import 'package:image_picker/image_picker.dart';

class ImagesPickerServices {
  final ImagePicker picker = ImagePicker();

  Future<List<XFile>?> pickImages() async {
    final images = await picker.pickMultiImage();
    return images;
  }
}
