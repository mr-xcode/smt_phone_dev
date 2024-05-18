AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'SMT - PhoneSH',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConsts.priColor,
        actions: [
          GFButton(
            onPressed: () {
              Get.toNamed('/training');
            },
            color: GFColors.TRANSPARENT,
            icon: Icon(
              Icons.laptop,
              color: ColorConsts.blackColor,
            ),
            text: "Trainings",
            textColor: ColorConsts.blackColor,
          ),
        ],
      ),