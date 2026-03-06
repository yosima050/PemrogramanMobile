void main(List<String> args) {
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
    'nama': 'Yosep Bima Aprillian',
    'nim': '244107060027'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
    19: 'Yosep Bima Aprillian',
    20: '244107060027'
  };

  var mhs1 = Map<String, String>();
  mhs1['first'] = 'partridge';
  mhs1['second'] = 'turtledoves';
  mhs1['fifth'] = 'golden rings';
  mhs1['nama'] = 'Yosep Bima Aprillian';
  mhs1['nim'] = '244107060027';

  var mhs2 = Map<int, String>();
  mhs2[2] = 'helium';
  mhs2[10] = 'neon';
  mhs2[18] = 'argon';
  mhs2[19] = 'Yosep Bima Aprillian';
  mhs2[20] = '244107060027';

  print(gifts);
  print(nobleGases);
  print("mhs1: $mhs1");
  print("mhs2: $mhs2");
}