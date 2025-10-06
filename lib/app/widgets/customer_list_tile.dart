import 'package:tallykhata/exports.dart';

class CustomerListTile extends StatelessWidget {
  final Map person;

  const CustomerListTile({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        child: Center(
          child: Text(
            person['name']
                .toString()
                .split(' ')
                .where((word) => word.isNotEmpty)
                .map((word) => word[0])
                .join(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      title: Text(
        person['name'],
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${person['duration']}',
      ),
      trailing: SizedBox(
        width: MediaQueryUtils.width * .2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${person['amount']}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: person['color'] == 'green'
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
