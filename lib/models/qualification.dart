String pYear = 'year', pDegree = 'degree', pBoard = 'board', pMarks = 'marks';

class Qualifications {
  String year, degree, board, marks;
  Qualifications(
      {required this.board,
      required this.year,
      required this.degree,
      required this.marks});

// L> qualtojson(List<Qualifications> thiss) {
//     Map<String, dynamic> m = {};

//     thiss.forEach((element) {
//       m.addAll({
//         pYear: element.year,
//         pDegree: element.degree,
//         pBoard: element.board,
//         pMarks: element.marks,
//       });
//     });

  //   return m;
  // }

  Map<String, dynamic> toMap() {
    return {
      pYear: year,
      pDegree: degree,
      pBoard: board,
      pMarks: marks,
//
    };
  }

  static Qualifications qulaFromJson(Map<String, dynamic> json) {
    return Qualifications(
      year: json[pYear]!,
      degree: json[pDegree]!,
      board: json[pBoard]!,
      marks: json[pMarks]!,
    );
  }
}
