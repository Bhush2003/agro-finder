import 'package:agro_finder_project/presentation/labour/wallet/model/model.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  var jobList = <JobModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchJobs();
  }

  void fetchJobs() {
    jobList.value = List.generate(
      4,
      (index) => JobModel(
        name: "xyz",
        description: "Harvesting",
        status: "Complete",
        date: "05/02/2025",
        duration: "1 day",
        money: "500 rs/-",
      ),
    );
  }
}
