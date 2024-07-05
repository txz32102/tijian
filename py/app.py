from flask import Flask, request, jsonify
import mysql.connector
from flask_cors import CORS
from datetime import datetime

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})

# Database configuration
db_config = {
    'user': 'root',
    'password': '123456',  # Replace with your MySQL root password
    'host': 'localhost',
    'database': 'tijian'
}


# Endpoint for user login
@app.route('/user/login', methods=['POST'])
def login():
    user_id = request.args.get('userId')
    password = request.args.get('password')

    if not user_id or not password:
        return jsonify({'code': 4000, 'message': 'User ID and password are required'}), 400

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        query = "SELECT * FROM user WHERE userId = %s AND password = %s"
        cursor.execute(query, (user_id, password))
        user = cursor.fetchone()

        if user:
            response_data = {
                'code': 1000,
                'data': user
            }
        else:
            response_data = {
                'code': 4001,
                'message': 'Invalid user ID or password'
            }

        cursor.close()
        conn.close()
        return jsonify(response_data)

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return jsonify({'code': 5000, 'message': str(err)}), 500


# Endpoint for user registration
@app.route('/user/register', methods=['POST'])
def register():
    try:
        user_data = request.form.to_dict()

        required_fields = ['userId', 'password', 'realName', 'gender', 'identityCard', 'birthday', 'userType']
        if not all(field in user_data for field in required_fields):
            return jsonify({'code': 4000, 'message': 'Missing required fields'}), 400

        # Convert birthday to correct format
        try:
            user_data['birthday'] = datetime.strptime(user_data['birthday'], "%Y-%m-%d").strftime("%Y-%m-%d")
        except ValueError as e:
            print(f"Date conversion error: {e}")
            return jsonify({'code': 4002, 'message': 'Invalid date format'}), 400

        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        check_query = "SELECT * FROM user WHERE userId = %s"
        cursor.execute(check_query, (user_data['userId'],))
        existing_user = cursor.fetchone()
        if (existing_user):
            return jsonify({'code': 1001, 'message': 'User ID already exists'}), 400

        insert_query = """
        INSERT INTO user (userId, password, realName, gender, identityCard, birthday, userType)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, (
            user_data['userId'], user_data['password'], user_data['realName'],
            user_data['gender'], user_data['identityCard'], user_data['birthday'], user_data['userType']
        ))
        conn.commit()

        cursor.close()
        conn.close()
        return jsonify({'code': 1000, 'message': 'Registration successful'})

    except mysql.connector.Error as err:
        print(f"Database Error: {err}")
        return jsonify({'code': 5000, 'message': str(err)}), 500
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({'code': 5000, 'message': str(e)}), 500


# Endpoint for fetching all hospitals
@app.route('/hospital/getAll', methods=['GET'])
def get_all_hospitals():
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        query = "SELECT * FROM hospital"
        cursor.execute(query)
        hospitals = cursor.fetchall()

        # Convert businessHours to string format if necessary
        for hospital in hospitals:
            if 'businessHours' in hospital and isinstance(hospital['businessHours'], bytes):
                hospital['businessHours'] = hospital['businessHours'].decode('utf-8')

        cursor.close()
        conn.close()
        return jsonify(hospitals)

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return jsonify({'code': 5000, 'message': str(err)}), 500


# Endpoint for fetching all set meals
@app.route('/setmeal/getAll', methods=['GET'])
def get_all_setmeals():
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        query = "SELECT * FROM setmeal"
        cursor.execute(query)
        setmeals = cursor.fetchall()

        cursor.close()
        conn.close()
        return jsonify({'code': 1000, 'data': setmeals})

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return jsonify({'code': 5000, 'message': str(err)}), 500


# Endpoint for adding a new order
@app.route('/orders/add', methods=['POST'])
def add_order():
    try:
        order_data = request.form.to_dict()

        required_fields = ['orderdate', 'userId', 'hpId', 'smId', 'state']
        if not all(field in order_data for field in required_fields):
            return jsonify({'code': 4000, 'message': 'Missing required fields'}), 400

        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        insert_query = """
        INSERT INTO orders (orderdate, userId, hpId, smId, state)
        VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(insert_query, (
            order_data['orderdate'], order_data['userId'], order_data['hpId'],
            order_data['smId'], order_data['state']
        ))
        conn.commit()

        cursor.close()
        conn.close()
        return jsonify({'code': 1000, 'message': 'Order added successfully'})

    except mysql.connector.Error as err:
        print(f"Database Error: {err}")
        return jsonify({'code': 5000, 'message': str(err)}), 500
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({'code': 5000, 'message': str(e)}), 500


# Endpoint for fetching reports by userId
@app.route('/reports/query', methods=['GET'])
def get_reports():
    user_id = request.args.get('userId')

    if not user_id:
        return jsonify({'code': 4000, 'message': 'User ID is required'}), 400

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        query = """
        SELECT o.orderId, o.orderDate, s.name 
        FROM orders o
        JOIN setmeal s ON o.smId = s.smId
        WHERE o.userId = %s
        """
        cursor.execute(query, (user_id,))
        reports = cursor.fetchall()

        cursor.close()
        conn.close()
        return jsonify({'code': 1000, 'data': reports})

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return jsonify({'code': 5000, 'message': str(err)}), 500


# Endpoint for fetching detailed result by orderId
@app.route('/getdetailresult/query', methods=['GET'])
def get_detail_result():
    order_id = request.args.get('orderId')

    if not order_id:
        return jsonify({'code': 4000, 'message': 'Order ID is required'}), 400

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        query = """
        SELECT cdr.*
        FROM cidetailedreport cdr
        WHERE cdr.orderId = %s
        """
        cursor.execute(query, (order_id,))
        details = cursor.fetchall()

        cursor.close()
        conn.close()
        return jsonify({'code': 1000, 'data': details})

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return jsonify({'code': 5000, 'message': str(err)}), 500


# Endpoint for fetching overall result by orderId
@app.route('/getreportresult/query', methods=['GET'])
def get_report_result():
    order_id = request.args.get('id')

    if not order_id:
        return jsonify({'code': 4000, 'message': 'Order ID is required'}), 400

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)

        query = """
        SELECT or.*
        FROM overallresult or
        WHERE or.orderId = %s
        """
        cursor.execute(query, (order_id,))
        report = cursor.fetchall()

        cursor.close()
        conn.close()
        return jsonify({'code': 1000, 'data': report})

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return jsonify({'code': 5000, 'message': str(err)}), 500

if __name__ == '__main__':
    app.run(port=9080, debug=True)
