import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'facebook_state.dart';

class FacebookCubit extends Cubit<FacebookState> {
  FacebookCubit() : super(FacebookInitial());

  // make object of the cubit
  static FacebookCubit get(context) => BlocProvider.of(context);
}
