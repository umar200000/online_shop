import 'package:flutter/material.dart';

class ImagesRow extends StatelessWidget {
  final List<String> images;
  const ImagesRow({required this.images, super.key});

  void showImage(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          elevation: 0,
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              index != 0
                  ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showImage(context, index - 1);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 35,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(width: 35),
              SizedBox(
                  //width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.6,
                  child: Image.network(
                    images[index],
                    fit: BoxFit.contain,
                  )),
              index != images.length - 1
                  ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        showImage(context, index + 1);
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 35,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(width: 35),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < images.length; i++)
          GestureDetector(
            onTap: () {
              showImage(context, i);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.all(10),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
              ),
              child: Image.network(images[i]),
            ),
          )
      ],
    );
  }
}
