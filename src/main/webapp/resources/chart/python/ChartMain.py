import socket
import multiprocessing
from socketserver import ThreadingTCPServer, StreamRequestHandler
from python.chart import *
import pythoncom

PORT = 9000
chartData = None

def worker(stockName):
    FastApi().makeChart(stockName, stockName)
    return


class RequestHandler(StreamRequestHandler):
    # 클라이언트와 연결되었을 때 호출되는 함수
    def handle(self):
        print("Connection From", self.client_address)
        conn = self.request  # 클라이언트와 연결된 소켓
        while True:
            try:
                msg = conn.recv(1024).decode('utf-8')
                print('자바에서 전송: '+msg)
                if msg == "":  # 클라이언트가 소켓을 close
                    conn.close()
                    print(self.client_address, "Disconnected")
                    break
                print(self.client_address, msg)
                #
                p = multiprocessing.Process(target=worker, args=(msg, ))
                p.start()
                p.join()
                print('추출완료')
                conn.send('complete\n'.encode())
                print(msg + ' 전송완료')


            except:  # 클라이언트가 프로그램을 강제 종료
                conn.close()
                print(self.client_address, "Disconnected")
                break


if __name__ == '__main__':
    server = ThreadingTCPServer(('192.168.0.53', PORT), RequestHandler)
    print("Listening On Port", PORT)
    # server객체 내부에서 accept시 Thread1개씩 배정
    server.serve_forever()