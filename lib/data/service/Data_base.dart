import 'package:mini_project_expense_manager/model/incom_expense_model.dart';
import 'package:mini_project_expense_manager/view/screen_home.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'income_expense_tracker.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE incomes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL,
        category TEXT,
        description TEXT,
        date TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE expenses(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL,
        category TEXT,
        description TEXT,
        date TEXT
      )
    ''');
  }

  Future<int> insertIncome(
      double amount, String category, String description, String date) async {
    final db = await database;
    return await db.insert('incomes', {
      'amount': amount,
      'category': category,
      'description': description,
      'date': date,
    });
  }

  Future<int> insertExpense(
      double amount, String category, String description, String date) async {
    final db = await database;
    return await db.insert('expenses', {
      'amount': amount,
      'category': category,
      'description': description,
      'date': date,
    });
  }

  Future<void> printDatabase() async {
    final Database db = await database;

    final List<Map<String, dynamic>> expenses = await db.query('expenses');
    final List<Map<String, dynamic>> incomes = await db.query('incomes');

    print('Expenses:');
    expenses.forEach((expense) {
      print(
          'ID: ${expense['id']}, Amount: ${expense['amount']}, Category: ${expense['category']}, Description: ${expense['description']}, Date: ${expense['date']}');
    });

    print('Incomes:');
    incomes.forEach((income) {
      print(
          'ID: ${income['id']}, Amount: ${income['amount']}, Category: ${income['category']}, Description: ${income['description']}, Date: ${income['date']}');
    });
  }

  Future<double> getTodayExpense() async {
    final Database db = await database;

    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final List<Map<String, Object?>> result = await db.rawQuery(
      'SELECT SUM(amount) AS total_expense FROM expenses WHERE date = ?',
      [formattedDate],
    );
    final double totalExpense =
        (result.first['total_expense'] ?? 0.0) as double;
    todayExpense.value = totalExpense;
    todayExpense.notifyListeners();
    return totalExpense;
  }

  Future<double> getCurrentMonthExpense() async {
    final Database db = await database;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM').format(now);

    final List<Map<String, Object?>> result = await db.rawQuery(
      'SELECT SUM(amount) AS total_expense FROM expenses WHERE strftime(\'%Y-%m\', date) = ?',
      [formattedDate],
    );

    final double totalExpense = (result.first['total_expense'] ?? 0) as double;
    monthlyExpense.value = totalExpense;
    monthlyExpense.notifyListeners();
    return totalExpense;
  }

  Future<List<IncomAndExpenseModel>> getIncomeExpenseHistory() async {
    final Database db = await database;

    final List<Map<String, dynamic>> expenseMaps = await db.query('expenses');
    final List<Map<String, dynamic>> incomeMaps = await db.query('incomes');

    List<IncomAndExpenseModel> history = [];

    history.addAll(expenseMaps
        .map((expenseMap) => IncomAndExpenseModel.fromMap(expenseMap)));
    history.addAll(
        incomeMaps.map((incomeMap) => IncomAndExpenseModel.fromMap(incomeMap)));

    return history;
  }

  // new ;//

  Future<List<Map<String, dynamic>>> getTotalExpenseByCategory() async {
    final Database db = await database;

    final List<Map<String, Object?>> categories = await db.rawQuery(
      'SELECT DISTINCT category FROM expenses',
    );

    List<Map<String, dynamic>> totalExpenses = [];

    for (final categoryMap in categories) {
      final String category = categoryMap['category'] as String;

      final List<Map<String, Object?>> result = await db.rawQuery(
        'SELECT SUM(amount) AS total_expense FROM expenses WHERE category = ?',
        [category],
      );

      final double totalExpense =
          (result.first['total_expense'] ?? 0) as double;

      totalExpenses.add({'category': category, 'totalExpense': totalExpense});
    }

    return totalExpenses;
  }

  Future<List<Map<String, dynamic>>> getTotalIncomeByCategory() async {
    final Database db = await database;

    final List<Map<String, Object?>> categories = await db.rawQuery(
      'SELECT DISTINCT category FROM incomes',
    );

    List<Map<String, dynamic>> totalIncomes = [];

    for (final categoryMap in categories) {
      final String category = categoryMap['category'] as String;

      final List<Map<String, Object?>> result = await db.rawQuery(
        'SELECT SUM(amount) AS total_income FROM incomes WHERE category = ?',
        [category],
      );

      final double totalIncome = (result.first['total_income'] ?? 0) as double;

      totalIncomes.add({'category': category, 'totalIncome': totalIncome});
    }

    return totalIncomes;
  }
}
