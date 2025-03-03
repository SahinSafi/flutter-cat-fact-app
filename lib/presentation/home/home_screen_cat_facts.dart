import 'package:flutter/material.dart';
import 'package:flutter_cat_fact_app/core/entity/cat_facts_entity.dart';
import 'package:flutter_cat_fact_app/core/ui/CircularImage.dart';
import 'package:flutter_cat_fact_app/core/ui/extention/navigation.dart';
import 'package:format_date/format_date.dart';

import '../../app_routes_path.dart';
import '../../core/entity/navargs/fact_details_args.dart';

class HomeScreenCatFacts extends StatelessWidget {
  final List<CatFactsEntity> list;

  HomeScreenCatFacts({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return itemCatFact(list[index], context);
        });
  }

  final imageList = [
    "https://cdn.pixabay.com/photo/2022/07/27/06/43/cat-7347316_1280.png",
    "https://pics.craiyon.com/2023-10-18/3b500a23d340416d876afeaa04052164.webp",
    "https://cdn.openart.ai/uploads/image_1684475464028_1024.jpg"
  ];

  itemCatFact(CatFactsEntity entity, BuildContext context) {
    final image = (imageList..shuffle()).last;
    return GestureDetector(
      onTap: (){
        final args = FactDetailsArgs(image: image, fact: entity.text, date: entity.createdAt);
        context.navigateTo(routeName: AppRoutesPath.factDetailsScreen, arguments: args);
      },
      child: Card.filled(
        margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CustomImage(
                url: image,
                width: 100,
                height: 100,
                borderRadius: 50,
              ),
              const Padding(padding: EdgeInsets.only(left: 16)),
              Flexible(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.text,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                    maxLines: 3,
                      style: Theme.of(context).textTheme.bodyMedium
                  ),
                  const SizedBox(height: 12),
                  Text("Date: ${FormatDate.formatDate(dateTime: DateTime.parse(entity.createdAt), format: "dd-mm-yy")}",
                    style: Theme.of(context).textTheme.bodySmall
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
