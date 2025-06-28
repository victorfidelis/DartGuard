class Either<L, R> {
  final L? left;
  final R? right;

  Either.left(this.left) : right = null;
  Either.right(this.right) : left = null;
}

extension EitherExtensions<L, R> on Either<L, R> {
  bool get isLeft => left != null;
  bool get isRight => right != null;

  T fold<T>(T Function(L) onLeft, T Function(R) onRigth) {
    if (isLeft) {
      return onLeft(left as L);
    } else {
      return onRigth(right as R);
    }
  }
}

class Unit {
  const Unit();
}

const unit = Unit();
