import 'package:fpdart/fpdart.dart';

extension EitherFutureX<L, R1> on Future<Either<L, R1>> {
  Future<Either<L, R2>> chain<R2>(Future<Either<L, R2>> Function(R1) f) async {
    return (await this).fold(left, f);
  }
}

extension EitherX<L, R> on Either<L, R> {
  R getRight() => (this as Right).value;

  L getLeft() => (this as Left).value;
}

extension EitherX2<L, R, B> on Future<Either<L, R>> {
  Future<B> fold(B Function(L) l, B Function(R) r) async {
    return (await this).fold(l, r);
  }
}

extension CombinedFutureEither<L, R> on List<Either<L, R>> {
  /// Combines the right side of a list of [Either] objects.
  Future<Either<L, List<R>>> combineRight() async {
    if (isEmpty) {
      return const Right([]);
    }

    final List<R> combined = [];
    for (final r in this) {
      if (r.isLeft()) {
        return Left(r.swap().toOption().toNullable() as L);
      } else {
        combined.add(r.toOption().toNullable() as R);
      }
    }

    return Right(combined);
  }
}

extension CombinedIterableFutureEither<L, R> on Iterable<Future<Either<L, R>>> {
  Future<Either<L, List<R>>> combineRight() async {
    final List<R> combined = [];
    for (final r in this) {
      final result = await r;
      if (result.isLeft()) {
        return Left(result.swap().toOption().toNullable() as L);
      } else {
        combined.add(result.toOption().toNullable() as R);
      }
    }

    return Right(combined);
  }
}
