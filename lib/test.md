SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Obx(
                () => Text((controller.selectedBrand.value == '')
                    ? 'Select Brand Frist'
                    : "Brand: ${controller.selectedBrand.value}"),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.isModelVisible.value) {
                  return TextField(
                    enabled: controller.isTextEnable.value,
                    controller: controller.modelTextController,
                    decoration: const InputDecoration(labelText: "Model: "),
                  );
                } else {
                  return const SizedBox();
                }
              }),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.isModelVisible.value) {
                  return GFButton(
                    onPressed: controller.isButtonEnable.value
                        ? () {
                            controller.confirmModel();
                          }
                        : null,
                    text: "Confirm",
                    color: Colors.deepPurpleAccent,
                  );
                } else {
                  return const SizedBox();
                }
              }),

              const SizedBox(
                height: 20,
              ),

              // upload loader
              Obx(() {
                if (_gridview_controller.isLoader.value) {
                  return const GFLoader();
                } else {
                  return Container();
                }
              }),


            ],
          ),
        ),