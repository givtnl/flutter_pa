import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/analytics/mixpanel_manager.dart';
import 'package:flutter_app/generated/l10n.dart';
import 'package:flutter_app/widgets/accent_rounded_button.dart';
import 'package:flutter_app/widgets/main_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class GivingModal extends StatelessWidget {
  late final bool isBiggerThan360;
  final VoidCallback closeModal;
  final String url;

  GivingModal(this.closeModal, this.url);

  @override
  Widget build(BuildContext context) {
    isBiggerThan360 = MediaQuery.of(context).size.width > 360;
    bool viaGivt = url.contains("givtapp.net");

    return Stack(
      children: [
        GestureDetector(
          onTap: closeModal,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              color: Theme.of(context).backgroundColor.withOpacity(.75),
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: isBiggerThan360 ? 310 : MediaQuery.of(context).size.width - 60,
            height: isBiggerThan360 ? 310 : MediaQuery.of(context).size.width - 60,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 8,
                    blurRadius: 15,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: SvgPicture.asset(
                          'assets/svg/krus.svg',
                        ),
                      ),
                      onTap: closeModal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 15.0),
                        child: Text(
                          viaGivt ? S.of(context).giveWithGivt_title : S.of(context).giveWithoutGivt_title,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          viaGivt ? S.of(context).giveWithGivt_subTitle : S.of(context).giveWithoutGivt_subTitle,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child:
                            AccentRoundedButton(viaGivt ? S.of(context).giveWithGivt_buttonText : S.of(context).giveWithoutGivt_buttonText, () async {
                          MixpanelManager.mixpanel.track("CLICKED", properties: {"BUTTON_NAME": "GIVING_MODAL_BUTTON"});
                          if (await canLaunch(url))
                            await launch(url);
                          else
                            throw "Could not launch $url";
                        }, Theme.of(context).buttonColor, true),
                      ),
                    ]),
                  ),
                ]),
              ),
            ),
          ),
        )
      ],
    );
  }
}
