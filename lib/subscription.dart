class Subscription{
  String subscription;
  Subscription(this.subscription);

  @override
  String toString() {
    return "$subscription";
  }
}

List<Subscription> subscriptions =[
  Subscription("Basic"),
  Subscription("Premium"),
];