import 'package:flutter/material.dart';
import 'package:table_side/const/design.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.label,
    required this.onTap,
    required this.height,
    required this.width,
  });

  final String label;
  final VoidCallback onTap;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
            border: Border.all(
              color: purpleColor.withOpacity(0.30),
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // restaurant image
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    color: purpleColor.withOpacity(0.35),
                    child: const Icon(Icons.flatware_outlined,
                        size: 60, color: Colors.white),
                  ),
                ),
              ),

              // restaurant text
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
