import 'package:flutter/material.dart';

class OrderStatusWidget extends StatefulWidget {
  const OrderStatusWidget({
    super.key,
    required this.orderStatus,
  });

  final bool orderStatus;
  @override
  State<OrderStatusWidget> createState() => _OrderStatusWidgetState();
}

class _OrderStatusWidgetState extends State<OrderStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102,
      height: 26,
      decoration: BoxDecoration(
        color: widget.orderStatus ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: widget.orderStatus
            ? const Text(
                'Pesanan Selesai',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
            : const Text(
                'Pesanan Gagal',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
