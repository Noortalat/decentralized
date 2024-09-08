import 'package:flutter/material.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({Key? key}) : super(key: key);

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  int _currentImageIndex =0;
  final PageController _pageController=PageController();
  final List<String> _images = [
    'https://m.media-amazon.com/images/I/71x311i9AWL._AC_UF894,1000_QL80_.jpg',
    'https://media.istockphoto.com/id/1372896722/photo/potted-banana-plant-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=bioeNAo7zEqALK6jvyGlxeP_Y7h6j0QjuWbwY4E_eP8=',
    'https://cdn.shopify.com/s/files/1/0260/3037/4957/products/small-plant-spider-plant-white-pot_300x300.jpg',
  ];




  void _perviosImage(){
    if(_currentImageIndex>0){
      setState(){
        _currentImageIndex--;
         }
        _pageController.animateToPage(
          _currentImageIndex,
          duration:Duration(milliseconds:300),
          curve:Curves.easeInOut,
        );
        }
  }

    void _nextImage(){
    if(_currentImageIndex<_images.length-1){
      setState(){
        _currentImageIndex++;
         }
        _pageController.animateToPage(
          _currentImageIndex,
          duration:Duration(milliseconds:300),
          curve:Curves.easeInOut,
        );
        }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Black Panse'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context); // Corrected to use `context`
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      _images[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),

                // arrow_back
                Positioned(
                  left:10,
                  top:0,
                  bottom:0,
                  child:IconButton(icon:Icon(Icons.arrow_back_ios,color:Colors.black),
                  onPressed:_perviosImage,),
                ),

                //arrow_forward
                Positioned(
                  right:10,
                  top:0,
                  bottom:0,
                  child:IconButton(icon:Icon(Icons.arrow_forward_ios,color:Colors.black),
                  onPressed:_nextImage,),
                ),
                
                Positioned(
                  bottom: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _images.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentImageIndex == index ? 12 : 8,
                        height: _currentImageIndex == index ? 12 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentImageIndex == index
                              ? Colors.black
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Plant',
                    style: TextStyle(color: Colors.white38),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Outdoor',
                    style: TextStyle(color: Colors.white38),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            textDirection:TextDirection.rtl,
            textAlign:TextAlign.right,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0),
              ),
              labelText: "Basic knowledge",
              labelStyle: TextStyle(color: Colors.black),
              suffixIcon: Icon(Icons.add),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'Stages',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                PlantStage(
                  title: '1. Watering Seeds (48h)',
                  description:
                      'Water: Distilled water or rainwater can be used, avoid using hard water.',
                ),
                PlantStage(
                  title: '2. Start Growing (3-5 days)',
                  description:
                      'Water regularly, keeping the soil moist but not soggy.',
                ),
                PlantStage(
                  title: '3. Growing (2-3 weeks)',
                ),
                PlantStage(
                  title: '4. Maturing (4-6 weeks)',
                ),
                PlantStage(
                  title: '5. Blooming (4-6 weeks)',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlantStage extends StatelessWidget {
  final String title;
  final String? description;

  const PlantStage({
    Key? key,
    required this.title,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      children: [
        if (description != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(description!),
          ),
      ],
    );
  }
}

