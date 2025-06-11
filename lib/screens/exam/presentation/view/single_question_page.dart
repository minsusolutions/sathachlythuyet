import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/screens/exam/domain/model/answer_status.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question.dart';
import 'package:sathachlaixe/screens/exam/domain/model/user_answer.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';

class SingleQuestionPage extends StatelessWidget {
  SingleQuestionPage({super.key, required this.question});
  final Question question;
  final _logger = Logger('_buildOptionTile');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<ExamBloc, ExamState>(
        buildWhen: (previous, current) {
          var pre = previous;
          var curr = current;
          if (pre is ExamLoaded && curr is ExamLoaded) {
            final prevAnswer =
                pre.userAnswers[question.buildQuestioniKeyBaseOn(
                  pre.licienseId,
                  pre.examCode,
                  pre.examSetId,
                )];
            final currentAnswer =
                curr.userAnswers[question.buildQuestioniKeyBaseOn(
                  curr.licienseId,
                  curr.examCode,
                  curr.examSetId,
                )];
            final prevHintShown = pre.showHints.contains(question.qNumber);
            final currentHintShown = curr.showHints.contains(question.qNumber);
            return prevAnswer != currentAnswer ||
                prevHintShown != currentHintShown;
          }
          return false;
        },
        builder: (context, state) {
          if (state is ExamLoaded) {
            final userAnswer =
                state.userAnswers[question.buildQuestioniKeyBaseOn(
                  state.licienseId,
                  state.examCode,
                  state.examSetId,
                )] ??
                UserAnswer(questionId: question.qNumber);
            // ignore: unrelated_type_equality_checks
            final bool isSubmitted =
                userAnswer.status != AnswerStatus.unanswered;
            final bool isIncorrect =
                userAnswer.status == AnswerStatus.incorrect;
            final isHintShown = state.showHints.contains(question.qNumber);

            _logger.info('userAnswer $userAnswer');
            _logger.info('isSubmitted $isSubmitted');
            _logger.info('isIncorrect $isIncorrect');
            _logger.info('isHintShown $isHintShown');

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (question.qImage.isNotEmpty)
                  Image.asset(
                    'assets/questions/${question.qImage}',
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                const SizedBox(height: 12),
                _buildOptionTile(
                  context,
                  1,
                  question.answer1,
                  userAnswer,
                  isSubmitted,
                  state.licienseId,
                  state.examCode,
                  state.examSetId,
                ),
                _buildOptionTile(
                  context,
                  2,
                  question.answer2,
                  userAnswer,
                  isSubmitted,
                  state.licienseId,
                  state.examCode,
                  state.examSetId,
                ),
                if (question.answer3.isNotEmpty)
                  _buildOptionTile(
                    context,
                    4,
                    question.answer3,
                    userAnswer,
                    isSubmitted,
                    state.licienseId,
                    state.examCode,
                    state.examSetId,
                  ),
                if (question.answer4.isNotEmpty)
                  _buildOptionTile(
                    context,
                    8,
                    question.answer3,
                    userAnswer,
                    isSubmitted,
                    state.licienseId,
                    state.examCode,
                    state.examSetId,
                  ),
                if (isSubmitted)
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Column(
                      children: [
                        if (isIncorrect &&
                            !isHintShown &&
                            question.hint.isNotEmpty)
                          Center(
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.lightbulb_outline),
                              label: const Text('Xem gợi ý'),
                              onPressed: () {
                                context.read<ExamBloc>().add(
                                  HintRequested(qNumber: question.qNumber),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.orange.shade700,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        if (isHintShown)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12.0),
                            margin: const EdgeInsets.only(top: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.blue.shade200),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gợi ý:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  question.hint,
                                  style: TextStyle(color: Colors.blue.shade900),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget _buildOptionTile(
    BuildContext context,
    int optionValue,
    String optionText,
    UserAnswer userAnswer,
    bool isSubmitted,
    int licienseId,
    int examCode,
    int examSetId,
  ) {
    Color? getTileColor() {
      if (!isSubmitted) return null;
      if (optionValue == question.correctAnswer) return Colors.green.shade100;
      if (optionValue == userAnswer.selectedOptionValue) {
        return Colors.red.shade100;
      }
      return null;
    }

    Color getRadioColor() {
      if (!isSubmitted) return Colors.blue;
      if (optionValue == question.correctAnswer) return Colors.green;
      if (optionValue == userAnswer.selectedOptionValue) return Colors.red;
      return Colors.grey;
    }

    return Card(
      elevation: 0,
      color: getTileColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color:
              userAnswer.selectedOptionValue == optionValue && !isSubmitted
                  ? Colors.blue
                  : Colors.grey.shade300,
          width:
              userAnswer.selectedOptionValue == optionValue && !isSubmitted
                  ? 1.5
                  : 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: RadioListTile<int>(
        title: Text(optionText),
        value: optionValue,
        groupValue: userAnswer.selectedOptionValue,
        // Sửa lỗi chính: vô hiệu hóa RadioButton bằng cách đặt onChanged = null
        // khi câu hỏi đã được submit.
        onChanged:
            isSubmitted
                ? null
                : (value) {
                  if (value != null) {
                    context.read<ExamBloc>().add(
                      AnswerSelected(
                        questionKey: question.buildQuestioniKeyBaseOn(
                          licienseId,
                          examCode,
                          examSetId,
                        ),
                        answer: value,
                      ),
                    );
                  }
                },
        activeColor: getRadioColor(),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
