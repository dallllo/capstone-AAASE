import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';


class ScanFeatureScreen extends HookWidget {
  const ScanFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
  //  // تعريف الـ States باستخدام Hooks
  //   final extractedText = useState<String>("اضغط على الزر لتصوير نص");
  //   final isLoading = useState<bool>(false);
  //   // استخدام useMemoized لإنشاء المستخرج مرة واحدة فقط
  //   // واستخدام useEffect لإغلاقه (dispose) تلقائياً عند مسح الوجت
  //   final textRecognizer = useMemoized(() => TextRecognizer(script: TextRecognitionScript.latin));
  //   useEffect(() => textRecognizer.close, const []);
  //   // دالة المعالجة
  //   Future<void> scanText() async {
  //     final ImagePicker picker = ImagePicker();
  //     final XFile? image = await picker.pickImage(source: ImageSource.camera);
  //     if (image == null) return;
  //     isLoading.value = true;
  //     try {
  //       final inputImage = InputImage.fromFilePath(image.path);
  //       final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
  //       extractedText.value = recognizedText.text.isEmpty 
  //           ? "لم يتم العثور على نص واضح" 
  //           : recognizedText.text;
  //     } catch (e) {
  //       extractedText.value = "حدث خطأ: $e";
  //     } finally {
  //       isLoading.value = false;
  //     }
  //   
    // return Scaffold(
    //   appBar: AppBar(title: const Text("Scanner with Hooks")),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       children: [
    //         if (isLoading.value) const LinearProgressIndicator(),
    //         const SizedBox(height: 10),
    //         Expanded(
    //           child: Container(
    //             width: double.infinity,
    //             padding: const EdgeInsets.all(12),
    //             decoration: BoxDecoration(
    //               border: Border.all(color: Colors.blueGrey.shade100),
    //               borderRadius: BorderRadius.circular(12),
    //               color: Colors.grey.shade50,
    //             ),
    //             child: SingleChildScrollView(
    //               child: Text(extractedText.value),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         ElevatedButton.icon(
    //           onPressed: scanText,
    //           icon: const Icon(Icons.camera_enhance),
    //           label: const Text("التقاط صورة للنص"),
    //           style: ElevatedButton.styleFrom(
    //             minimumSize: const Size(double.infinity, 50),
    //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(title: const Text("Scanner with Hooks")),
      body: const Center(child: Text("تم حذف الكود الخاص بالمسح الضوئي مؤقتاً")),
    );
  }
}