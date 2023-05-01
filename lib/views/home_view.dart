import 'package:exam/providers/provider_example.dart';
import 'package:exam/views/start_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeView extends StatelessWidget {
  static const String routeName = '/Home';
  HomeView({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ProviderExample>(context,listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pushReplacementNamed(StartView.routeName);
                  }, icon: const Icon(Icons.keyboard_double_arrow_left)),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: Autocomplete<String>(
                        optionsBuilder: (value){
                          if(value.text.isEmpty){
                            return [];
                          }
                          return provider.currData.where((element)=> element.toLowerCase().contains(value.text.toLowerCase()));
                        },

                      ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
              Consumer<ProviderExample>(
                  builder: (ctx,pro,child){
                    if(pro.isLoading){
                      return const CircularProgressIndicator();
                    }else{
                      return Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                            itemCount: pro.currData.length,
                            itemBuilder: (ctx,index){
                              return Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Text(pro.currData[index],textAlign: TextAlign.center,)
                              );
                            }
                        ),
                      );
                    }
                  }
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      validator: (input){
                        if(input == null || input.isEmpty){
                          return 'Connot be Empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                    if(_controller.text.isNotEmpty){
                      provider.add(_controller.text);
                      _controller.text = '';
                    }
                  }, icon: const Icon(Icons.send))
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
