import 'package:flutter/material.dart';
import 'package:miwe/features/garden/presentation/widgets/image_indicator.dart';

class ImagePage extends StatefulWidget {
  final List<String> images;
  const ImagePage({super.key, required this.images});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int _selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('${_selectedImage + 1} / ${widget.images.length}'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _selectedImage = index;
              });
            },
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Image.asset(widget.images[index]);
            },
          ),
          Positioned(
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.images.length, (index) {
                return ImageIndicator(isActive: _selectedImage == index);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
