import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/exam_drawer.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/exam_top_view.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/single_question_page.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<StatefulWidget> createState() => ExamScreenState();
}

class ExamScreenState extends State<ExamScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentIndex = 0;
  final _logger = Logger('ExamScreen');

  void _showConfirmationDialog(BuildContext context) {
    final bloc = context.read<ExamBloc>(); // Lấy BLoC từ context
    showDialog(
      context: context,
      barrierDismissible: false, // Người dùng phải chọn một option
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Xác nhận dừng bài thi'),
          content: const Text(
            'Điều kiện ngẫu nhiên không cho phép quay lại. Bạn có muốn tới màn hình Denied không?',
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Đóng dialog
                bloc.add(UserCancelBackAction()); // Gửi event hủy
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Đóng dialog
                bloc.add(UserConfirmedEndExam()); // Gửi event xác nhận
              },
            ),
          ],
        );
      },
    );
  }

  void _setupTabController(int lenght) {
    _tabController ??= TabController(length: lenght, vsync: this);
    _tabController!.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabController!.index != _currentIndex) {
      final previousIndex = _currentIndex;
      _currentIndex = _tabController!.index;

      _logger.info('submit answer for question index $previousIndex');
      var state = context.read<ExamBloc>().state;
      if (state is ExamLoaded) {
        if (state.duration > 0) {
          context.read<ExamBloc>().add(QuestionSubmitted(index: previousIndex));
        }
      }
      setState(() {
        // Cập nhật lại index hiện tại sau khi đã submit
        _currentIndex = _tabController!.index;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExamBloc, ExamState>(
      listener: (context, state) {
        if (state is NavigateBackToHome) {
          if (context.canPop()) {
            context.pop();
          }
        } else if (state is NavigateToResultScreen) {
          //TODO: HanhNV go to Result Screen
        } else if (state is ExamLoaded) {
          if (state.listQuestion.isNotEmpty) {
            _setupTabController(state.listQuestion.length);
            _logger.info('init _tabController');
          }

          if (state.shouldShowDialog != null &&
              state.shouldShowDialog == true) {
            print('Show confirm dialog');
            // context.read<ExamBloc>().add(ResetShowDialogEvent());
            _showConfirmationDialog(context);
          }
        }
      },
      builder: (context, state) {
        _logger.info(' builder called');

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, _) {
            // Callback này được gọi khi người dùng cố gắng pop (ví dụ: nhấn nút back)
            // didPop sẽ là false nếu canPop là false và việc pop đã bị ngăn chặn.
            if (!didPop) {
              context.read<ExamBloc>().add(BackNavigationAttempted());
            }
          },
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(56),
              child: BlocSelector<ExamBloc, ExamState, String>(
                selector: (state) {
                  if (state is ExamLoaded) {
                    return 'Đề số ${state.examSetId}';
                  }
                  return '';
                },
                builder: (context, state) {
                  return AppBar(
                    title: Text(state),
                    actions: [
                      Icon(Icons.face_retouching_off_rounded),
                      Icon(Icons.checklist_rounded),
                    ],
                  );
                },
              ),
            ),
            drawer:
                _tabController != null
                    ? ExamDrawer(tabController: _tabController!)
                    : null,
            body: SafeArea(
              child: Column(
                children: [
                  if (state is ExamLoaded) ...[
                    if (state.duration > 0)
                      Container(
                        decoration: BoxDecoration(color: Colors.amber),
                        child: ExamTopView(listData: List.empty()),
                      ),
                    Container(
                      decoration: BoxDecoration(color: Colors.amber),
                      height: 50,
                      child: TabBar(
                        padding: EdgeInsets.zero,
                        controller: _tabController,
                        isScrollable: true,
                        tabs: List.generate(state.listQuestion.length, (index) {
                          return Text(
                            'Câu ${index + 1}',
                            style: TextStyle(color: Colors.red),
                          );
                          // return Tab(height: 50, text: 'Cau ${index + 1}',);
                        }),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: List<SingleQuestionPage>.generate(
                          state.listQuestion.length,
                          (index) => SingleQuestionPage(
                            question: state.listQuestion[index],
                          ),
                        ),
                      ),
                    ),
                  ] else ...[
                    CircularProgressIndicator(),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
