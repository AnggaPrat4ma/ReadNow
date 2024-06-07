import 'package:flutter/material.dart';
import 'package:my_app/dto/news.dart';
import 'package:my_app/screens/drawer.dart';
import 'package:my_app/services/data_service.dart';

class LongListScreen extends StatefulWidget {
  const LongListScreen({Key? key}) : super(key: key);

  @override
  _LongListScreenState createState() => _LongListScreenState();
}

class _LongListScreenState extends State<LongListScreen> {
  late Future<List<News>> _news;

  final _simpanTitle = TextEditingController();
  final _simpanBody = TextEditingController();

  @override
  void initState() {
    super.initState();
    _news = DataService.fetchNews();
  }

  @override
  void dispose() {
    _simpanTitle.dispose();
    _simpanBody.dispose();
    super.dispose();
  }

  void showIsian(News post) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(post.title),
        content: SizedBox(
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(post.photo),
                Text(post.idCategory.toString()),
                Text(post.id),
                Text(post.body),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void showInput() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Masukkan Data"),
        content: Column(
          children: [
            TextField(
              controller: _simpanTitle,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade500)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
                hintText: 'Title'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _simpanBody,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey.shade500)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
                hintText: 'Body'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              DataService.sendNews(_simpanTitle.text, _simpanBody.text);
              Navigator.pop(context);
              setState(() {
                _news = DataService.fetchNews();
              });
            },
            child: Text('Send'),
          ),
        ],
      ),
    );
  }

  void _deleteNews(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Konfirmasi"),
        content: Text("Apakah Anda yakin ingin menghapus berita ini?"),
        actions: [
          TextButton(
            onPressed: () {
              DataService.deleteData(id);
              Navigator.pop(context);
              setState(() {
                _news = DataService.fetchNews();
              });
            },
            child: Text('Ya'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Tidak'),
          ),
        ],
      ),
    );
  }

  void _showUpdateDialog(News post) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update Berita"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: TextEditingController(text: post.title),
              onChanged: (value) {
                post.title = value;
              },
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: TextEditingController(text: post.body),
              onChanged: (value) {
                post.body = value;
              },
              decoration: InputDecoration(
                labelText: "Body",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              DataService.updateData(post.id, post.title, post.body);
              Navigator.pop(context);
              setState(() {
                _news = DataService.fetchNews();
              });
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ADD BOOK',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              showInput();
            },
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    drawer: MyDrawer(
      username: 'Angga Pratama',
      backgroundImage: 'assets/images/icon_flutter.png',
      color: Colors.white,
    ),
    body: Center(
      child: FutureBuilder<List<News>>(
        future: _news,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Menampilkan 2 baris
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 1.0,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    showIsian(post);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: const Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(post.photo),
                            ),
                          ),
                        ),
                        Text(
                          post.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          // maxLines: 2,
                          // overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.values[0],
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.white,),
                              onPressed: () {
                                _deleteNews(post.id);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.white,),
                              onPressed: () {
                                _showUpdateDialog(post);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.share, color: Colors.white,),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    ),
  );
}

}