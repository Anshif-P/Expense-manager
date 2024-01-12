class IncomAndExpenseModel {
  int? id;
  double amount;
  String category;
  String description;
  String date;

  IncomAndExpenseModel({
    this.id,
    required this.amount,
    required this.category,
    required this.description,
    required this.date,
  });

  factory IncomAndExpenseModel.fromMap(Map<String, dynamic> map) {
    return IncomAndExpenseModel(
      id: map['id'],
      amount: map['amount'],
      category: map['category'],
      description: map['description'],
      date: map['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'category': category,
      'description': description,
      'date': date,
    };
  }
}
