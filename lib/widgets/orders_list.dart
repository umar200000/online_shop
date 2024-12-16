import 'package:flutter/material.dart';
import 'package:homework_8/models/order_model.dart';
import 'package:intl/intl.dart';

class OrdersList extends StatefulWidget {
  final OrderModel order;
  const OrdersList({required this.order, super.key});

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  bool openOrders = false;

  @override
  Widget build(BuildContext context) {
    print(widget.order.dateTime);
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Buyurtma narxi: \$${widget.order.allPrice}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: openOrders ? Colors.teal : Colors.black,
              ),
            ),
            subtitle: Text(
              DateFormat("dd/MM/yyyy hh:mm").format(widget.order.dateTime),
              style: TextStyle(
                color: openOrders ? Colors.teal : Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  openOrders = !openOrders;
                });
              },
              icon: Icon(
                openOrders
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down_outlined,
                color: openOrders ? Colors.teal : Colors.black,
              ),
            ),
          ),
          if (openOrders)
            SizedBox(
              height: widget.order.orderList.length == 1 ? 75 : 150,
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 10),
                itemExtent: 80,
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ListTile(
                      leading: Container(
                        height: 50,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              widget.order.orderList[i].color.withOpacity(0.5),
                              widget.order.orderList[i].color.withOpacity(0.7),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0, 1],
                          ),
                        ),
                        child: Image.network(
                            widget.order.orderList[i].imageUrlList[0]),
                      ),
                      title: Text(widget.order.orderList[i].title),
                      subtitle: Text(
                          "\$${((widget.order.orderList[i].price - (widget.order.orderList[i].discount != null ? widget.order.orderList[i].price * widget.order.orderList[i].discount! / 100 : 0)) * widget.order.orderList[i].quantity).toStringAsFixed(2)}"),
                      trailing:
                          Text("x\$${widget.order.orderList[i].quantity}"),
                    ),
                  );
                },
                itemCount: widget.order.orderList.length,
              ),
            ),
        ],
      ),
    );
  }
}
