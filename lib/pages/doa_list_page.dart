import 'package:flutter/material.dart';
import 'package:apiflutter/models/doa_model.dart';
import 'package:apiflutter/services/doa_service.dart';
import 'doa_detail_page.dart';

class DoaListPage extends StatefulWidget {
  const DoaListPage({super.key});

  @override
  State<DoaListPage> createState() => _DoaListPageState();
}

class _DoaListPageState extends State<DoaListPage> {
  late Future<List<Doa>> futureDoa;

  @override
  void initState() {
    super.initState();
    futureDoa = DoaService.fetchDoa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Doa Harian"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Doa>>(
        future: futureDoa,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Terjadi kesalahan: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Tidak ada data doa"));
          }

          final doaList = snapshot.data!;
          return ListView.builder(
            itemCount: doaList.length,
            itemBuilder: (context, index) {
              final doa = doaList[index];
              return ListTile(
                title: Text(doa.doa),
                subtitle: Text(doa.artinya,
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DoaDetailPage(doa: doa),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
