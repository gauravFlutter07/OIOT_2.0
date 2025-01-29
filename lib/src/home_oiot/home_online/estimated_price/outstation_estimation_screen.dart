import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:oiot/src/home_oiot/home_online/service_type/pick_up/model/outstation_taxi_list_modal.dart';

import '../../../../imports.dart';
import 'estimate_price_controller.dart';


class OutstationEstimationScreen extends StatelessWidget {
  final VehicleList data;
   OutstationEstimationScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EstimatePriceController>(context);
    provider.selectedVehicle = data;
    
    return Scaffold(
      appBar: AppBar(
        title:  const Text(
          'Book your OutStation ride',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding:  const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Utils.showImg(data.file??'', 40, 40),
                 const SizedBox(width: 8),
                 Text(
                  provider.selectedVehicle?.vehicle??'-',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
             const SizedBox(height: 16),
             ListTile(
              leading: const Icon(Icons.circle, color: Colors.green, size: 14),
              title: Text(provider.selectedVehicle?.pickupLocation??'-'),
            ),
            ListTile(
              leading: const Icon(Icons.circle, color: Colors.red, size: 14),
              title: Text(provider.selectedVehicle?.dropLocation??'-'),
            ),
              const Divider(),
             const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 const Text(
                  'Start date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  '26 Jan 2025 12:13 PM',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
             const SizedBox(height: 8),
            Text(
              provider.selectedVehicle?.description??'-',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
             const Divider(height: 32),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(
                  '\u20B9 ${provider.selectedVehicle?.fareDetails?.totalFare??'-'}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                             ),
                 IconButton(onPressed: (){

                   Navigator.push(
                     context,
                     MaterialPageRoute(
                       builder: (context) => SedanEstimatePrice(data:provider.selectedVehicle!)
                     ),
                   );
                 }, icon: const Icon(Icons.info, color: Colors.blue, size: 32))
               ],
             ),
             const SizedBox(height: 16),
             const Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
             const SizedBox(height: 8),
            HtmlWidget(provider.selectedVehicle?.fareDetails?.description??'-',),
            height90,
         Container(
              padding:  const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Utils.showImg(data.file??'', 40, 40),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                '\u20B9 ${provider.selectedVehicle?.fareDetails?.totalFare??'-'}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                provider.selectedVehicle?.vehicle??'-',
                                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                           Text(
                             provider.selectedVehicle?.fareDetails?.paymentMode??'-',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Payment Method',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),

                    ],
                  ),
                   const Divider(),
                  height10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                       const Text(
                        'Apply Coupon',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      height02,
                      Text(
                        'Coupon',
                        style: TextStyle(fontSize: 14, color: blueMain),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            height02,
            CustomButton(onTap: (){
              provider.bookRIde(context);
            }, title: 'Confirm Booking', border: true)
          ],
        ),
      ),
    );
  }

}
