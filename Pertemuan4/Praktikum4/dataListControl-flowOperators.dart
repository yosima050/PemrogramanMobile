void main() {
  String login = 'Manager';
  var nav2Manager = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print('nav2 (login: Manager) : $nav2Manager');

  login = 'Staff';
  var nav2Staff = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print('nav2 (login: Staff)   : $nav2Staff');
}