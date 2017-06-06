#ifndef MINHALIB_H
#define MINHALIB_H

namespace exemplo {

	extern "C" void imprime(std::string frase);
	extern "C" int soma(int valorA, int valorB);

	template <typename T>
	T max (T a, T b) {
		return (a > b) ? a : b;
	}
}

#endif
