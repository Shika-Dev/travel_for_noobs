import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget{
  @override
  createState()=> _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = false;

  void _toogleFavorite(){
    setState(() {
      if(_isFavorited){
        _isFavorited=false;
      }else{
        _isFavorited=true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton( icon: (_isFavorited? Icon(Icons.favorite, size: 25,): Icon(Icons.favorite_border, size: 25)),
                  color: Colors.white,
                  onPressed: _toogleFavorite,
                );
  }
}