enum OrderStatus { completed, accepted, pending, inProgress, rejected }

extension OrderStatusExtension on OrderStatus {
  String get name {
    switch (this) {
      case OrderStatus.completed:
        return 'completed';
      case OrderStatus.accepted:
        return 'accepted';
      case OrderStatus.pending:
        return 'pending';
      case OrderStatus.inProgress:
        return 'in_progress';
      case OrderStatus.rejected:
        return 'rejected';
    }
  }
}
