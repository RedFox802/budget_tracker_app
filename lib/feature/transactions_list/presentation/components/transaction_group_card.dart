import 'package:budget_tracker_app/common/domain/transition_list/model/transaction/transaction_entity.dart';
import 'package:budget_tracker_app/common/presentation/component/card_wrapper/card_circular_border_all_wrapper.dart';
import 'package:budget_tracker_app/feature/transactions_list/presentation/components/transaction_card.dart';
import 'package:budget_tracker_app/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class TransactionGroupCard extends StatefulWidget {
  const TransactionGroupCard({
    required this.groupName,
    required this.transactions,
    super.key,
  });

  final String groupName;

  final Iterable<TransactionEntity> transactions;

  @override
  State<TransactionGroupCard> createState() => _TransactionGroupCardState();
}

class _TransactionGroupCardState extends State<TransactionGroupCard> {
  bool isOpened = true;

  @override
  Widget build(BuildContext context) {
    final transactions = widget.transactions;
    if (transactions.isEmpty) return const SizedBox.shrink();

    final header = _TransactionGroupHeader._(
      title: widget.groupName,
      isOpened: isOpened,
      onTap: () {
        setState(() {
          isOpened = !isOpened;
        });
      },
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: CardCircularBorderAllWrapper(
        padding: const EdgeInsets.all(16),
        child: AnimatedCrossFade(
          duration: const Duration(milliseconds: 400),
          firstCurve: Curves.easeIn,
          secondCurve: Curves.easeIn,
          crossFadeState:
              isOpened ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          firstChild: header,
          secondChild: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              header,
              const SizedBox(height: 10),
              ...transactions.map(
                (e) => TransactionCard(transaction: e),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TransactionGroupHeader extends StatelessWidget {
  const _TransactionGroupHeader._({
    required this.title,
    required this.onTap,
    required this.isOpened,
  });

  final String title;

  final bool isOpened;

  final VoidCallback onTap;

  Widget get _icon => Icon(
        isOpened ? Icons.arrow_drop_up : Icons.arrow_drop_down_outlined,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextTheme.title,
          overflow: TextOverflow.ellipsis,
        ),
        const Spacer(),
        InkWell(
          overlayColor: MaterialStateColor.resolveWith(
            (states) => Colors.transparent,
          ),
          onTap: onTap,
          child: _icon,
        )
      ],
    );
  }
}
