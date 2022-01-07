

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_apps/service/search/search_bloc.dart';
import 'package:github_apps/view/utils/helpers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helpers.getWidthPageSize(context),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xff26282F),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.search,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 11,),
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                context.read<SearchBloc>().search(value);
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: 'User, Repositories, Issues',
                hintStyle: GoogleFonts.inter(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14
                ),
              ),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
              )
            ),
          ),

        ],
      ),
    );
  }
}
