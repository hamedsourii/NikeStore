import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_store/data/auth_info.dart';
import 'package:nike_store/data/repo/auth_repository.dart';
import 'package:nike_store/data/repo/cart_repository.dart';
import 'package:nike_store/ui/auth/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('پروفایل'),
        ),
        body: ValueListenableBuilder<AuthInfo?>(
            valueListenable: AuthRepository.authChangeNotifier,
            builder: (context, authInfo, child) {
              final isLogin =
                  authInfo != null && authInfo.accessToken.isNotEmpty;
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 65,
                      height: 65,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(top: 32, bottom: 8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).dividerColor, width: 1)),
                      child: Image.asset('assets/img/nike_logo.png'),
                    ),
                    Text(isLogin ? authInfo.email : 'کاربر میهمان'),
                    const SizedBox(
                      height: 32,
                    ),
                    const Divider(
                      height: 1,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        height: 56,
                        child: const Row(
                          children: [
                            Icon(CupertinoIcons.heart),
                            SizedBox(
                              width: 16,
                            ),
                            Text('لیست علاقه مندی ها'),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        height: 56,
                        child: const Row(
                          children: [
                            Icon(CupertinoIcons.cart),
                            SizedBox(
                              width: 16,
                            ),
                            Text('سوابق سفارش'),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                    ),
                    InkWell(
                      onTap: () {
                        if (isLogin) {
                          showDialog(
                              context: context,
                              useRootNavigator: true,
                              builder: (context) {
                                return Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: AlertDialog(
                                    title: const Text('خروج از حساب کاربری'),
                                    content: const Text(
                                        'آیا میخواهید از حساب خود خارج شوید؟'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('خیر')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            CartRepository.cartItemCountNotifier
                                                .value = 0;
                                            authRepository.signOut();
                                          },
                                          child: const Text('بله')),
                                    ],
                                  ),
                                );
                              });
                        } else {
                          Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                  builder: (context) => const AuthScreen()));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                        height: 56,
                        child: Row(
                          children: [
                            Icon(isLogin
                                ? CupertinoIcons.arrow_right_square
                                : CupertinoIcons.arrow_left_square),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(isLogin
                                ? 'ورود به حساب کاربری'
                                : 'ورود به حساب کاربری'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
