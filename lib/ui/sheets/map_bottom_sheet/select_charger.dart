import 'package:flexicharge/theme.dart';
import 'package:flexicharge/ui/sheets/map_bottom_sheet/snappingcheet_viewmodel.dart';
import 'package:flexicharge/ui/widgets/charging_station.dart';
import 'package:flexicharge/ui/widgets/invoice_button.dart';
import 'package:flexicharge/ui/widgets/klarna_button.dart';
import 'package:flexicharge/ui/widgets/plugs.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

/// This class is a stateless widget that is responsible for displaying the
/// charging station, plugs, payment options and the charging button
class BeginCharging extends ViewModelWidget<CustomSnappingSheetViewModel> {
  const BeginCharging({Key? key}) : super(key: key);

  @override
  Widget build(context, model) {
    return Column(
      children: [
        ChargingStation(
          onTap: () => model.isFirstView = true,
          address: model.selectedChargerPoint.name,
          currentLocation: 'Barnarpsgatan 68',
        ),
        SizedBox(height: 20),
        Plugs(
          chargers: model.selectedChargerPoint.chargers,
          onTap: (charger) => model.getChargerById(charger.id),
          selectedChargerId: model.selectedCharger.id,
        ),
        SizedBox(height: 20),
        Text(
          "Payment",
          style: TextStyle(
            fontFamily: 'Lato-Regular',
            color: FlexiChargeTheme.white,
            fontSize: 17,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            letterSpacing: -0.408,
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KlarnaButton(
                onTap: () {
                  model.isSwishActive = true;
                  print("Klarna Payment Selected");
                },
                isSelected: model.isSwishActive,
              ),
              InvoiceButton(
                onTap: () {
                  model.isSwishActive = false;
                  print("Invoice Payment Selected");
                },
                isSelected: !model.isSwishActive,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
