import 'package:exam/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/provider_example.dart';

class StartView extends StatelessWidget {
  static const String routeName = '/START';
  StartView({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderExample>(context,listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            Form(
              key: formKey,
                child: TextFormField(
                  controller: _controller,
                  validator: (input){
                    if(input == null || input.isEmpty){
                      return 'Connot be Empty';
                    }
                    if(!RegExp(r'^[a-zA-Z0-9_]*$').hasMatch(input)){
                      return 'Invalid input';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('ID')
                  ),
                )
            ),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          provider.currId = _controller.text;
                          Navigator.of(context).pushReplacementNamed(HomeView.routeName);
                        }
                      },
                      child: const Text('Join'),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
