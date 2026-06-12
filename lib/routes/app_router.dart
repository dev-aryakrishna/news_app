import 'package:flutter_bloc/flutter_bloc.dart';

import '../ dependency_injection/injection.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/auth/presentation/bloc/auth_bloc.dart';

import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/signup_page.dart';
import '../features/auth/presentation/pages/splash_page.dart';

import '../features/news/presentation/pages/news_details_page.dart';
import '../features/news/presentation/pages/news_list_page.dart';

import '../features/news/presentation/bloc/news_bloc.dart';

import 'package:go_router/go_router.dart';
import 'route_names.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: RouteNames.splash,
  routes: [
    GoRoute(
      path: RouteNames.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouteNames.signup,
      builder: (context, state) =>  const SignupPage(),
    ),
    GoRoute(
      path: RouteNames.news,
      builder: (context, state) => BlocProvider(create: (_) => sl<NewsBloc>(),child:  const NewsListPage(),),
    ),
    GoRoute(
      path: RouteNames.newsdetails,
      builder: (context, state) =>  NewsDetailsPage(article:state.extra as NewsEntity),
    ),
  ],
);