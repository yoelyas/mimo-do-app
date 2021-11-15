class Team {
  String _name = "";
  int _points = 0;

  getName() => _name;
  getPoints() => _points;
  setName(String name) {
    _name = name;
  }

  setPoints(int points) {
    _points = points;
  }

  addPoint() {
    _points++;
  }

  removePoint() {
    if (_points > 0) {
      _points--;
    }
  }
}

class TeamCollection extends Iterable<Team> {
  final List<Team> _teams = [];

  @override
  Iterator<Team> get iterator => TeamCollectionIterator(_teams);

  getTeams() => _teams;
  setTeams(String name, int points) {
    Team team = Team();
    team.setName(name);
    _teams.add(team);
  }

  addTeam() {}
  getTeamByName() {}
  getTeamById() {}
}

class TeamCollectionIterator implements Iterator<Team> {
  TeamCollectionIterator(this._teams);

  final List<Team> _teams;
  int _currentIndex = -1;

  @override
  Team get current => _teams[_currentIndex];

  @override
  bool moveNext() {
    if (_teams.isEmpty || _currentIndex == (_teams.length - 1)) {
      _currentIndex = -1;
      return false;
    }
    _currentIndex++;
    return true;
  }
}
