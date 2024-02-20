import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:kala_rethink/widgets/fundraiseralert.dart';
import 'package:kala_rethink/widgets/locationalert.dart';
import 'package:video_player/video_player.dart';
import 'package:image/image.dart' as img;
import 'package:open_file/open_file.dart';


class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  var clrbutton = Color(0xFFF1AD0E);
  var btntext = Color(0xFF890608);
  bool showOtherButtons = false;
  bool fundraiserEnabled = false;
  String enteredLocation = "";
  File? selectedImage;
  VideoPlayerController? videoController;
  bool showVideo = false;
  double imageContainerWidth = 0;
  double imageContainerHeight = 0;
  List<PlatformFile> selectedFiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post',
          style: TextStyle(
            color: Color(0xFF630D0D),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0xFFF1AD0E),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 200,
            left: 20,
            child: SizedBox(
              height: 50,
              width: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selectedFiles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      for (var file in selectedFiles) {
                        openSelectedFile(file);
                      }
                    },
                    child: Container(
                      width: 250,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1AD0E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          selectedFiles[index].name,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (enteredLocation.isNotEmpty)
            Positioned(
              bottom: 80,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1AD0E),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Location : $enteredLocation',
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            
          Positioned(
            top: 30,
            left: 20,
            child: SizedBox(
              height: 600,
              width: 325,
              child: SingleChildScrollView(
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1AD0E),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      autofocus: true,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Let the world hear you!',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 20,
            child: selectedImage != null
                ? GestureDetector(
              onTap: () {
                // Handle tap on the image, e.g., navigate to a new screen
                // or show a dialog with the full-size image
                showImageDialog(context, selectedImage!);
              },
                  child: SizedBox(
                                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    width: imageContainerWidth,
                    height: imageContainerHeight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(selectedImage!),
                    ),
                  ),),
                              ),
                )
                : SizedBox.shrink(),
          ),
          Positioned(
            bottom: 150,
            right: 20,
            child: showVideo
                ? GestureDetector(
              onTap: () {
                // Handle tap on the video, e.g., navigate to a new screen
                // or show a dialog with video player controls
                showVideoDialog(context, videoController!);
              },
                  child: Container(
                                width: 100,
                                height: 200,
                                child: FittedBox(
                  fit: BoxFit.fitWidth, // or BoxFit.contain based on your requirement
                  child: SizedBox(
                    width: videoController!.value.size.width,
                    height: videoController!.value.size.height,
                    child: VideoPlayer(videoController!),
                  ),
                                ),
                              ),
                )
                : SizedBox.shrink(),
          ),


          Positioned(
            top: 600,
            left: 270,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showOtherButtons = !showOtherButtons;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF1AD0E),
              ),
              child: Icon(
                showOtherButtons ? Icons.remove : Icons.attach_file,
                size: 30,
                color: Color(0xFF890608),
              ),
            ),
          ),
          if (showOtherButtons)
            Positioned(
              top: 550,
              left: 270,
              child: ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF1AD0E),
                ),
                child: Icon(Icons.image, size: 30, color: Color(0xFF890608)),
              ),
            ),
          if (showOtherButtons)
            Positioned(
              top: 500,
              left: 270,
              child: ElevatedButton(
                onPressed: () {
                  pickVideo();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF1AD0E),
                ),
                child: Icon(Icons.videocam, size: 30, color: Color(0xFF890608)),
              ),
            ),
          if (showOtherButtons)
            Positioned(
              top: 450,
              left: 270,
              child: ElevatedButton(
                onPressed: () async {
                  pickFiles();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF1AD0E),
                ),
                child: Icon(Icons.file_present, size: 30, color: Color(0xFF890608)),
              ),
            ),
          if (showOtherButtons)
            Positioned(
              top: 400,
              left: 270,
              child: ElevatedButton(
                onPressed: () {
                  displayDialog(context, (String location) {
                    setState(() {
                      enteredLocation = location;
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFF1AD0E),
                ),
                child: Icon(Icons.location_on, size: 30, color: Color(0xFF890608)),
              ),
            ),
          if (showOtherButtons)
            Positioned(
              top: 350,
              left: 270,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (clrbutton == Color(0xFFF1AD0E) && btntext == Color(0xFF890608)) {
                      clrbutton = Color(0xFF890608);
                      btntext = Color(0xFFF1AD0E);
                      txt = "Fundraiser enabled";
                      fundraiserEnabled = true;
                      showAlertDialog(context);
                    } else {
                      clrbutton = Color(0xFFF1AD0E);
                      btntext = Color(0xFF890608);
                      txt = "Fundraiser disabled";
                      fundraiserEnabled = false;
                      showAlertDialog(context);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: clrbutton,
                ),
                child: Icon(Icons.currency_rupee, size: 30, color: btntext),
              ),
            ),

          if (fundraiserEnabled)
            Positioned(
              bottom: 20,
              left: 20,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: Text(
                  'Fundraiser',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // Function to show a dialog with the full-size image
  void showImageDialog(BuildContext context, File imageFile) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: imageContainerWidth,
            height: imageContainerHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.file(imageFile),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Function to show a dialog with video player controls
  // Function to show a dialog with video player controls
  void showVideoDialog(BuildContext context, VideoPlayerController controller) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: controller.value.size.width,
            height: controller.value.size.height,
            child: VideoPlayer(controller),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Pause the video when the dialog is closed
                controller.pause();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
    // Start playing the video when the dialog is shown
    controller.play();
  }

  Future pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    final imageBytes = await pickedFile.readAsBytes();
    final image = img.decodeImage(Uint8List.fromList(imageBytes));

    if (image != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
        updateContainerSize(image.width, image.height);
      });
    }
  }

  void updateContainerSize(int width, int height) {
    setState(() {
      if (height > width) {
        imageContainerWidth = 203.5;
        imageContainerHeight = 250.83333333333334;
      } else {
        imageContainerWidth = 220.8;
        imageContainerHeight = 169.6;
      }
      print(imageContainerHeight);
      print(imageContainerWidth);
    });
  }

  void openSelectedFile(PlatformFile file) async {
    String filePath = file.path ?? '';
    print('File Path: $filePath');

    if (filePath.isNotEmpty) {
      // Use flutter_pdfview to open PDF files
      if (file.extension?.toLowerCase() == 'pdf') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PDFView(
              filePath: filePath,
              enableSwipe: true,
            ),
          ),
        );
      } else {
        // For other file types, you might need additional plugins or methods
        print('Unsupported file type');
      }
    }
  }

  Future pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.video);

    if (result != null && result.files.isNotEmpty) {
      File videoFile = File(result.files.single.path!);
      videoController = VideoPlayerController.file(videoFile)
        ..initialize().then((_) {
          setState(() {
            showVideo = true;
          });
        });
    }
  }

  Future pickFiles() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'ppt', 'pptx'],
      );

      if (result != null) {
        setState(() {
          selectedFiles = result.files;
        });
      }
    } catch (e) {
      // Handle error
      print("Error picking files: $e");
    }
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }
}