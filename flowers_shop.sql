PGDMP                         |            flowers_shop    12.19    12.19 /    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    16418    flowers_shop    DATABASE     �   CREATE DATABASE flowers_shop WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE flowers_shop;
                postgres    false            �            1259    16419 
   assistants    TABLE     �   CREATE TABLE public.assistants (
    assistant_id bigint NOT NULL,
    assistant_name character varying,
    assistant_post character varying
);
    DROP TABLE public.assistants;
       public         heap    postgres    false            �            1259    16425    assistants_assistant_id_seq    SEQUENCE     �   CREATE SEQUENCE public.assistants_assistant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.assistants_assistant_id_seq;
       public          postgres    false    202            ;           0    0    assistants_assistant_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.assistants_assistant_id_seq OWNED BY public.assistants.assistant_id;
          public          postgres    false    203            �            1259    16427    buyers    TABLE     `   CREATE TABLE public.buyers (
    buyer_id bigint NOT NULL,
    buyers_name character varying
);
    DROP TABLE public.buyers;
       public         heap    postgres    false            �            1259    16433    buyers_buyer_id_seq    SEQUENCE     |   CREATE SEQUENCE public.buyers_buyer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.buyers_buyer_id_seq;
       public          postgres    false    204            <           0    0    buyers_buyer_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.buyers_buyer_id_seq OWNED BY public.buyers.buyer_id;
          public          postgres    false    205            �            1259    16435    products    TABLE     �   CREATE TABLE public.products (
    product_id bigint NOT NULL,
    product_name character varying,
    product_price numeric(15,2),
    product_quantity integer
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    16441    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    206            =           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public          postgres    false    207            �            1259    16443    sales    TABLE     �   CREATE TABLE public.sales (
    sale_id bigint NOT NULL,
    sales_assisntant bigint NOT NULL,
    sales_product bigint NOT NULL,
    sales_buyer bigint NOT NULL,
    sales_quantity integer
);
    DROP TABLE public.sales;
       public         heap    postgres    false            �            1259    16446    sales_sale_id_seq    SEQUENCE     z   CREATE SEQUENCE public.sales_sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sales_sale_id_seq;
       public          postgres    false    208            >           0    0    sales_sale_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;
          public          postgres    false    209            �            1259    16448    sales_sales_assisntant_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_sales_assisntant_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.sales_sales_assisntant_seq;
       public          postgres    false    208            ?           0    0    sales_sales_assisntant_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.sales_sales_assisntant_seq OWNED BY public.sales.sales_assisntant;
          public          postgres    false    210            �            1259    16450    sales_sales_buyer_seq    SEQUENCE     ~   CREATE SEQUENCE public.sales_sales_buyer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.sales_sales_buyer_seq;
       public          postgres    false    208            @           0    0    sales_sales_buyer_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.sales_sales_buyer_seq OWNED BY public.sales.sales_buyer;
          public          postgres    false    211            �            1259    16452    sales_sales_product_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_sales_product_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.sales_sales_product_seq;
       public          postgres    false    208            A           0    0    sales_sales_product_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.sales_sales_product_seq OWNED BY public.sales.sales_product;
          public          postgres    false    212            �
           2604    16454    assistants assistant_id    DEFAULT     �   ALTER TABLE ONLY public.assistants ALTER COLUMN assistant_id SET DEFAULT nextval('public.assistants_assistant_id_seq'::regclass);
 F   ALTER TABLE public.assistants ALTER COLUMN assistant_id DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    16455    buyers buyer_id    DEFAULT     r   ALTER TABLE ONLY public.buyers ALTER COLUMN buyer_id SET DEFAULT nextval('public.buyers_buyer_id_seq'::regclass);
 >   ALTER TABLE public.buyers ALTER COLUMN buyer_id DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    16456    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    207    206            �
           2604    16457    sales sale_id    DEFAULT     n   ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);
 <   ALTER TABLE public.sales ALTER COLUMN sale_id DROP DEFAULT;
       public          postgres    false    209    208            �
           2604    16458    sales sales_assisntant    DEFAULT     �   ALTER TABLE ONLY public.sales ALTER COLUMN sales_assisntant SET DEFAULT nextval('public.sales_sales_assisntant_seq'::regclass);
 E   ALTER TABLE public.sales ALTER COLUMN sales_assisntant DROP DEFAULT;
       public          postgres    false    210    208            �
           2604    16459    sales sales_product    DEFAULT     z   ALTER TABLE ONLY public.sales ALTER COLUMN sales_product SET DEFAULT nextval('public.sales_sales_product_seq'::regclass);
 B   ALTER TABLE public.sales ALTER COLUMN sales_product DROP DEFAULT;
       public          postgres    false    212    208            �
           2604    16460    sales sales_buyer    DEFAULT     v   ALTER TABLE ONLY public.sales ALTER COLUMN sales_buyer SET DEFAULT nextval('public.sales_sales_buyer_seq'::regclass);
 @   ALTER TABLE public.sales ALTER COLUMN sales_buyer DROP DEFAULT;
       public          postgres    false    211    208            *          0    16419 
   assistants 
   TABLE DATA           R   COPY public.assistants (assistant_id, assistant_name, assistant_post) FROM stdin;
    public          postgres    false    202   C4       ,          0    16427    buyers 
   TABLE DATA           7   COPY public.buyers (buyer_id, buyers_name) FROM stdin;
    public          postgres    false    204   #5       .          0    16435    products 
   TABLE DATA           ]   COPY public.products (product_id, product_name, product_price, product_quantity) FROM stdin;
    public          postgres    false    206   �5       0          0    16443    sales 
   TABLE DATA           f   COPY public.sales (sale_id, sales_assisntant, sales_product, sales_buyer, sales_quantity) FROM stdin;
    public          postgres    false    208   c6       B           0    0    assistants_assistant_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.assistants_assistant_id_seq', 6, true);
          public          postgres    false    203            C           0    0    buyers_buyer_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.buyers_buyer_id_seq', 10, true);
          public          postgres    false    205            D           0    0    products_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_product_id_seq', 8, true);
          public          postgres    false    207            E           0    0    sales_sale_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.sales_sale_id_seq', 5, true);
          public          postgres    false    209            F           0    0    sales_sales_assisntant_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.sales_sales_assisntant_seq', 1, false);
          public          postgres    false    210            G           0    0    sales_sales_buyer_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.sales_sales_buyer_seq', 1, false);
          public          postgres    false    211            H           0    0    sales_sales_product_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sales_sales_product_seq', 1, false);
          public          postgres    false    212            �
           2606    16462    assistants assistants_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.assistants
    ADD CONSTRAINT assistants_pkey PRIMARY KEY (assistant_id);
 D   ALTER TABLE ONLY public.assistants DROP CONSTRAINT assistants_pkey;
       public            postgres    false    202            �
           2606    16464    buyers buyers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.buyers
    ADD CONSTRAINT buyers_pkey PRIMARY KEY (buyer_id);
 <   ALTER TABLE ONLY public.buyers DROP CONSTRAINT buyers_pkey;
       public            postgres    false    204            �
           2606    16466    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    206            �
           2606    16468    sales sales_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public            postgres    false    208            �
           2606    16469 !   sales sales_sales_assisntant_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_sales_assisntant_fkey FOREIGN KEY (sales_assisntant) REFERENCES public.assistants(assistant_id) NOT VALID;
 K   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_sales_assisntant_fkey;
       public          postgres    false    208    2722    202            �
           2606    16474    sales sales_sales_buyer_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_sales_buyer_fkey FOREIGN KEY (sales_buyer) REFERENCES public.buyers(buyer_id) NOT VALID;
 F   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_sales_buyer_fkey;
       public          postgres    false    204    208    2724            �
           2606    16479    sales sales_sales_product_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_sales_product_fkey FOREIGN KEY (sales_product) REFERENCES public.products(product_id) NOT VALID;
 H   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_sales_product_fkey;
       public          postgres    false    208    2726    206            *   �   x���K
�0���)z�N�a��PPJ�
zci���濑����]2���O2V��E�;:���"�Т�ǔz�RbI�ʽ�P�؉�%IgT��(�9(�?�#*�ы!�RJɇ�_�#�x��*�eք@��6
�wW�d���l�]���DGK�W��g�a�R�rn����Qx�u�&��W����QbַӋ����	�k      ,   �   x�=���0D��UP��B1(�	� @@*0�ED��w���9���y3$���*�'l{�a�XpBA��������[&|f"����@��L+�ѻ��d�L����4����{.�S���#�5���Gtݎ�_9�&��n~����k'�}c���P      .   x   x�3�0���_��ilj�g`�ih�e�ya���v^�ua���)H؜ˌ�¤.l��[���p�sd$�(��fg'�$�@��༰��M�]�Դh����W�  �0�      0   -   x�3�4�4�4�4�2�,8��, ˄ӌӈ�(g����� }f     