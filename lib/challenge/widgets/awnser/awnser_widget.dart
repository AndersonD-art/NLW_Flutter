import 'package:flutter/material.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/shared/models/awnser_model.dart';

class AwnserWidget extends StatefulWidget {
  final AwnserModel anwser;
  final bool isSelected;
  final VoidCallback onTap;
  final bool disabled;

  const AwnserWidget({
    Key? key,
    required this.anwser,
    this.isSelected = false,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  @override
  _AwnserWidgetState createState() => _AwnserWidgetState();
}

class _AwnserWidgetState extends State<AwnserWidget> {
  Color get _selectedColorRight =>
      widget.anwser.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      widget.anwser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      widget.anwser.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      widget.anwser.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight => widget.anwser.isRight
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight =>
      widget.anwser.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: IgnorePointer(
        ignoring: widget.disabled,
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.isSelected ? _selectedColorCardRight : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                    color: widget.isSelected
                        ? _selectedBorderCardRight
                        : AppColors.border),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.anwser.title,
                    style: widget.isSelected
                        ? _selectedTextStyleRight
                        : AppTextStyles.body,
                  ),
                ),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? _selectedColorRight
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                      BorderSide(
                          color: widget.isSelected
                              ? _selectedBorderRight
                              : AppColors.border),
                    ),
                  ),
                  child: widget.isSelected
                      ? Icon(
                          _selectedIconRight,
                          color: AppColors.white,
                          size: 16,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
        /* child: GestureDetector(
        onTap: widget.onTap,
        child: ValueListenableBuilder<bool>(
          valueListenable: confirmQuestion.isConfirm,
          builder: (context, bool value, _) => Column(
            children: [
              if (widget.isConfirm == true || value == true)
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? _selectedColorCardRight
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.fromBorderSide(
                      BorderSide(
                          color: widget.isSelected
                              ? _selectedBorderCardRight
                              : AppColors.border),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.anwser.title,
                          style: widget.isSelected
                              ? _selectedTextStyleRight
                              : AppTextStyles.body,
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: widget.isSelected
                              ? _selectedColorRight
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(500),
                          border: Border.fromBorderSide(
                            BorderSide(
                                color: widget.isSelected
                                    ? _selectedBorderRight
                                    : AppColors.border),
                          ),
                        ),
                        child: widget.isSelected
                            ? Icon(
                                _selectedIconRight,
                                color: AppColors.white,
                                size: 16,
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
              if (widget.isConfirm == false)
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: widget.isSelected ? Colors.yellow[50] : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.fromBorderSide(
                      BorderSide(
                          color: widget.isSelected
                              ? Colors.yellow
                              : AppColors.border),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.anwser.title,
                          style: widget.isSelected
                              ? TextStyle(color: Colors.blue)
                              : AppTextStyles.body,
                        ),
                      ),
                      Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color:
                              widget.isSelected ? Colors.grey : AppColors.white,
                          borderRadius: BorderRadius.circular(500),
                          border: Border.fromBorderSide(
                            BorderSide(
                                color: widget.isSelected
                                    ? Colors.grey
                                    : AppColors.border),
                          ),
                        ),
                        child: widget.isSelected
                            ? Icon(
                                Icons.check,
                                color: AppColors.white,
                                size: 16,
                              )
                            : null,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ), */
      ),
    );
  }
}
