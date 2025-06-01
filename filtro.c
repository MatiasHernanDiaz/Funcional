#include <stdio.h>
#include <stdlib.h>

#define TAM 10 

int sumar_pares(int *arr, int len) {
    int suma = 0;
    for (int i = 0; i < len; i++) {
        if (arr[i] % 2 == 0) {
            suma += arr[i];
        }
    }
    return suma;
}

int main() {
    int numeros[TAM] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int suma_pares = sumar_pares(numeros, TAM);

    printf("La suma de los números pares es: %d\n", suma_pares);

    return 0;
}
