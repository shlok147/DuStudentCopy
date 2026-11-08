import 'package:flutter/material.dart';


class buildpage extends StatelessWidget {

  final String title;
  final Icon icon;
  final String subtitle;

  const buildpage({super.key, required this.title, required this.icon,required this.subtitle});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF000000),
          ),
          padding: EdgeInsets.all(4),

          child: Column(

              children: [
                Row(
                  children: [
                    Icon(icon.icon,color: Colors.red.shade300,size: 14,),
                    Expanded(child: Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w700),)),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(subtitle,style: TextStyle(fontWeight: FontWeight.w200,color: Colors.black,),maxLines: 2,
                        overflow: TextOverflow.ellipsis,),
                    )
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }

}