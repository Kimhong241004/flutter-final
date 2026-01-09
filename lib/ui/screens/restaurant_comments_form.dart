import 'package:flutter/material.dart';

class RestaurantCommentsForm extends StatefulWidget {
  const RestaurantCommentsForm({
    super.key,
    required this.onAddComment,
  });

  final Function(int stars, String feedback) onAddComment;

  @override
  State<RestaurantCommentsForm> createState() => _RestaurantCommentsFormState();
}

class _RestaurantCommentsFormState extends State<RestaurantCommentsForm> {
  int selectedStars = 1;
  final feedbackController = TextEditingController();
  bool showFeedbackError = false;

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 245, 235, 245),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How was your dinner?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            DropdownButton<int>(
              value: selectedStars,
              isExpanded: true,
              items: List.generate(
                6,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(index.toString()),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedStars = value ?? 0;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: feedbackController,
              maxLength: 50,
              maxLines: null,
              onChanged: (_) {
                setState(() {
                  if (feedbackController.text.isNotEmpty) {
                    showFeedbackError = false;
                  }
                });
              },
              decoration: InputDecoration(
                labelText: 'Any feedback?',
                labelStyle: TextStyle(
                  color: showFeedbackError ? Colors.red : Colors.grey,
                ),
                hintText: 'Enter your feedback',
                hintStyle: const TextStyle(color: Colors.red),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: showFeedbackError ? Colors.red : Colors.grey,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: showFeedbackError ? Colors.red : Colors.grey,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: showFeedbackError ? Colors.red : Colors.blue,
                  ),
                ),
              ),
            ),
            if (showFeedbackError)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Enter your feedback',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (feedbackController.text.isEmpty) {
                    setState(() {
                      showFeedbackError = true;
                    });
                  } else {
                    widget.onAddComment(
                      selectedStars,
                      feedbackController.text,
                    );
                  }
                },
                child: const Text('Comment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}