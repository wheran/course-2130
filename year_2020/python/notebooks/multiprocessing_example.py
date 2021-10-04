import multiprocessing
import time


N = 10


def if_prime(x):
    if x <= 1:
        return 0
    elif x <= 3:
        return x
    elif x % 2 == 0 or x % 3 == 0:
        return 0
    i = 5
    while i**2 <= x:
        if x % i == 0 or x % (i + 2) == 0:
            return 0
        i += 6
    return x


if __name__ == '__main__':

    print(multiprocessing.cpu_count())

    start = time.time()
    answer = sum(map(if_prime, list(range(N))))
    print(f'elapsed time: {time.time() - start}: answer {answer}')

    for i in range(2, 16, 1):
        start = time.time()
        with multiprocessing.Pool(i) as process:
            answer = sum(process.map(if_prime, list(range(N))))
        print(f'n_processors: {i} elapsed time: {time.time() - start}: answer {answer}')
