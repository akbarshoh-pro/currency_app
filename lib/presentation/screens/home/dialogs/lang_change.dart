
import 'package:currency_app/utils/lang_status.dart';
import 'package:flutter/material.dart';

class LangChange extends StatefulWidget {
  final LangStatus status;
  final void Function(LangStatus) click;
  const LangChange({super.key, required this.status, required this.click});

  @override
  State<LangChange> createState() => _LangChangeState();
}

class _LangChangeState extends State<LangChange> {
  late LangStatus lang;
  @override
  void initState() {
    lang = widget.status;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))
      ),
      child: Column(
        children: [
          const SizedBox(height: 4),
          Container(
            width: 56,
            height: 5,
            decoration: BoxDecoration(
                color: const Color(0xFFA9A8A8),
                borderRadius: BorderRadius.circular(3)
            ),
          ),
          const SizedBox(height: 36),
          GestureDetector(
            onTap: () {
              setState(() {
                lang = LangStatus.uz;
                widget.click(lang);
              });
            },
            child: Row(
              children: [
                const SizedBox(width: 20),
                Icon(LangStatus.uz == lang ? Icons.check_box_outlined : Icons.check_box_outline_blank, color: LangStatus.uz == lang ? Colors.deepPurple : Colors.black,),
                const SizedBox(width: 8),
                Text(
                  'O\'zbekcha',
                  style: TextStyle(
                      fontSize: 20,
                    color: LangStatus.uz == lang ? Colors.deepPurple : Colors.black
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            color: const Color(0xFFA9A8A8),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                lang = LangStatus.uzC;
                widget.click(lang);
              });
            },
            child: Row(
              children: [
                const SizedBox(width: 20),
                Icon(LangStatus.uzC == lang ? Icons.check_box_outlined : Icons.check_box_outline_blank, color: LangStatus.uzC == lang ? Colors.deepPurple : Colors.black,),
                const SizedBox(width: 8),
                Text(
                  'Ўзбекча',
                  style: TextStyle(
                      fontSize: 20,
                    color: LangStatus.uzC == lang ? Colors.deepPurple : Colors.black
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            color: const Color(0xFFA9A8A8),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                lang = LangStatus.ru;
                widget.click(lang);
              });
            },
            child: Row(
              children: [
                const SizedBox(width: 20),
                Icon(LangStatus.ru == lang ? Icons.check_box_outlined : Icons.check_box_outline_blank, color: LangStatus.ru == lang ? Colors.deepPurple : Colors.black),
                const SizedBox(width: 8),
                Text(
                  'Русский',
                  style: TextStyle(
                      fontSize: 20,
                    color: LangStatus.ru == lang ? Colors.deepPurple : Colors.black
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            color: const Color(0xFFA9A8A8),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                lang = LangStatus.eng;
                widget.click(lang);
              });
            },
            child: Row(
              children: [
                const SizedBox(width: 20),
                Icon(LangStatus.eng == lang ? Icons.check_box_outlined : Icons.check_box_outline_blank, color: LangStatus.eng == lang ? Colors.deepPurple : Colors.black),
                const SizedBox(width: 8),
                Text(
                  'English',
                  style: TextStyle(
                      fontSize: 20,
                      color: LangStatus.eng == lang ? Colors.deepPurple : Colors.black
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
