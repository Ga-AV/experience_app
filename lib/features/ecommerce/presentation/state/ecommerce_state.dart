import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'ecommerce_state.freezed.dart';

@freezed
abstract class EcommerceState with _$EcommerceState {

  const factory EcommerceState({

    @Default(false) bool isLoading,

    @Default([]) List<Product> perfectForYou,

    @Default([]) List<Product> summerProducts,

    String? error,

  }) = _EcommerceState;
}