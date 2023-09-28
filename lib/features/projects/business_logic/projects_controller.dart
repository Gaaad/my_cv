// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import '../data/models/project.dart';
import '../data/repository/project_repo.dart';

class ProjectController extends GetxController {
  ProjectController({required this.projectRepository});
  ProjectRepository projectRepository;
  List<Project>? projects;

  List<Project> getProjects() {
    projectRepository.getProjects().then((projects) {
      this.projects = projects;
      update();
    });
    return projects ?? List.empty();
  }
}
