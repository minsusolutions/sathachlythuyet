import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sathachlaixe/commons/model/exam_info/exam_info.dart';
import 'package:sathachlaixe/screens/exam/domain/model/question_data.dart';
import 'package:sathachlaixe/screens/exam_result/presentation/bloc/exam_result_bloc.dart';

class ExamResultView extends StatefulWidget {
  final int licenseId;
  final int examCode;
  final int? examSetId;

  const ExamResultView({
    super.key,
    required this.licenseId,
    required this.examCode,
    this.examSetId,
  });

  @override
  State<ExamResultView> createState() => _ExamResultViewState();
}

class _ExamResultViewState extends State<ExamResultView> {
  //BannerAd? _bannerAd; // Khai báo BannerAd

  @override
  void initState() {
    super.initState();
    _loadBannerAd(); // Tải quảng cáo khi màn hình được khởi tạo
  }

  @override
  void dispose() {
    // _bannerAd?.dispose(); // Giải phóng quảng cáo khi màn hình bị hủy
    super.dispose();
  }

  void _loadBannerAd() {
    // _bannerAd = BannerAd(
    //   adUnitId: BannerAd.testAdUnitId, // Sử dụng ID quảng cáo thử nghiệm
    //   // Trong ứng dụng thực tế, thay thế bằng ID của bạn:
    //   // adUnitId: Platform.isAndroid
    //   //     ? 'ca-app-pub-xxxxxxxxxxxxxxxx/yyyyyyyyyy' // ID Android của bạn
    //   //     : 'ca-app-pub-xxxxxxxxxxxxxxxx/yyyyyyyyyy', // ID iOS của bạn
    //   request: const AdRequest(),
    //   size: AdSize.banner,
    //   listener: BannerAdListener(
    //     onAdLoaded: (ad) {
    //       setState(() {
    //         _bannerAd = ad as BannerAd;
    //       });
    //     },
    //     onAdFailedToLoad: (ad, err) {
    //       ad.dispose();
    //       print('Lỗi tải quảng cáo: $err');
    //     },
    //   ),
    // )..load();
  }

  // Phương thức để lấy màu sắc dựa trên trạng thái câu hỏi
  Color _getQuestionStatusColor(QuestionStatus status) {
    switch (status) {
      case QuestionStatus.correct:
        return Colors.green.shade400;
      case QuestionStatus.incorrect:
        return Colors.red.shade400;
      case QuestionStatus.unanswer:
        return Colors.grey.shade400;
      case QuestionStatus.current:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  // Phương thức để lấy biểu tượng dựa trên trạng thái câu hỏi
  IconData _getQuestionStatusIcon(QuestionStatus status) {
    switch (status) {
      case QuestionStatus.correct:
        return Icons.check_circle;
      case QuestionStatus.incorrect:
        return Icons.cancel;
      case QuestionStatus.unanswer:
        return Icons.help_outline;
      case QuestionStatus.current:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  // Phương thức hiển thị kết quả tổng quát bài thi
  Widget _buildOverallExamStatus(ExamStatus status) {
    String message;
    Color color;
    IconData icon;

    switch (status) {
      case ExamStatus.passed:
        message = 'KẾT QUẢ: ĐỖ';
        color = Colors.green.shade700;
        icon = Icons.check_circle_outline;
        break;
      case ExamStatus.failed:
        message = 'KẾT QUẢ: TRƯỢT (Không đủ điểm)';
        color = Colors.orange.shade700;
        icon = Icons.error_outline;
        break;
      case ExamStatus.deadFailed:
        message = 'KẾT QUẢ: TRƯỢT (Sai câu hỏi quan trọng)';
        color = Colors.red.shade700;
        icon = Icons.dangerous;
        break;
      case ExamStatus.initial:
        // TODO: Handle this case.
        throw UnimplementedError();
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 10),
          Text(
            message,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Xác định số cột dựa trên chiều rộng màn hình
    final screenWidth = MediaQuery.of(context).size.width;
    // Mobile: 3 items một hàng ngang, Tablet/Larger: 5 items một hàng ngang
    final crossAxisCount = screenWidth > 600 ? 5 : 3;

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ExamResultBloc, ExamResultState>(
          builder: (context, state) {
            if (state is ExamResultLoaded) {
              // Hiển thị title theo examType
              String titleText;
              switch (state.examInfo.examType) {
                case ExamType.exam:
                  titleText = 'Kết Quả Thi';
                  break;
                case ExamType.revise:
                  titleText = 'Kết Quả Ôn Tập';
                  break;
                case ExamType.wrong:
                  titleText = 'Kết Quả Câu Sai';
                  break;
                case ExamType.death:
                  titleText = 'Kết Quả Câu Điểm Liệt';
                  break;
              }
              return Text(titleText);
            }
            return const Text('Kết Quả Bài Thi'); // Tiêu đề mặc định
          },
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ExamResultBloc, ExamResultState>(
        builder: (context, state) {
          if (state is ExamResultLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExamResultError) {
            return Center(
              child: Text(
                'Lỗi: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state is ExamResultLoaded) {
            final examInfo = state.examInfo;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildOverallExamStatus(examInfo.status),
                  Text(
                    'Tiêu đề: ${examInfo.examTitle}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Hạng: ${examInfo.licienseId} | Mã đề: ${examInfo.examCode} | Bộ đề: ${examInfo.examSetId ?? 'N/A'}',
                  ),
                  Text(
                    'Thời gian: ${examInfo.duration ~/ 60} phút | Tối thiểu đúng: ${examInfo.minCorrQuestion} câu',
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            crossAxisCount, // Số cột tùy thuộc vào chiều rộng màn hình
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: examInfo.questionsData.length,
                      itemBuilder: (context, index) {
                        final question = examInfo.questionsData[index];
                        return Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: _getQuestionStatusColor(
                                question.questionStatus,
                              ),
                              width: 2,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: _getQuestionStatusColor(
                                question.questionStatus,
                              ).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${question.questionId}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: _getQuestionStatusColor(
                                      question.questionStatus,
                                    ).withOpacity(0.8),
                                  ),
                                ),
                                Icon(
                                  _getQuestionStatusIcon(
                                    question.questionStatus,
                                  ),
                                  color: _getQuestionStatusColor(
                                    question.questionStatus,
                                  ),
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text('Không có dữ liệu bài thi để hiển thị.'),
          );
        },
      ),
      bottomNavigationBar: null,
      // _bannerAd != null
      //     ? SizedBox(
      //       width: _bannerAd!.size.width.toDouble(),
      //       height: _bannerAd!.size.height.toDouble(),
      //       child: AdWidget(ad: _bannerAd!),
      //     )
      //     : null, // Không hiển thị gì nếu quảng cáo chưa tải
    );
  }
}
