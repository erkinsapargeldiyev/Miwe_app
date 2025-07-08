import 'package:flutter/material.dart';

class StatusOption {
  final String label;
  final Color color;

  const StatusOption({required this.label, required this.color});
}

class StatusDot extends StatelessWidget {
  final StatusOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const StatusDot({
    Key? key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.white : option.color,
              border:
                  isSelected ? Border.all(color: option.color, width: 3) : null,
            ),
            child:
                isSelected
                    ? Center(
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: option.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                    : null,
          ),
          const SizedBox(height: 6),
          Text(
            option.label,
            style: const TextStyle(fontSize: 12, fontFamily: 'Inter'),
          ),
        ],
      ),
    );
  }
}
