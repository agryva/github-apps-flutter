

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaginateCustom extends StatelessWidget {
  final int page;
  final int lastPage;
  final Function(int) onTap;
  const PaginateCustom({Key? key, required this.page, required this.lastPage, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (page > 1) onTap(page - 1);
            },
            child: const Icon(
              CupertinoIcons.chevron_back,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8,),
          Expanded(
            child: Row(
              children: [
                for (int i = 0; i <= 10; i++) ...[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        onTap(i + page);
                      },
                      child: Text(
                        "${i + page}",
                        style: GoogleFonts.inter(
                            color: (i + page) == page ? Colors.black : Colors.white,
                            fontSize: 18,
                            fontWeight: (i + page) == page ? FontWeight.w800 : FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
          const SizedBox(width: 8,),
          InkWell(
            onTap: () {
              if (page < lastPage) onTap(page + 1);
            },
            child: const Icon(
              CupertinoIcons.chevron_right,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
