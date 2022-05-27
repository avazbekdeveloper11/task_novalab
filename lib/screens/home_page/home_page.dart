import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/constant/constant.dart';
import 'package:task/core/extension/mediaquery_extension.dart';
import 'package:task/cubit/cat_cubit.dart';
import 'package:task/service/cats_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                onPressed: () {
                  context.read<CatCubit>().changeIndex();
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
