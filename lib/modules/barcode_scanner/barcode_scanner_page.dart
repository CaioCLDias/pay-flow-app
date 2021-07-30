import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_text_style.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/widgets/button_sheet_widget.dart/button_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

import 'barcode_scanner_controller.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifer.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, '/insert_boleto');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifer,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: status.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  'Escaneie o código de barras do boleto',
                  style: TextStyles.buttonBackground,
                ),
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(children: [
                Expanded(
                  child: Container(color: Colors.black.withOpacity(0.6)),
                ),
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.transparent),
                ),
                Expanded(
                  child: Container(color: Colors.black.withOpacity(0.6)),
                ),
              ]),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: "Inserir o código do boleto",
                primaryOnPressed: () {},
                secondaryLabel: "Adicionar da galeria",
                secondaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifer,
            builder: (_, status, __) {
              if (status.hasError) {
                return ButtonSheetWidget(
                  title: 'Não foi possível identificar um código de barras.',
                  subtitle:
                      'Tente escanear novamente ou digite o código do seu boleto.',
                  primaryLabel: 'Escanear Novamente',
                  primaryOnPressed: () {
                    controller.getAvailableCameras();
                  },
                  secondaryLabel: 'Digitar código',
                  secondaryOnPressed: () {},
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
