#include <iostream>
#include "minhalib.h"

using namespace std;
using namespace exemplo;

int main(void) {
	string frase = "Olá mundo!";

	imprime(frase);
	cout << "Resultado da soma 5+6: " << soma(5,6) << endl;
	cout << "O maior valor entre 5 e 6: " << exemplo::max(5,6) << endl;

	return 0;
}