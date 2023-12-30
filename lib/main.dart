import 'package:flutter/material.dart';

void main() {
  runApp(const LaserSlidesApp());
}

class LaserSlidesApp extends StatelessWidget {
  const LaserSlidesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LaserSlidesHomePage(),
    );
  }
}

class LaserSlidesHomePage extends StatefulWidget {
  const LaserSlidesHomePage({super.key});

  @override
  _LaserSlidesHomePageState createState() {
    return _LaserSlidesHomePageState();
  }
}

class _LaserSlidesHomePageState extends State<LaserSlidesHomePage> {
  @override
  void initState() {
    super.initState();
    _navigateToSecondScreen(); // Initiating navigation after 5 seconds
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaserSlides'),
      ),
      body: const Center(
        child: Text(
          'LaserSlides',
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }

  void _navigateToSecondScreen() {}
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 buttons in each row
          crossAxisSpacing: 10.0, // Horizontal spacing between buttons
          mainAxisSpacing: 10.0, // Vertical spacing between buttons
        ),
        itemCount: 15, // Total number of buttons
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            onPressed: ()
              {
                _showEditDialog(context, index);

              // Handle button tap
            },
            child: Text('Button ${index + 1}'),
          );
        },
      ),
    );
  }

  void _showEditDialog(BuildContext context, int index) {}
}

class EditableButtonsScreen extends StatefulWidget {
  const EditableButtonsScreen({super.key});

  @override
  _EditableButtonsScreenState createState() {
    return _EditableButtonsScreenState();
  }
}

class _EditableButtonsScreenState extends State<EditableButtonsScreen> {
  List<String> buttonNames = List.generate(15, (index) => 'Button ${index + 1}');
  final TextEditingController _textEditingController = TextEditingController();

  void _showEditDialog(int index) {
    _textEditingController.text = buttonNames[index];

    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Button Name'),
          content: TextField(
            controller: _textEditingController,
            onChanged: (value) {
              buttonNames[index] = value;
            },
            decoration: const InputDecoration(
              hintText: 'Enter new name',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editable Buttons'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return ElevatedButton(
            onPressed: () {
              _showEditDialog(index);
            },
            child: Text(buttonNames[index]),
          );
        },
      ),
    );
  }
}
void _showEditDialog(BuildContext context, int index) {
  var buttonNames;
  TextEditingController textController = TextEditingController(text: buttonNames[index]);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Button Name'),
        content: TextField(
          controller: textController,
          onChanged: (value) {
            setState(() {
              buttonNames[index] = value;
            });
          },
          decoration: const InputDecoration(
            hintText: 'Enter new name',
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      );
    },
  );
}

void setState(Null Function() param0) {
}
