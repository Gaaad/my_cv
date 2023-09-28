import '../api/skill_services.dart';
import '../models/skill.dart';

class SkillRepository {
  SkillServices skillServices;
  SkillRepository({
    required this.skillServices,
  });

  Future<List<Skill>> getSkills() async {
    final skill = await skillServices.getSkills();
    return skill.map((skill) => Skill.fromJson(skill.data())).toList();
  }
}
