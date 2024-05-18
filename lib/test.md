ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              onTap: () {
                                Get.snackbar("Pressed", '-');
                              },
                              tileColor: Colors.white,
                              title: Text('iPhone 15'),
                              subtitle: Text('Sub title'),
                              leading: FaIcon(FontAwesomeIcons.apple),
                            ),
                            SizedBox(
                              height: 5,
                            ),