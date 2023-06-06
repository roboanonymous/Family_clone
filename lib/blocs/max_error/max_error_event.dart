abstract class MaxErrorEvent {
  int get givenAmount;
  int get maxAmount;
}

class MaxEvent extends MaxErrorEvent {
  final int givenAmount;
  final int maxAmount;

  MaxEvent(this.givenAmount, this.maxAmount);
}

class LessEvent extends MaxErrorEvent {
  final int givenAmount;
  final int maxAmount;

  LessEvent(this.givenAmount, this.maxAmount);
}
