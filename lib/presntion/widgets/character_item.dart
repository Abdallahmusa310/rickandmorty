import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickandmorty/data/models/characters_model.dart';

class CharacterItem extends StatelessWidget {
  final Charactersmodel charcter;
  const CharacterItem({super.key, required this.charcter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 8.h),
      padding: EdgeInsets.all(4.w),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          color: Colors.black54,
          alignment: Alignment.center,
          child: Text(
            charcter.name,
            style: TextStyle(
              height: 1.3.h,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          child: charcter.image.isNotEmpty
              ? Image.network(
                  charcter.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/istockphoto-1332100919-612x612.jpg');
                  },
                )
              : Image.asset('assets/istockphoto-1332100919-612x612.jpg'),
        ),
      ),
    );
  }
}
