FasdUAS 1.101.10   ��   ��    k             l     ��  ��      	Balthisar Tidy Test Suite     � 	 	 4 	 B a l t h i s a r   T i d y   T e s t   S u i t e   
  
 l     ��������  ��  ��        l     ��  ��    D >	Simple tests for Balthisar Tidy's AppleScript implementation.     �   | 	 S i m p l e   t e s t s   f o r   B a l t h i s a r   T i d y ' s   A p p l e S c r i p t   i m p l e m e n t a t i o n .      l     ��������  ��  ��        l     ��  ��     	Created by: Jim Derry     �   , 	 C r e a t e d   b y :   J i m   D e r r y      l     ��  ��    $ 	Created on: 04/19/14 09:47:16     �   < 	 C r e a t e d   o n :   0 4 / 1 9 / 1 4   0 9 : 4 7 : 1 6      l     ��������  ��  ��         l     �� ! "��   ! ! 	Copyright � 2014 Jim Derry    " � # # 6 	 C o p y r i g h t   �   2 0 1 4   J i m   D e r r y    $ % $ l     �� & '��   &  	All Rights Reserved    ' � ( ( ( 	 A l l   R i g h t s   R e s e r v e d %  ) * ) l     ��������  ��  ��   *  + , + l     ��������  ��  ��   ,  - . - p       / / ������ 0 
scriptpath 
scriptPath��   .  0 1 0 p       2 2 ������ 0 thesamplefile theSampleFile��   1  3 4 3 l     ��������  ��  ��   4  5 6 5 l     �� 7 8��   7 D >--------------------------------------------------------------    8 � 9 9 | - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 6  : ; : l     �� < =��   < 
 	run    = � > >  	 r u n ;  ? @ ? l     �� A B��   A D >--------------------------------------------------------------    B � C C | - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - @  D E D i      F G F I     ������
�� .aevtoappnull  �   � ****��  ��   G k     e H H  I J I l     �� K L��   K   configure these    L � M M     c o n f i g u r e   t h e s e J  N O N r      P Q P m      R R � S S 4 S a m p l e   D i r t y   D o c u m e n t . h t m l Q o      ���� &0 thesamplefilename theSampleFileName O  T U T l   �� V W��   V   end user configuration    W � X X .   e n d   u s e r   c o n f i g u r a t i o n U  Y Z Y l   ��������  ��  ��   Z  [ \ [ O     ] ^ ] k     _ _  ` a ` r     b c b c     d e d l    f���� f n     g h g m    ��
�� 
ctnr h 4    �� i
�� 
file i l  
  j���� j I  
 �� k��
�� .earsffdralis        afdr k  f   
 ��  ��  ��  ��  ��   e m    ��
�� 
TEXT c o      ���� 0 
scriptpath 
scriptPath a  l�� l r     m n m c     o p o l    q���� q b     r s r o    ���� 0 
scriptpath 
scriptPath s o    ���� &0 thesamplefilename theSampleFileName��  ��   p m    ��
�� 
TEXT n o      ���� 0 thesamplefile theSampleFile��   ^ m     t t�                                                                                  MACS  alis    n  
GreaterMac                 �Y��H+   �%
Finder.app                                                      �H�`��        ����  	                CoreServices    �Y/V      �`D     �% �   �  4GreaterMac:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p   
 G r e a t e r M a c  &System/Library/CoreServices/Finder.app  / ��   \  u v u l     ��������  ��  ��   v  w x w r     3 y z y I    /�� { |
�� .sysodlogaskr        TEXT { m     ! } } � ~ ~ * P l e a s e   c h o o s e   a   t e s t . | ��  �
�� 
btns  J   " ' � �  � � � m   " # � � � � �  S t a n d a r d   S u i t e �  � � � m   # $ � � � � �  D e v e l o p e r   S u i t e �  ��� � m   $ % � � � � �  Q u i t��   � �� ���
�� 
dflt � m   ( ) � � � � �  Q u i t��   z o      ���� 0 	thechoice 	theChoice x  ��� � Z   4 e � � � � � =  4 ? � � � n   4 ; � � � 1   7 ;��
�� 
bhit � o   4 7���� 0 	thechoice 	theChoice � m   ; > � � � � �  D e v e l o p e r   S u i t e � I   B G�������� 0 test_developer_suite  ��  ��   �  � � � =  J U � � � n   J Q � � � 1   M Q��
�� 
bhit � o   J M���� 0 	thechoice 	theChoice � m   Q T � � � � �  S t a n d a r d   S u i t e �  ��� � I   X `�� ����� 0 test_standard_suite   �  � � � o   Y Z���� &0 thesamplefilename theSampleFileName �  � � � o   Z [���� 0 
scriptpath 
scriptPath �  ��� � o   [ \���� 0 thesamplefile theSampleFile��  ��  ��   � L   c e����  ��   E  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � D >--------------------------------------------------------------    � � � � | - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �  	test_standard_suite    � � � � ( 	 t e s t _ s t a n d a r d _ s u i t e �  � � � l     �� � ���   � D >--------------------------------------------------------------    � � � � | - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � i     � � � I      �� ����� 0 test_standard_suite   �  � � � o      ���� &0 thesamplefilename theSampleFileName �  � � � o      ���� 0 
scriptpath 
scriptPath �  ��� � o      ���� 0 thesamplefile theSampleFile��  ��   � k    b � �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � 2 ,--------------------------------------------    � � � � X - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � l     �� � ���   �   Setup some stuff.    � � � � $   S e t u p   s o m e   s t u f f . �  � � � l     �� � ���   � ) #	We will use these filenames later.    � � � � F 	 W e   w i l l   u s e   t h e s e   f i l e n a m e s   l a t e r . �  � � � l     �� � ���   � 2 ,--------------------------------------------    � � � � X - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - �  � � � q       � � ������ 0 filenamebase fileNameBase��   �  � � � q       � � ������ &0 filenameextension fileNameExtension��   �  � � � q       � � ������  0 saveasfilename saveAsFilename��   �  � � � q       � � ������ "0 theopendocument theOpenDocument��   �  � � � q       � � ������  0 thenewdocument theNewDocument��   �  � � � l     ��������  ��  ��   �  � � � r      � � � m      � � � � �  . � 1    ��
�� 
txdl �  � � � l   ��������  ��  ��   �  � � � r     � � � c     � � � l    ����� � n     � � � 7  �� � �
�� 
citm � m    ����  � m    ������ � o    ���� &0 thesamplefilename theSampleFileName��  ��   � m    ��
�� 
ctxt � o      ���� 0 filenamebase fileNameBase �    r     c     l   ��� n     4    �~	
�~ 
citm	 m    �}�}  o    �|�| &0 thesamplefilename theSampleFileName��  �   m    �{
�{ 
ctxt o      �z�z &0 filenameextension fileNameExtension 

 r    & b    $ b    " o     �y�y 0 filenamebase fileNameBase m     ! �  - t e s t   s a v e   a s . o   " #�x�x &0 filenameextension fileNameExtension o      �w�w  0 saveasfilename saveAsFilename  r   ' . b   ' , b   ' * o   ' (�v�v 0 filenamebase fileNameBase m   ( ) � 0 - t e s t   s a v e   w h e n   c l o s i n g . o   * +�u�u &0 filenameextension fileNameExtension o      �t�t 20 savewhenclosingfilename saveWhenClosingFilename  l  / /�s�r�q�s  �r  �q    !  l  / /�p�o�n�p  �o  �n  ! "#" l  / /�m$%�m  $ 2 ,--------------------------------------------   % �&& X - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -# '(' l  / /�l)*�l  )   Run through the suite   * �++ ,   R u n   t h r o u g h   t h e   s u i t e( ,-, l  / /�k./�k  . 2 ,--------------------------------------------   / �00 X - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -- 121 l  / /�j�i�h�j  �i  �h  2 343 I   / 5�g5�f�g 0 okdialog okDialog5 6�e6 m   0 177 �88 P B a l t h i s a r   T i d y   w i l l   o p e n   a n d   ` a c t i v a t e ` .�e  �f  4 9:9 O  6 @;<; I  : ?�d�c�b
�d .miscactvnull��� ��� null�c  �b  < m   6 7==�                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  : >?> l  A A�a�`�_�a  �`  �_  ? @A@ I   A K�^B�]�^ 0 okdialog okDialogB C�\C b   B GDED b   B EFGF m   B CHH �II ` B a l t h i s a r   T i d y   w i l l   ` o p e n `   t h e   s a m p l e   d o c u m e n t   'G o   C D�[�[ &0 thesamplefilename theSampleFileNameE m   E FJJ �KK  . '�\  �]  A LML O  L XNON r   P WPQP l  P UR�Z�YR I  P U�XS�W
�X .aevtodocnull  �    alisS o   P Q�V�V 0 thesamplefile theSampleFile�W  �Z  �Y  Q o      �U�U "0 theopendocument theOpenDocumentO m   L MTT�                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  M UVU l  Y Y�T�S�R�T  �S  �R  V WXW I   Y c�QY�P�Q 0 okdialog okDialogY Z�OZ b   Z _[\[ b   Z ]]^] m   Z [__ �`` f B a l t h i s a r   T i d y   w i l l   ` s a v e `   t h e   s a m p l e   d o c u m e n t   a s   '^ o   [ \�N�N  0 saveasfilename saveAsFilename\ m   ] ^aa �bb  . '�O  �P  X cdc O  d tefe I  h s�Mgh
�M .coresavenull���     obj g o   h i�L�L "0 theopendocument theOpenDocumenth �Ki�J
�K 
kfili l  l oj�I�Hj b   l oklk o   l m�G�G 0 
scriptpath 
scriptPathl o   m n�F�F  0 saveasfilename saveAsFilename�I  �H  �J  f m   d emm�                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  d non l  u u�E�D�C�E  �D  �C  o pqp I   u }�Br�A�B 0 okdialog okDialogr s�@s m   v ytt �uu T B a l t h i s a r   T i d y   w i l l   ` m a k e `   a   n e w   d o c u m e n t .�@  �A  q vwv O  ~ �xyx r   � �z{z l  � �|�?�>| I  � ��=�<}
�= .corecrel****      � null�<  } �;~�:
�; 
kocl~ m   � ��9
�9 
docu�:  �?  �>  { o      �8�8  0 thenewdocument theNewDocumenty m   ~ �                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  w ��� l  � ��7�6�5�7  �6  �5  � ��� O  � ���� I  � ��4��3
�4 .corecnte****       ****� 2  � ��2
�2 
docu�3  � m   � ����                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  � ��� I   � ��1��0�1 0 okdialog okDialog� ��/� b   � ���� b   � ���� m   � ��� ��� H T h e   ` c o u n t `   o f   a l l   d o c u m e n t s   i s   n o w  � 1   � ��.
�. 
rslt� m   � ��� ���  .�/  �0  � ��� l  � ��-�,�+�-  �,  �+  � ��� I   � ��*��)�* 0 okdialog okDialog� ��(� m   � ��� ��� � B a l t h i s a r   T i d y   w i l l   ` d e l e t e `   t h e   n e w   d o c u m e n t   t h a t   w a s   r e c e n t l y   m a d e .�(  �)  � ��� O  � ���� I  � ��'��&
�' .coredelonull���     obj � o   � ��%�%  0 thenewdocument theNewDocument�&  � m   � ����                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  � ��� l  � ��$�#�"�$  �#  �"  � ��� O  � ���� I  � ��!�� 
�! .corecnte****       ****� 2  � ��
� 
docu�   � m   � ����                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  � ��� I   � ����� 0 okdialog okDialog� ��� b   � ���� b   � ���� m   � ��� ��� H N o w   t h e   ` c o u n t `   o f   a l l   d o c u m e n t s   i s  � 1   � ��
� 
rslt� m   � ��� ���  .�  �  � ��� l  � �����  �  �  � ��� O  � ���� I  � ����
� .coredoexnull���     ****� o   � ��� "0 theopendocument theOpenDocument�  � m   � ����                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  � ��� I   � ����� 0 okdialog okDialog� ��� b   � ���� m   � ��� ��� � B y   t h e   w a y ,   l e t ' s   t e s t   w h e t h e r   t h e   t e s t   d o c u m e n t   s t i l l   ` e x i s t s ` :  � l  � ����� c   � ���� 1   � ��
� 
rslt� m   � ��
� 
ctxt�  �  �  �  � ��� l  � �����  �  �  � ��� I   ��
��	�
 0 okdialog okDialog� ��� m   �� ��� x B a l t h i s a r   T i d y   w i l l   a t t e m p t   t o   ` p r i n t `   t h e   t e s t i n g   d o c u m e n t .�  �	  � ��� O  $��� Q  #���� I ���
� .aevtpdocnull���     ****� o  �� "0 theopendocument theOpenDocument� ���
� 
pdlg� m  �
� savoyes �  � R      �� ��
� .ascrerr ****      � ****�   ��  �  � m  	���                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  � ��� l %%��������  ��  ��  � ��� I  %-������� 0 okdialog okDialog� ���� m  &)�� ��� � B a l t h i s a r   T i d y   w i l l   a t t e m p t   t o   ` c l o s e `   t h e   t e s t i n g   d o c u m e n t   s a v i n g   i t   a s .��  ��  � ��� O .F��� I 2E����
�� .coreclosnull���     obj � o  23���� "0 theopendocument theOpenDocument� ����
�� 
savo� m  69��
�� savoyes � �����
�� 
kfil� l <?������ b  <?��� o  <=���� 0 
scriptpath 
scriptPath� o  =>���� 20 savewhenclosingfilename saveWhenClosingFilename��  ��  ��  � m  ./���                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  � ��� l GG��������  ��  ��  � ��� I  GO������� 0 okdialog okDialog� ���� m  HK�� ��� T B a l t h i s a r   T i d y   w i l l   ` q u i t `   w i t h o u t   s a v i n g .��  ��  � ��� O P`��� I T_�����
�� .aevtquitnull��� ��� null��  � �����
�� 
savo� m  X[��
�� savono  ��  � m  PQ���                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  � ���� l aa��������  ��  ��  ��   �    l     ��������  ��  ��    l     ��������  ��  ��    l     ��������  ��  ��    l     ��	��   D >--------------------------------------------------------------   	 �

 | - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  l     ����    	test_developer_suite()    � . 	 t e s t _ d e v e l o p e r _ s u i t e ( )  l     ����   D >--------------------------------------------------------------    � | - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  i     I      �������� 0 test_developer_suite  ��  ��   k     {  l     ��������  ��  ��    O    
 r    	 !  1    ��
�� 
JDpv! o      ���� 0 windowstatus windowStatus m     ""�                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��   #$# l   ��������  ��  ��  $ %&% Z    )'(��)' l   *����* o    ���� 0 windowstatus windowStatus��  ��  ( I    ��+���� 0 okdialog okDialog+ ,��, m    -- �.. f B a l t h i s a r   T i d y ' s   p r e f e r e n c e   w i n d o w   i s   a l r e a d y   o p e n .��  ��  ��  ) k    )// 010 I    ��2���� 0 okdialog okDialog2 3��3 m    44 �55 ` B a l t h i s a r   T i d y   w i l l   o p e n   t h e   p r e f e r e n c e s   w i n d o w .��  ��  1 6��6 O   )787 r   # (9:9 m   # $��
�� savoyes : 1   $ '��
�� 
JDpv8 m     ;;�                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  ��  & <=< l  * *��������  ��  ��  = >?> O  * 6@A@ r   . 5BCB l  . 3D����D c   . 3EFE 1   . 1��
�� 
JDpcF m   1 2��
�� 
ctxt��  ��  C o      ���� 0 
panelcount 
panelCountA m   * +GG�                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  ? HIH I   7 A��J���� 0 okdialog okDialogJ K��K b   8 =LML b   8 ;NON m   8 9PP �QQ & B a l t h i s a r   T i d y   h a s  O o   9 :���� 0 
panelcount 
panelCountM m   ; <RR �SS f   p r e f e r e n c e s   p a n e l s .   I   w i l l   c y c l e   t h r o u g h   t h e m   a l l .��  ��  I TUT l  B B��������  ��  ��  U VWV O   B gXYX k   F fZZ [\[ Y   F `]��^_��] k   P [`` aba r   P Ucdc o   P Q���� 0 i  d 1   Q T��
�� 
JDpnb e��e I  V [��f��
�� .sysodelanull��� ��� nmbrf m   V W���� ��  ��  �� 0 i  ^ m   I J���� _ o   J K���� 0 
panelcount 
panelCount��  \ g��g r   a fhih m   a b���� i 1   b e��
�� 
JDpn��  Y m   B Cjj�                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  W klk l  h h��������  ��  ��  l mnm I   h n��o���� 0 okdialog okDialogo p��p m   i jqq �rr b B a l t h i s a r   T i d y   w i l l   c l o s e   t h e   p r e f e r e n c e s   w i n d o w .��  ��  n sts O  o yuvu r   s xwxw m   s t��
�� savono  x 1   t w��
�� 
JDpvv m   o pyy�                                                                                      @ alis    R  
GreaterMac                 �Y��H+   �'?Balthisar Tidy.app                                              ��]�yH�        ����  	                Debug     �Y/V      �x�    ( �'? �'6 �&� �&a �� ޙ Y Y n� F�  �GreaterMac:Users: jderry: Library: Developer: Xcode: DerivedData: Balthisar_Tidy-dqexeytsm#A62661: Build: Products: Debug: Balthisar Tidy.app   &  B a l t h i s a r   T i d y . a p p   
 G r e a t e r M a c  �Users/jderry/Library/Developer/Xcode/DerivedData/Balthisar_Tidy-dqexeytsmdoacualipzthqgjxrjf/Build/Products/Debug/Balthisar Tidy.app  /    ��  t z��z l  z z��������  ��  ��  ��   {|{ l     ��������  ��  ��  | }~} l     ��������  ��  ��  ~ � l     ������  � D >--------------------------------------------------------------   � ��� | - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� l     ������  �  		okDialog   � ���  	 o k D i a l o g� ��� l     ������  � D >--------------------------------------------------------------   � ��� | - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -� ��� i    ��� I      ������� 0 okdialog okDialog� ���� o      ���� 0 
themessage 
theMessage��  ��  � k     �� ��� l     ��������  ��  ��  � ��� L     �� I    ����
�� .sysodlogaskr        TEXT� l    ������ c     ��� o     ���� 0 
themessage 
theMessage� m    �
� 
ctxt��  ��  � �~��
�~ 
btns� J    �� ��}� m    �� ���  O K�}  � �|��{
�| 
dflt� m    	�� ���  O K�{  � ��z� l   �y�x�w�y  �x  �w  �z  � ��v� l     �u�t�s�u  �t  �s  �v       �r������r  � �q�p�o�n
�q .aevtoappnull  �   � ****�p 0 test_standard_suite  �o 0 test_developer_suite  �n 0 okdialog okDialog� �m G�l�k���j
�m .aevtoappnull  �   � ****�l  �k  �  �  R�i t�h�g�f�e�d�c }�b � � ��a ��`�_�^�] ��\ ��[�i &0 thesamplefilename theSampleFileName
�h 
file
�g .earsffdralis        afdr
�f 
ctnr
�e 
TEXT�d 0 
scriptpath 
scriptPath�c 0 thesamplefile theSampleFile
�b 
btns
�a 
dflt�` 
�_ .sysodlogaskr        TEXT�^ 0 	thechoice 	theChoice
�] 
bhit�\ 0 test_developer_suite  �[ 0 test_standard_suite  �j f�E�O� *�)j /�,�&E�O��%�&E�UO�����mv��a  E` O_ a ,a   
*j+ Y _ a ,a   *���m+ Y h� �Z ��Y�X���W�Z 0 test_standard_suite  �Y �V��V �  �U�T�S�U &0 thesamplefilename theSampleFileName�T 0 
scriptpath 
scriptPath�S 0 thesamplefile theSampleFile�X  � 	�R�Q�P�O�N�M�L�K�J�R &0 thesamplefilename theSampleFileName�Q 0 
scriptpath 
scriptPath�P 0 thesamplefile theSampleFile�O 0 filenamebase fileNameBase�N &0 filenameextension fileNameExtension�M  0 saveasfilename saveAsFilename�L "0 theopendocument theOpenDocument�K  0 thenewdocument theNewDocument�J 20 savewhenclosingfilename saveWhenClosingFilename� - ��I�H�G�F7�E=�DHJ�C_a�B�At�@�?�>�=��<���;���:���9�8�7�6�5��4�3�2��1�0
�I 
txdl
�H 
citm�G��
�F 
ctxt�E 0 okdialog okDialog
�D .miscactvnull��� ��� null
�C .aevtodocnull  �    alis
�B 
kfil
�A .coresavenull���     obj 
�@ 
kocl
�? 
docu
�> .corecrel****      � null
�= .corecnte****       ****
�< 
rslt
�; .coredelonull���     obj 
�: .coredoexnull���     ****
�9 
pdlg
�8 savoyes 
�7 .aevtpdocnull���     ****�6  �5  
�4 
savo�3 
�2 .coreclosnull���     obj 
�1 savono  
�0 .aevtquitnull��� ��� null�Wc�*�,FO�[�\[Zk\Z�2�&E�O��l/�&E�O��%�%E�O��%�%E�O*�k+ O� *j 
UO*�%�%k+ O� 	�j E�UO*�%�%k+ O� �a ��%l UO*a k+ O� *a a l E�UO� *a -j UO*a _ %a %k+ O*a k+ O� �j UO� *a -j UO*a _ %a %k+ O� �j UO*a _ �&%k+ O*a  k+ O�  �a !a "l #W X $ %hUO*a &k+ O� �a 'a "a ��%a ( )UO*a *k+ O� *a 'a +l ,UOP� �/�.�-���,�/ 0 test_developer_suite  �.  �-  � �+�*�)�+ 0 windowstatus windowStatus�* 0 
panelcount 
panelCount�) 0 i  � "�(-�'4�&�%�$PR�#�"q�!
�( 
JDpv�' 0 okdialog okDialog
�& savoyes 
�% 
JDpc
�$ 
ctxt
�# 
JDpn
�" .sysodelanull��� ��� nmbr
�! savono  �, |� *�,E�UO� *�k+ Y *�k+ O� �*�,FUO� 	*�,�&E�UO*�%�%k+ O� " k�kh �*�,FOmj [OY��Ok*�,FUO*�k+ O� �*�,FUOP� � �������  0 okdialog okDialog� ��� �  �� 0 
themessage 
theMessage�  � �� 0 
themessage 
theMessage� �������
� 
ctxt
� 
btns
� 
dflt� 
� .sysodlogaskr        TEXT� ��&��kv��� OPascr  ��ޭ