import 'package:experience_app/features/admin/domain/entities/product_admin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_admin_state.freezed.dart';

@freezed
abstract class ProductsAdminState with _$ProductsAdminState {
  const factory ProductsAdminState({
    @Default([]) List<ProductAdmin> products,
    @Default(false) bool loading,
    String? error,
  }) = _ProductsAdminState;
}
