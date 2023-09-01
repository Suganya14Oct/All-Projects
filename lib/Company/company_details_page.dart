import 'package:flutter/material.dart';
import 'package:udemy/Company/company.dart';
import 'package:udemy/Company/company_details_into_animation.dart';
import 'dart:ui' as ui;
import 'package:udemy/Company/course_card.dart';

class CompanyDetailsPage extends StatelessWidget {

  CompanyDetailsPage({@required this.company, @required AnimationController? controller})
  : animation = new CompanyDetailsIntroAnimation(controller);

  final Company? company;
  final CompanyDetailsIntroAnimation? animation;

  Widget _createAnimation(BuildContext context, Widget? child) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(opacity: animation!.bgdropOpacity!.value,
          child: Image.asset(company!.backdropPhoto.toString(),fit: BoxFit.cover,),),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
              sigmaX: animation!.bgdropBlur!.value,
              sigmaY: animation!.bgdropBlur!.value
          ),
          child: new Container(
            color: Colors.black.withOpacity(0.3),
            child: _createContent(),
          ),
        )
      ],
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new AnimatedBuilder(animation: animation!.controller!,
          builder: _createAnimation)
    );
  }

  Widget _createContent() {
    return new SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createLogoAvatar(),

          Padding(
            padding: const EdgeInsets.only(left:8.0,right: 8.0,top: 8.0),
            child: Container(color: Colors.brown,height: 0.3,width: 900,),
          ),
          _createAboutCompany(),
          _createCourseScroller()
        ],
      ),
    );
  }

  Widget _createLogoAvatar() {
    return new Transform(transform: new Matrix4.diagonal3Values(
        animation!.avatarSize!.value, animation!.avatarSize!.value, 1.0),
    alignment: Alignment.center,
      child: Column(
        children: [
          new Container(
            width: double.infinity,
            height: 120.0,
            margin: EdgeInsets.only(top: 32.0, left: 17.0),
            padding: EdgeInsets.all(2.0),
            child: Row(
              children: [
                new Image.asset(company!.logo!,width: 100,height: 110,fit: BoxFit.cover,),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text("SUGANYA M",
                        style: TextStyle(fontSize: 30.0 * animation!.avatarSize!.value + 2.0,
                            fontWeight: FontWeight.bold,
                        color: Colors.white
                        ),),
                      SizedBox(height: 2.0,),
                      Row(
                        children: [
                          new Text("Phone No. :",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          new Text("+91 7845503839",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)
                        ],
                      ),
                      SizedBox(height: 2.0,),
                      Row(
                        children: [
                          new Text("Address: ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          new Text("Dindigul,Tamil Nadu,India",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    new Text("Email Address: ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    new Text("suganya000141@gmail.com",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)
                  ],
                ),
                SizedBox(height: 4.0),
                Row(
                  children: [
                    new Text("LinkedIn Id: ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    new Text("Suganya Murugan",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _createAboutCompany(){
    return new Padding(
      padding: EdgeInsets.only(top: 4.0,left: 14.0,right: 14.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Text("Profile Summary",style: TextStyle(
              color: Colors.white.withOpacity(animation!.nameOpacity!.value),
            fontSize: 28.0 * animation!.avatarSize!.value + 2.0,
            fontWeight: FontWeight.bold
          ),
          ),
          new Container(
            color: Colors.white.withOpacity(0.79),
            margin: const EdgeInsets.symmetric(vertical: 14.0),
            width: animation!.dividerWidth!.value,
            height: 1.0,
          ),
          new Text(company!.about!,
            style: TextStyle(
              color: Colors.white.withOpacity(animation!.aboutOpacity!.value),
              height: 1.4
            ),
          ),
        ],
      ),
    );
  }
  Widget _createCourseScroller() {
    return new Padding(padding: EdgeInsets.only(top: 14.0),
      child: Transform(transform: new Matrix4.translationValues(animation!.courseScrollerXTranslation!.value, 0.0, 0.0),
      child: new SizedBox.fromSize(
        size: new Size.fromHeight(250.0),
        child:ListView.builder(
          scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 7.0),
            itemCount: company!.courses!.length,
            itemBuilder: (BuildContext context, int index){
              var course = company!.courses![index];
              return new CourseCard(course);
            })
      ),
      ),
    );
  }
}




