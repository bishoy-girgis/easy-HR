import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../Core/widgets/gap.dart';

class ProfileShimmerWidget extends StatelessWidget {
  const ProfileShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.8),
      highlightColor: Colors.grey.withOpacity(0.6),
      enabled: true,
      child: Container(
        margin:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black),
              width: 65.w,
              height: 26.h,
            ),
            const GapH(h: 2),
            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black),
                        width: 55.w,
                        height: 17.h,
                      ),
                      const GapW(w: 1),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                          height: 17.h,
                        ),
                      ),
                    ],
                  ),
                  const GapH(h: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black),
                        width: 55.w,
                        height: 17.h,
                      ),
                      const GapW(w: 1),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                          height: 17.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black),
                        width: 55.w,
                        height: 17.h,
                      ),
                      const GapW(w: 1),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                          height: 17.h,
                        ),
                      ),
                    ],
                  ),
                  const GapH(h: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black),
                        width: 55.w,
                        height: 17.h,
                      ),
                      const GapW(w: 1),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                          height: 17.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black),
                        width: 55.w,
                        height: 17.h,
                      ),
                      const GapW(w: 1),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                          height: 17.h,
                        ),
                      ),
                    ],
                  ),
                  const GapH(h: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black),
                        width: 55.w,
                        height: 17.h,
                      ),
                      const GapW(w: 1),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 14.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black),
                          height: 17.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
