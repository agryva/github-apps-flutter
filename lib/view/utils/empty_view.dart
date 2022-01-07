

import 'package:flutter/material.dart';
import 'package:github_apps/gen/assets.gen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
            Assets.emptyState
        ),
        const SizedBox(height: 16,),
        Text(
          "The keyword you are looking for \ndoesn't exist",
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 16
          ),
        )
      ],
    );
  }
}
