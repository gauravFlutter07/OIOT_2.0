import '../../../imports.dart';

class DraggableScrollableWidget extends StatelessWidget {
  const DraggableScrollableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Draggable Scrollable Widget'),
      ),
      body: Center(
        child: DraggableScrollableSheet(
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.grey[300],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
