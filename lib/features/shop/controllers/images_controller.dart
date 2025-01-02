import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypercare/features/shop/models/product_model.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();


  ///variables
  RxString selectedProductImage = ''.obs;

  ///- get all images from product and variations
  List<String> getAllProductImages(ProductModel product) {
    //use set to add unique images only
    Set<String> images = {};

    //load thumbnail image
    images.add(product.thumbnail);

    //Assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;

    //get all images from product model if not null
    if(product.images != null) {
      images.addAll(product.images!);
    }

    //get all images from product variations if not null
    if(product.productVariations != null || product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();

  }

  ///show image popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
        () => Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace * 2, horizontal: TSizes.defaultSpace),
                child: CachedNetworkImage(imageUrl: image),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(onPressed: () => Get.back(), child: const Text('Close')),
                ),
              )
            ],
          ),
        ),
    );
  }

  void showVideoPopup(String videoUrl) {
    Get.to(
      fullscreenDialog: true,
          () => Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Selamat Menonton", style: Theme.of(Get.context!).textTheme.titleMedium),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: TSizes.defaultSpace * 2,
                horizontal: TSizes.defaultSpace,
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    bottomActions: const [
                      CurrentPosition(),
                      ProgressBar(isExpanded: true),
                    ],
                    controller: YoutubePlayerController(
                      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? '',
                      flags:  const YoutubePlayerFlags(
                        autoPlay: true,
                        mute: false,
                      ),
                    ),
                    showVideoProgressIndicator: true,
                  ),
                  builder: (context, player) => player,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text('Close'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}