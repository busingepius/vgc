import 'package:vgc/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routers = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
    ),
  ],
);
