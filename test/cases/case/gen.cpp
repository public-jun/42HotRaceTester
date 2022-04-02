#include <iostream>
#include <string>

namespace std

int main()
{
	for (int i = 0; i < 10000; ++i)
	{
		string key;
		string value;
		key = "key" + i;
		value = "value" + i;
		cout << key << endl;
		cout << key << endl;
	}
}