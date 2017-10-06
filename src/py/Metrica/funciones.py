# coding=utf-8
import numpy as np
from tool._fixedInt import *
from sklearn.preprocessing import normalize


def maxpool(img_matrix):
    """
    :param img_matrix:
    :return:
    """
    shape = np.shape(img_matrix)
    out = np.zeros((shape[0] // 2, shape[1] // 2))
    for i in range(0, shape[0] - 1, 2):
        for j in range(0, shape[1] - 1, 2):
            out[i // 2, j // 2] = np.amax(img_matrix[i:i + 2, j:j + 2])
    return out


def cross_corr(input_matrix, kernel_matrix):
    """

    :param input_matrix:
    :param kernel_matrix:
    :return:
    """
    # CON MULTIPLY
    # shape retorna tupla de las diemsiones (M,N)
    shape_i = np.shape(input_matrix)
    shape_k = np.shape(kernel_matrix)
    # Creamos la matrix de salida iniciada en cero
    output_matrix = np.zeros(np.subtract(shape_i, shape_k) + (1, 1))  # Podria romperse si shape(kernel) > shape(input)

    for i in range(0, shape_i[0] - shape_k[0] + 1):
        for j in range(0, shape_i[1] - shape_k[1] + 1):
            output_matrix[i, j] = np.sum(np.multiply(input_matrix[i:i + shape_k[0], j:j + shape_k[1]], kernel_matrix))
    return output_matrix


def posProces(matrix):
    """
    lleva los valores de la matriz al rango (0-255)
    :param matrix: matriz con rango distinto
    :return: matrix con valores dentro del rango (0-255)
    """
    matrix -= np.min(matrix)
    matrix = matrix / np.max(matrix) * 255
    return matrix


def fix_append(vector):
    """
    retonra un vector con los valores fixed
    :param vector:
    :return:
    """
    fixed_vector = []
    for i in range(len(vector)):
        fixed_vector.append(vector[i].fValue)
    return fixed_vector


def fix_matriz(matriz, intWidth, fractWidth, signedMode, roundMode, saturateMode):
    """
    Lleva la matriz a punto fijo de acuerdo a los parametros pasados
    :param matriz: matriz para con distintos valores
    :param intWidth: cantidad total de bits
    :param fractWidth: cantidad de bist parte fraccionaria
    :param signedMode: modo signado un bit mas para el signo
    :param roundMode: modo redondeado,
    :param saturateMode: modo saturado
    :return: matrix con los valores
    """
    fixmatriz = []
    shape_m = np.shape(matriz)
    for i in range(0, shape_m[0]):
        fixmatriz.append(fix_append(arrayFixedInt(intWidth, fractWidth, matriz[i],
                                                  signedMode, roundMode, saturateMode)))
    return fixmatriz


def norm_m(matrix, norm):
    """
    Normaliza la matriz pasada con un formato float64 bits
    tipo de nomalizacion l1
    :param matrix:  {array-like, sparse matrix}, shape [n_samples, n_features]
    The data to normalize, element by element.
    scipy.sparse matrices should be in CSR format to avoid an un-necessary copy.
    :return: {array-like, sparse matrix}, shape [n_samples, n_features]
    Normalized input X.
    :param norm:  array, shape [n_samples] if axis=1 else [n_features]
    An array of norms along given axis for X. When X is sparse,
    a NotImplementedError will be raised for norm ‘l1’ or ‘l2’.
    l1 es la suma de todos sus numeros
    """
    return normalize(matrix.astype(numpy.float64), norm)


def potencia(matriz):
    """
    sacar potencia de un vector
    :param matriz:
    :return: float potencia de la matrix
    """
    shape = np.shape(matriz)
    power = 0.0
    for i in range(shape[0]):
        for j in range(shape[1]):
            power += matriz[i][j]**2
    return power


kernel = np.array(
    [
        [0, -1, 0],
        [-1, 1, 0],
        [0, -1, 0]
    ])

