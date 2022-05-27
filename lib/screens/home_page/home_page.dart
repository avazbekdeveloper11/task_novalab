import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constant/constant.dart';
import 'package:task/core/extension/mediaquery_extension.dart';
import 'package:task/cubit/cat_cubit.dart';
import 'package:task/models/fact_model.dart';
import 'package:task/service/cats_service.dart';
import 'package:task/service/hive_service.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  String? fact;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CatCubit(),
      child: homeScaffold(context),
    );
  }

  Scaffold homeScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00E5E4E2),
      body: BlocBuilder<CatCubit, CatState>(
        builder: (context, state) {
          //! index
          String index = context.watch<CatCubit>().index.toString();

          return Column(
            children: [
              // ! Image
              Container(
                color: Colors.blue,
                width: double.infinity,
                height: context.height * 0.5,
                child: FadeInImage.assetNetwork(
                  // ! loading gif
                  placeholder: ConstantData.instance.loading,
                  fit: BoxFit.cover,
                  // ! random img url
                  image: ConstantData.instance.randomImageUrl + index,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder(
                  future: ServiceCat().getDataModel(),
                  builder: (context, AsyncSnapshot<List<FactModel>> snap) {
                    if (!snap.hasData) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    } else if (snap.hasError) {
                      return const Center(child: Text("Error"));
                    } else {
                      fact = snap.data![0].text.toString();
                      String hour = snap.data![0].createdAt
                          .toString()
                          .split(' ')[1]
                          .toString()
                          .split('.')[0]
                          .toString()
                          .split(':')[0]
                          .toString();
                      String min = snap.data![0].createdAt
                          .toString()
                          .split(' ')[1]
                          .toString()
                          .split('.')[0]
                          .toString()
                          .split(':')[1]
                          .toString();
                      return Column(
                        children: [
                          Text(
                            "$hour:$min",
                            style: const TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: context.height * 0.2,
                            child: SingleChildScrollView(
                              child: Text(
                                snap.data![0].text.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),

              const Spacer(),
              // ! change image button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  fixedSize: Size(context.width * 0.6, context.height * 0.06),
                ),
                child: Center(
                  child: Text(
                    "Change Image",
                    style: Theme.of(
                      context,
                    ).textTheme.labelSmall!.copyWith(fontSize: 15),
                  ),
                ),
                onPressed: () async {
                  context.read<CatCubit>().changeIndex(fact);
                },
              ),
              // ! Get fact button
              Padding(
                padding: EdgeInsets.symmetric(vertical: context.height * 0.05),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    fixedSize: Size(context.width * 0.6, context.height * 0.06),
                  ),
                  child: Center(
                    child: Text(
                      "Facts",
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(fontSize: 15),
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, "/facts"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
