import 'package:flutter/material.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: 170,
          height: 100,
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      if (index >= 3) {
                        return Stack(
                          children: [
                            Image.asset(
                              "assets/images/monarch.jpg",
                              fit: BoxFit.cover,
                            ),
                            Container(
                              color: Colors.black.withOpacity(0.8),
                              child: Center(
                                  child: Text(
                                "+4",
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                            )
                          ],
                          fit: StackFit.expand,
                        );
                      } else {
                        return SizedBox(
                          width: 85,
                          child: Image.asset(
                            "assets/images/monarch.jpg",
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    }),
                flex: 5,
              ),
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 5, right: 10, left: 5, bottom: 5),
                  child: Column(children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "M.Mohamadi",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.event, color: Colors.white, size: 18),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "1402/10/10",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ]),
                ),
                flex: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
