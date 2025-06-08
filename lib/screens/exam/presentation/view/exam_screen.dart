import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/screens/exam/presentation/bloc/exam_bloc.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/exam_drawer.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/exam_top_view.dart';
import 'package:sathachlaixe/screens/exam/presentation/view/question_pages.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<StatefulWidget> createState() => ExamScreenState();
}

class ExamScreenState extends State<ExamScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 8, vsync: this);
    tabController.addListener(() {
      //setState(() {});
    });
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExamBloc, ExamState>(
      listener: (context, state) {
        print('ExamBloc listener');
        if (state is NavigateBackToHome) {
          if (context.canPop()) {
            context.pop();
          }
        } else if (state is NavigateToResultScreen) {
          //TODO: HanhNV go to Result Screen
        } else if (state is ExamLoaded) {
          if (state.shouldShowDialog != null &&
              state.shouldShowDialog == true) {
            print('Show confirm dialog');
            // context.read<ExamBloc>().add(ResetShowDialogEvent());
            _showConfirmationDialog(context);
          }
        }
      },
      child: PopScope(
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
                  return 'Đề số ${state.examInfo.examSetId}';
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
          drawer: ExamDrawer(tabController: tabController),
          body: SafeArea(
            child: BlocBuilder<ExamBloc, ExamState>(
              builder: (context, state) {
                if (state is ExamLoaded) {
                  return Column(
                    children: [
                      state.examInfo.duration > 0
                          ? Container(
                            decoration: BoxDecoration(color: Colors.amber),
                            child: ExamTopView(
                              listData: state.examInfo.questionsData,
                            ),
                          )
                          : Container(),
                      Expanded(child: QuestionPages()),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
