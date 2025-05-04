import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmate/core/constants/app_sizes.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utilities/app_date_time.dart';
import '../../data/models/task_title_list_isar_model.dart';
import '../bloc/task_bloc.dart';

class TaskSinglePage extends StatefulWidget {
  const TaskSinglePage({super.key, required this.task, this.taskTitleListIsarModel});
  final TaskIsarModel task;
  final TaskTitleListIsarModel? taskTitleListIsarModel;

  @override
  State<TaskSinglePage> createState() => _TaskSinglePageState();
}

class _TaskSinglePageState extends State<TaskSinglePage> {
  final nameCon = TextEditingController();
  final detailsCon = TextEditingController();
  final taskDateTimeNotifier = ValueNotifier<DateTime?>(null);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameCon.text = widget.task.name!;
    detailsCon.text = widget.task.details??'';
    taskDateTimeNotifier.value = widget.task.taskDateTime == null ? null : DateTime.parse(widget.task.taskDateTime!);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: widget.taskTitleListIsarModel == null ? null : [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: const Text("Delete"),
              ),
            ],
            // on selected we show the dialog box
            onSelected: (value) {
              if(value == 1){
                context.read<TaskBloc>().add(DeleteTaskActionEvent(taskTitleListIsarModel: widget.taskTitleListIsarModel!, task: widget.task));
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingBody),
        children: [
          TextFormField(
            controller: nameCon,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 4,
            minLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppSizes.fontSizeOverLarge,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter title'
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
          ),

          TextFormField(
            controller: detailsCon,
            textCapitalization: TextCapitalization.sentences,
            maxLines: 4,
            minLines: 1,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Add details',
              prefixIcon: Icon(Icons.list)
            ),
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
          ),

          Row(
            children: [
              SizedBox(width: 12,),
              Icon(Icons.watch_later_outlined,color: Colors.black.withValues(alpha: 0.65)),
              ValueListenableBuilder(
                  valueListenable: taskDateTimeNotifier,
                  builder: (_,value,child){
                    if(value != null){
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                        margin: EdgeInsets.only(left: AppSizes.paddingInside),
                        decoration: BoxDecoration(
                          color: AppColors.randomPastelColor().withValues(
                            alpha: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              formatDateTime(
                                dateTime: value,
                                format: 'E, dd MMM hh:mm a',
                              ) ??
                                  '',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 5,),
                            InkWell(
                              onTap: () {
                                taskDateTimeNotifier.value = null;
                              },
                              child: Icon(Icons.close, size: 16,),
                            ),
                          ],
                        ),
                      );
                    }else{
                      return TextButton(onPressed: ()async{
                        final dd = await pickCupertinoDateTime(
                          context,
                          withTime: true,
                        );
                        if (dd != null) {
                          taskDateTimeNotifier.value = dd;
                        }
                      }, child: Text("Add task date time",style: TextStyle(fontSize: AppSizes.fontSizeLarge),));
                    }
                  }
              )
            ],
          ),
        ],
      ),
      bottomSheet: widget.taskTitleListIsarModel != null ? Container(
        color: AppColors.seed.withValues(alpha: 0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: (){
              widget.task.name = nameCon.text;
              widget.task.details = detailsCon.text;
              widget.task.taskDateTime = taskDateTimeNotifier.value == null ? null : taskDateTimeNotifier.value!.toIso8601String();
              context.read<TaskBloc>().add(UpdateTaskEvent(taskTitleListIsarModel: widget.taskTitleListIsarModel!, task: widget.task));
              Navigator.pop(context);
            }, child: Text("Update")),
            TextButton(onPressed: (){
              context.read<TaskBloc>().add(CompletedTaskActionEvent(taskTitleListIsarModel: widget.taskTitleListIsarModel!, task: widget.task));
              Navigator.pop(context);
            }, child: Text("Mark completed")),
          ],
        ),
      ):null,
    );
  }
}
