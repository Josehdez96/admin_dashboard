import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/ui/views/user_view/widgets/user_view_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/ui/views/user_view/widgets/avatar_container.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/providers/users_provider.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({
    Key? key,
    required this.uid
  }) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final userFormProvider = Provider.of<UserFormProvider>(context, listen: false);
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid)
      .then((value) {
          userFormProvider.user = value;
          setState(() { this.user = value; });
        });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('User View', style: CustomLabels.h1),
          SizedBox(height: 10),

          if (user == null) 
            WhiteCard(
              child: Container(
                height: 400,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ),

          if (user != null)
            _UserViewBody()
        ],
      )
    );
  }
}

class _UserViewBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: {
          0: FixedColumnWidth(250)
        },
        children: [
          TableRow(
            children: [
              // AVATAR
              AvatarContainer(),
              // Form for update
              UserViewForm()
            ]
          )
        ],
      ),
    );
  }
}

