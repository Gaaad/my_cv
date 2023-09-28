import '../api/project_services.dart';
import '../models/project.dart';

class ProjectRepository {
  ProjectRepository({
    required this.projectServices,
  });
  ProjectsServices projectServices;

  Future<List<Project>> getProjects() async {
    final project = await projectServices.getProjects();
    return project.map((project) => Project.fromJson(project.data())).toList();
  }
}
