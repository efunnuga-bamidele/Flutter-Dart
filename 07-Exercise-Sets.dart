void main() {
// Given this set of students who are on the football team:
  var footballTeam = {'Andrew', 'Zach', 'Calvin'};
// And this set of students who are in the school play:
  var playCast = {'David', 'Calvin', 'Claire'};
// How can you use the intersection method to find students that
// are in BOTH the footballTeam set AND the playCase set?
  print(footballTeam.intersection(playCast));
  print(footballTeam.union(playCast));
}
