import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors_style.dart';

class CustomTab extends StatelessWidget {
   @required final String title;
   @required final bool isSelected;
   @required final Function onTap;
  CustomTab({ this.isSelected ,  this.onTap ,  this.title}) ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,

      child:AnimatedContainer(
        duration: const Duration(microseconds: 500),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35.0 , vertical: 12.0),
          decoration: BoxDecoration(
              border:Border(
                  bottom: BorderSide(
                    width: 3.0,
                    color: isSelected ? BrandColors.colorPrimary : Colors.transparent,
                  )
              )
          ),
          child: Text(title ,style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),),
        ),
      )
    );
  }
}
