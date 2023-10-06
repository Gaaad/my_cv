import 'package:get/get.dart';

import '../data/models/skill.dart';
import '../data/repository/skill_repo.dart';

class SkillsController extends GetxController {
  SkillsController({required this.skillRepository}) {
    getSkills();
  }
  SkillRepository skillRepository;
  RxList<Skill> skills = List<Skill>.empty().obs;
  RxBool isLoading = true.obs;

  void getSkills() async {
    await skillRepository.getSkills().then((data) {
      isLoading.value = false;
      skills.value = data;
    });
  }
}
