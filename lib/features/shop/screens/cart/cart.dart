import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hypercare/common/widgets/appbar/appbar.dart';
import 'package:hypercare/utils/constraints/colors.dart';
import 'package:hypercare/utils/constraints/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import '../../../../utils/constraints/image_strings.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  double _volume = 1.0;
  double _speed = 1.0;

  @override
  void initState() {
    super.initState();
    _loadMusic();
  }

  Future<void> _loadMusic() async {
      await _player.setAsset(TImages.playMusic);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _player.pause();
      } else {
        _player.play();
      }
      _isPlaying = !_isPlaying;
    });
  }


  void _setVolume(double volume) {
    setState(() {
      _volume = volume;
      _player.setVolume(volume);
    });
  }

  void _setSpeed(double speed) {
    setState(() {
      _speed = speed;
      _player.setSpeed(speed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Musik Relaksasi', style: TextStyle(color: Colors.black)),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(
              TImages.iconMusic,
              width: 250,
            ),
            const SizedBox(height: 20),
            const Text(
              "Suara Relaksasi Jiwa",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Artis: Attallah Nandra Kiano",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 40),
            IconButton(
              iconSize: 60,
              icon: Icon(
                _isPlaying ? Iconsax.pause : Iconsax.play,
                color: TColors.primary,
              ),
              onPressed: _togglePlayPause,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Volume: ${(_volume * 100).toInt()}%',
                  style: const TextStyle(fontSize: 16, color: TColors.black),
                ),
                Expanded(
                  child: Slider(
                    value: _volume,
                    min: 0.0,
                    max: 1.0,
                    activeColor: TColors.black,
                    inactiveColor: Colors.black45,
                    onChanged: _setVolume,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Speed: ${_speed.toStringAsFixed(1)}x',
                  style: const TextStyle(fontSize: 16, color: TColors.black),
                ),
                Expanded(
                  child: Slider(
                    value: _speed,
                    min: 0.5,
                    max: 2.0,
                    activeColor: TColors.black,
                    inactiveColor: Colors.black45,
                    onChanged: _setSpeed,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
