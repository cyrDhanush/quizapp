import 'package:flutter/material.dart';
import 'package:quizapp/global.dart';
import 'package:quizapp/models/category_model.dart';

class TopicTile extends StatelessWidget {
  final CategoryModel categoryModel;
  final String currentid;
  final Function? onTap;
  const TopicTile(
      {super.key,
      required this.categoryModel,
      required this.currentid,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!(categoryModel.id);
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.fastLinearToSlowEaseIn,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          decoration: BoxDecoration(
            color: (categoryModel.id == currentid)
                ? (orange.withOpacity(0.9))
                : (blue2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(
                  ("assets/icons/category_selection/" + categoryModel.iconfile),
                ),
                color: (categoryModel.id == currentid) ? (blue1) : (orange),
                size: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  categoryModel.title,
                  style: category_text.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
