import 'package:flutter/material.dart';

class ImagePickers extends StatefulWidget {
  const ImagePickers({required this.images, super.key, required this.check});
  final List<String> images;
  final bool check;

  @override
  State<ImagePickers> createState() => _ImagePickersState();
}

class _ImagePickersState extends State<ImagePickers> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  void saveImages(BuildContext context) {
    if (_form.currentState!.validate()) {
      setState(() {
        _form.currentState!.save();
        Navigator.pop(context);
      });
    }
  }

  void imageDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          title: const Text(
            "Rasim linkini kiriting!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: Form(
            key: _form,
            child: TextFormField(
              initialValue: widget.images[index],
              keyboardType: TextInputType.url,
              cursorColor: Colors.amber,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: OutlineInputBorder(),
                labelText: "Rasm URL",
                floatingLabelStyle: TextStyle(color: Colors.amber),
                labelStyle: TextStyle(color: Colors.grey),
              ),
              onSaved: (newValue) {
                widget.images[index] = newValue!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Iltmos rasm URL-ni kiriting";
                } else if (!value.startsWith("https")) {
                  return "Rasm URL to'g'ri kiriting";
                }
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.pop(context);
              },
              child: const Text(
                "BEKOR QILISH",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                saveImages(context);
              },
              child: const Text(
                "Saqlash",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
                color: widget.check
                    ? widget.images[0].isNotEmpty
                        ? Colors.grey
                        : Colors.red
                    : Colors.grey),
          ),
          color: Colors.white,
          elevation: 0,
          child: InkWell(
            onTap: () {
              imageDialog(context, 0);
            },
            splashColor: Colors.teal.withOpacity(0.7),
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              child: widget.images[0].isEmpty
                  ? Text(
                      "Asosyi rasm likini kiriting",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: widget.check ? Colors.red : Colors.black,
                      ),
                    )
                  : Image.network(
                      widget.images[0],
                      height: 180,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text("Qo'shimcha rasmlar:"),
        Row(
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                      color: widget.check
                          ? widget.images[1].isNotEmpty
                              ? Colors.grey
                              : Colors.red
                          : Colors.grey),
                ),
                color: Colors.white,
                elevation: 0,
                child: InkWell(
                  onTap: () {
                    imageDialog(context, 1);
                  },
                  splashColor: Colors.teal.withOpacity(0.7),
                  highlightColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: widget.images[1].isEmpty
                        ? Text(
                            "Rasm 1",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: widget.check ? Colors.red : Colors.black,
                            ),
                          )
                        : Image.network(
                            widget.images[1],
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                      color: widget.check
                          ? widget.images[2].isNotEmpty
                              ? Colors.grey
                              : Colors.red
                          : Colors.grey),
                ),
                color: Colors.white,
                elevation: 0,
                child: InkWell(
                  onTap: () {
                    imageDialog(context, 2);
                  },
                  splashColor: Colors.teal.withOpacity(0.7),
                  highlightColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: widget.images[2].isEmpty
                        ? Text(
                            "Rasm 2",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: widget.check ? Colors.red : Colors.black,
                            ),
                          )
                        : Image.network(
                            widget.images[2],
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                      color: widget.check
                          ? widget.images[3].isNotEmpty
                              ? Colors.grey
                              : Colors.red
                          : Colors.grey),
                ),
                color: Colors.white,
                elevation: 0,
                child: InkWell(
                  onTap: () {
                    imageDialog(context, 3);
                  },
                  splashColor: Colors.teal.withOpacity(0.7),
                  highlightColor: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: widget.images[3].isEmpty
                        ? Text(
                            "Rasm 3",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: widget.check ? Colors.red : Colors.black,
                            ),
                          )
                        : Image.network(
                            widget.images[3],
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
