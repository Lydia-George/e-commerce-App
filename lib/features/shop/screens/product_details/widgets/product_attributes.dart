import 'package:ecommerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
        ()=> Column(
        /// -- Selected Attribute Pricing & Description
        children: [
          /// -- Selected Attribute Pricing & Description
          // Display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
            TCircularContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  /// Title , Price and Stock Status
                  Row(
                    children: [
                      TSectionHeading(
                          title: "Variation",
                          showActionButton: false,
                          textColor: dark
                              ? TColors.secondaryColor
                              : TColors.primaryColor),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                title: "Price : ",
                                smallSize: true,
                              ),
                              // const SizedBox(
                              //   width: TSizes.spaceBtwItems,
                              // ),

                              /// Actual Price
                              if(controller.selectedVariation.value.salePrice > 0)
                              Text(
                                "${controller.selectedVariation.value.salePrice} L.E",
                                style:
                                    Theme.of(context).textTheme.titleSmall!.apply(
                                          decoration: TextDecoration.lineThrough,
                                        ),
                              ),

                              const SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),

                              /// Sale Price
                               TProductPriceText(price:  controller.getVariationPrice()),
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const TProductTitleText(
                                title: "Stock : ",
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .apply(color: TColors.primaryColor),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  /// Variation Description
                   TProductTitleText(
                    title:
                        controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          /// Attributes
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map((attribute) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TSectionHeading(
                            title: attribute.name ?? '',
                            showActionButton: false,
                            textColor: dark
                                ? TColors.secondaryColor
                                : TColors.primaryColor,
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 2,
                          ),
                          Obx(
                            () => Wrap(
                              spacing: 8,
                              children: attribute.values!.map((attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = controller
                                    .getAttributeAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!,
                                    )
                                    .contains(attributeValue);

                                return TChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ))
                  .toList()),
        ],
      ),
    );
  }
}
