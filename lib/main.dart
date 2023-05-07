import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'flutter 学习',
      home: HomePage(),
    );
  }
}
// // *****************************************自定义appbar

// class MyAppbar extends StatelessWidget {
//   // 自定义appbar
//   const MyAppbar({super.key, required this.title});

//   final Widget title;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56,
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       decoration: BoxDecoration(color: Colors.blue[900]),
//       child: Row(children: [
//         const IconButton(
//           icon: Icon(Icons.menu),
//           tooltip: '菜单',
//           onPressed: null,
//         ),
//         Expanded(child: title),
//         const IconButton(
//           onPressed: null,
//           tooltip: '搜索',
//           icon: Icon(Icons.search),
//         ),
//       ]),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   // 主页面
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Column(
//         children: [
//           MyAppbar(
//             title: Text(
//               style: Theme.of(context).primaryTextTheme.titleLarge,
//               '首页',
//             ),
//           ),
//           const Expanded(
//             child: Center(
//               child: Text('hello world'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // *****************************************自定义appbar

// // *****************************************Scaffold实现appbar
// class HomePage extends StatelessWidget {
//   // 编写homePage
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const IconButton(onPressed: null, icon: Icon(Icons.menu)),
//         title: const Text('首页'),
//         actions: const [IconButton(onPressed: null, icon: Icon(Icons.search))],
//       ),
//       body: const Center(child: Text('hello world')),
//       floatingActionButton: const FloatingActionButton(
//         onPressed: null,
//         tooltip: 'add',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
// // *****************************************Scaffold实现appbar

// // ***************************************** 自定义按钮
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: MyButton()),
//     );
//   }
// }

// class MyButton extends StatelessWidget {
//   const MyButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print('点击');
//       },
//       child: Container(
//         height: 50,
//         padding: const EdgeInsets.all(8),
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: Colors.blue[200],
//         ),
//         child: const Center(
//           child: Text('点击按钮'),
//         ),
//       ),
//     );
//   }
// }
// // ***************************************** 自定义按钮

// // **************************************** 计数器单组件实现
// class Counter extends StatefulWidget {
//   const Counter({super.key});

//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _counter = 0;
//   void _increment() {
//     setState(() {
//       ++_counter;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: _increment,
//             child: const Text('+1'),
//           ),
//           Text('Count: $_counter'),
//         ],
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Counter(),
//     );
//   }
// }
// // **************************************** 计数器单组件实现

// // **************************************** 计数器逻辑分离实现
// // tips.将状态提升在一个statefulWidget(Counter)中，
// // 然后编写一个无状态展示框组件(CounterDisplay)，一个无状态按钮组件(CounterButton)
// // 将两个组件嵌套在状态组件中(Counter),将Counter中的状态和回调分别传给Counter
// class CounterDisplay extends StatelessWidget {
//   // 显示框
//   const CounterDisplay({super.key, required this.count});
//   final int count;

//   @override
//   Widget build(BuildContext context) {
//     return Text('$count');
//   }
// }

// class CounterButton extends StatelessWidget {
//   const CounterButton({super.key, required this.onPressed});
//   final VoidCallback onPressed;
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(onPressed: onPressed, child: const Text('+1'));
//   }
// }

// class Counter extends StatefulWidget {
//   const Counter({super.key});

//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _count = 0;
//   void _increment() {
//     setState(() {
//       ++_count;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CounterDisplay(count: _count),
//           const SizedBox(
//             width: 16,
//           ),
//           CounterButton(onPressed: _increment)
//         ],
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Counter(),
//     );
//   }
// }
// // **************************************** 计数器逻辑分离实现

// ****************************************购物清单
// 列出购物清单 已经购买的划掉
class Product {
  const Product({required this.name});
  final String name;
}

typedef VoidCartChangedCallback = void Function(Product product, bool inCart);

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key,
      required this.inCart,
      required this.product,
      required this.onCartChanged});

  final bool inCart;
  final Product product;
  final VoidCartChangedCallback onCartChanged;

  Color _getColor(BuildContext c) {
    return inCart ? Colors.black54 : Theme.of(c).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext c) {
    if (!inCart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

// /// 测试ListItem使用的HomePage

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('购物清单'),
//       ),
//       body: Center(
//         child: ListItem(
//           product: const Product(name: 'Chips'),
//           inCart: false,
//           onCartChanged: (product, inCart) {},
//         ),
//       ),
//     );
//   }
// }

// /// 测试ListItem使用的HomePage

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key, required this.products});

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{}; // Set 去掉泛型声明为Map

  void _handlerCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('购物清单'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product) {
          return ListItem(
            inCart: _shoppingCart.contains(product),
            product: product,
            onCartChanged: _handlerCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ShoppingList(
      products: [
        Product(name: '蔬菜'),
        Product(name: '猪肉'),
        Product(name: '鸡腿'),
        Product(name: '老干妈'),
        Product(name: '小葱'),
      ],
    );
  }
}
// ****************************************购物清单


