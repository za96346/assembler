;
; �t�X"8��LED(�@��)��ߪO"
;     P0�ұ���8��LED(��l���A:�̥�2�ӫG�F��l6��LED����),�öi��k�۪��ܤ�
;

	MOV	A,#11110000B
START:
	MOV	P0,A

	ACALL	DELAY100MS
	RR	A
	SJMP	START

	include delay.inc

	END
