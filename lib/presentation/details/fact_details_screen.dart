import 'package:flutter/material.dart';
import 'package:flutter_cat_fact_app/core/entity/navargs/fact_details_args.dart';
import 'package:flutter_cat_fact_app/core/ui/CircularImage.dart';
import 'package:flutter_cat_fact_app/core/ui/extention/navigation.dart';

class FactDetailsScreen extends StatelessWidget {

  FactDetailsScreen({super.key});

  late final FactDetailsArgs args;

  @override
  Widget build(BuildContext context) {

    args = context.arguments as FactDetailsArgs;

    return Scaffold(
      appBar: AppBar(title: const Text("Fact Details"),),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CustomImage(
            url: args.image,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            borderRadius: 8,
          ),

          const SizedBox(height: 16),

          Text(args.fact)
        ],
      ),
    );
  }

}
