import 'package:flutter/material.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/worker/data/models/workers_for_category_model.dart';
import 'package:weisro/feature/worker/presentation/view/pages/worker_details_page_view_body.dart';

class WorkerDetailsPageView extends StatelessWidget {
  const WorkerDetailsPageView(
      {Key? key,
      required this.image,
      required this.name,
      required this.location,
      required this.price,
      required this.id,
      required this.type,
      required this.age,
      required this.rate,
      this.tags, this.images, this.days})
      : super(key: key);
  final String image, name, location, price, id, type, age, rate;
  final List<Tag>? tags;
  final List<String>? images;
  final List<Day>? days;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WorkerDetailsPageViewBody(
      id: id,
      location: location,
      name: name,
      price: price,
      type: type,
      image: image,
      age: age,
      rate: rate,
      tags: tags,
      images: images,
      
      days: days,
    ));
  }
}
